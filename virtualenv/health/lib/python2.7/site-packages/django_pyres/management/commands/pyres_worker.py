import logging
from django.core.management.base import BaseCommand, CommandError
from django_pyres.conf import settings

from optparse import make_option
from pyres.worker import Worker
from pyres import setup_logging, setup_pidfile

class Command(BaseCommand):
    option_list = BaseCommand.option_list + (
        make_option('-l', '--log-level', dest='log_level', default='info', help='log level.  Valid values are "debug", "info", "warning", "error", "critical", in decreasing order of verbosity. Defaults to "info" if parameter not specified.'),
    )
    help = 'Creates a pyres worker'

    def handle(self, queue_list, **options):
        queues = queue_list.split(',')
        log_level = getattr(logging, options['log_level'].upper(), 'INFO')
        setup_logging(procname="pyres_worker", log_level=log_level, filename=None)
        setup_pidfile(settings.PYRES_WORKER_PIDFILE)
        interval = settings.PYRES_WORKER_INTERVAL
        worker = Worker(
            queues=queues,
            server=settings.PYRES_HOST,
            password=settings.PYRES_PASSWORD,
            timeout=settings.PYRES_WORKER_TIMEOUT
        )
        if interval is not None:
            worker.work(interval)
        else:
            worker.work()

