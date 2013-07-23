from pyres import ResQ
from django.conf import settings
pyres = ResQ(getattr(settings,'PYRES_HOST','localhost:6379'),getattr(settings,'PYRES_PASSWORD',None))

class PyresMixin(object):
    @classmethod
    def enqueue(cls, *args):
        if settings.PYRES_USE_QUEUE:
            pyres.enqueue(cls, *args)
        else:
            cls.perform(*args)
