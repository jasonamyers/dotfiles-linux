from pyres.worker import Worker
from django import db
class DjangoWorker(Worker):
    def done_working(self, job):
        super(DjangoWorker, self).done_working(job)
        db.close_connection()

