import logging
from django.core.management.base import BaseCommand, CommandError
from django_pyres.conf import settings

from optparse import make_option
from pyres.horde import Khan
from pyres import setup_pidfile

class Command(BaseCommand):
    option_list = BaseCommand.option_list + (
        make_option("--pool", type="int", dest="pool_size", default=0, help="Number of minions to spawn under the manager."),
        make_option('-l', '--log-level', dest='log_level', default='info', help='log level.  Valid values are "debug", "info", "warning", "error", "critical", in decreasing order of verbosity. Defaults to "info" if parameter not specified.'),
        make_option('-f', dest='logfile', help='If present, a logfile will be used.  "stderr", "stdout", and "syslog" are all special values.'),
    )
    help = 'Creates and runs a pyres manager and worker pool.'

    def handle(self, queue_list, **options):
        queues = queue_list.split(',')
        log_level = getattr(logging, options['log_level'].upper(), 'INFO')
        pool_size = options.get('pool_size')
        log_file = options.get('logfile')
        if pool_size == 0:
            pool_size = settings.PYRES_MANAGER_POOL_SIZE
        setup_pidfile(settings.PYRES_WORKER_PIDFILE)
        worker = Khan(
            pool_size=pool_size,
            queues=queues,
            server=settings.PYRES_HOST,
            password=settings.PYRES_PASSWORD,
            logging_level=log_level,
            log_file=log_file
        )
        worker.work()
        #Khan.run(
        #    pool_size=pool_size, 
        #    queues=queues, 
        #    server=settings.PYRES_HOST, 
        #    logging_level=log_level, 
        #    log_file=None)
