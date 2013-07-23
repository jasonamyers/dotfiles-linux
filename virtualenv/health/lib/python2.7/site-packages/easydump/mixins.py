import os
from optparse import make_option

from django.conf import settings
from django.core.management.base import BaseCommand
from django.db import models

from boto.s3.connection import S3Connection, OrdinaryCallingFormat

import dumpers

class Manifest(object):
    """
    Wrapper class that makes working with manifests easier.
    """
    def __init__(self, md, host, port):
        self.bucket_name = md.get('s3-bucket')
        self.database_name = md.get('database')
        self.exclude_models = md.get('exclude-models', [])
        self.extra_tables = md.get('extra-tables', [])
        self.jobs = md.get('jobs', 2)
        self.reduced_redundancy = md.get('reduced-redundancy', True)
        self.separate_files = md.get('separate-files', False)

        # Make compatible with namespaced models
        # A better solution is needed to properly handle models with the same name in different namespaces
        self.include_models = map(lambda s: s.split('.')[-1], md.get('include-models', None))

        self.bucket = self._get_bucket(host, port)
        self.database = self._get_database()
        self.tables = self._get_tables()

        dumper = self._get_dumper()
        self.dump_cmd = dumper.get_dump_cmd(self)
        self.restore_cmd = dumper.get_restore_cmd(self)

    def _get_bucket(self, host, port):
        if host and port:
            conn = S3Connection(settings.AWS_ACCESS_KEY, settings.AWS_SECRET_KEY,
                calling_format=OrdinaryCallingFormat(), is_secure=False, host=host, port=port)
        else:
            conn = S3Connection(settings.AWS_ACCESS_KEY, settings.AWS_SECRET_KEY)
        return conn.get_bucket(self.bucket_name)

    def _get_database(self):
        return settings.DATABASES[self.database_name]

    def _get_dumper(self):
        """
        Based on which kind of database theis manifest is for, get the proper
        dumper object.
        """
        engine = self.database['ENGINE']
        if 'postgis' in engine:
            return dumpers.PostgresDumper

        if 'postgresql' in engine:
            return dumpers.PostgresDumper

        if 'oracle' in engine:
            return dumpers.OracleDumper

        if 'mysql' in engine:
            return dumpers.MySQLDumper

    def _get_tables(self):
        """
        Return all the database tables that we are going to dump.
        """

        all_models = models.get_models()
        dump_tables = []

        for model in all_models:
            model_name = model.__name__
            table_name = model._meta.db_table

            if self.include_models:
                # if an included-models is given, only add models that are
                # listed there
                # FIXME: this line has can do different things based on
                #   whether included_models is a string or array
                add_to_dump = model_name in self.include_models
            else:
                # if no include-models is given, add everything, unless
                # explicitly excluded
                add_to_dump = model_name not in self.exclude_models

            if add_to_dump:
                dump_tables.append(table_name)

        return set(dump_tables + self.extra_tables)

class EasyDumpCommand(BaseCommand):
    """
    Common methods for all dump commands
    """

    option_list = BaseCommand.option_list + (
        make_option('--host', dest='host'),
        make_option('--port', type='int', dest='port'),
        )

    def get_manifest(self, name, host, port):
        try:
            manifest_dict = settings.EASYDUMP_MANIFESTS[name]
        except KeyError:
            raise KeyError("Can't find manifest, is it in EASYDUMP_MANIFESTS?")

        return Manifest(manifest_dict, host, port)
