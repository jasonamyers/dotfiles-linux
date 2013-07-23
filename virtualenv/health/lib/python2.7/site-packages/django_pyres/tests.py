"""
This file demonstrates writing tests using the unittest module. These will pass
when you run "manage.py test".

Replace this with more appropriate tests for your application.
"""

from django.test import TestCase
from django_pyres.decorators import job
from mock import patch
import redis

def sample_function(*args):
    return args

class DecoratorTest(TestCase):

    def setUp(self):
        self.decorated_function = job('test')(sample_function)

    def test_decoration(self):
        self.assertIsNotNone(getattr(self.decorated_function, 'perform'))
        self.assertIsNotNone(getattr(self.decorated_function, 'enqueue'))
        self.assertEqual(self.decorated_function.queue, 'test')
        self.assertTrue(callable(self.decorated_function))
        self.assertEqual(self.decorated_function.__name__, sample_function.__name__)

    def test_call(self):
        self.assertEqual(self.decorated_function(1, 2, 3, 4), (1, 2, 3, 4))

    @patch.object(redis.Redis, 'execute_command')
    def test_enqueue(self, MockRedis):
        self.decorated_function.enqueue('test', 'this')
        self.assertTrue(MockRedis.called)
