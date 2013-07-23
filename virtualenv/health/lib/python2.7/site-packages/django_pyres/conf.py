from django.conf import settings #noqa
from appconf import AppConf

class PyresConf(AppConf):
    HOST = "localhost:6379"
    PASSWORD = None
    USE_QUEUE=True
    WORKER_PIDFILE = None
    WORKER_INTERVAL = None
    WORKER_LOGFILE = None
    WORKER_TIMEOUT= None
    MANAGER_POOL_SIZE=2


    class Meta:
        prefix = 'pyres'
