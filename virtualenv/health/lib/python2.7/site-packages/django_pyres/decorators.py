from functools import update_wrapper
from django_pyres.conf import settings
from django import db
from .core import pyres


def close_connection_after(func):
    def wrapper(*args, **kwargs):
        result = func(*args, **kwargs)
        if settings.PYRES_USE_QUEUE:
            db.close_connection()
        return result
    update_wrapper(wrapper, func)
    return wrapper

class Job(object):
    """
Class that wraps a function to enqueue in pyres
"""
    _resque_conn = pyres

    def __init__(self, func, queue):
        self.func = close_connection_after(func)
        #self.priority = priority

        # Allow this class to be called by pyres
        self.queue = str(queue)
        self.perform = self.func

        # Wrap func
        update_wrapper(self, func)

    # _resque wraps the underlying resque connection and delays initialization
    # until needed
    @property
    def _resque(self):
        return self._resque_conn

    @_resque.setter # NOQA
    def _resque(self, val):
        self._resque_conn = val

    def enqueue(self, *args, **kwargs):
        if settings.PYRES_USE_QUEUE:
            queue = kwargs.pop('queue', self.queue)
            if kwargs:
                raise Exception("Cannot pass kwargs to enqueued tasks")
            class_str = '%s.%s' % (self.__module__, self.__name__)
            self._resque.enqueue_from_string(class_str, queue, *args)
        else:
            return self.func(*args, **kwargs)

    def enqueue_at(self, dt, *args, **kwargs):
        queue = kwargs.pop('queue', self.queue)
        if kwargs:
            raise Exception('Cannot pass kwargs to enqueued tasks')
        class_str = '%s.%s' % (self.__module__, self.__name__)
        self._resque.enqueue_at_from_string(dt, class_str, queue, *args)

    def __call__(self, *args, **kwargs):
        return self.func(*args, **kwargs)

    def __repr__(self):
        return 'Job(func=%s, queue=%s)' % (self.func, self.queue)


def job(queue, cls=Job):
    def _task(f):
        return cls(f, queue)
    return _task

