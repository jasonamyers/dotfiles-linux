from django.db import models
from django.contrib.auth.models import User
from django.utils.translation import ugettext_lazy as _
from django.template.loader import render_to_string

class NoticeManger(models.Manager):
    def notices_for(self, user, sent=False, **kwargs):
        if sent:
            lookup_kwargs = {"sender": user}
        else:
            lookup_kwargs = {"recipient": user}
        qs = self.filter(**lookup_kwargs)
        if 'archived' in kwargs:
            qs = qs.filter(archived=kwargs['archived'])
        if 'read' in kwargs:
            qs = qs.filter(read=kwargs['read'])
        return qs

    def unread_count_for(self, recipient):
        return self.notices_for(recipient, read=False).count()

    def archived(self, user):
        return self.notices_for(user, archived=True)

    def all_notices(self, user):
        return self.filter(recipient=user)


class Notice(models.Model):
    recipient = models.ForeignKey(User, related_name="recieved_notices", verbose_name=_("recipient"))
    sender = models.ForeignKey(User, null=True, related_name="sent_notices", verbose_name=_("sender"))
    subject = models.CharField(_("subject"), max_length=255)
    message = models.TextField(_("message"))
    created_ts = models.DateTimeField(_("created"), auto_now_add=True)
    read = models.BooleanField(_("read"), default=False)
    archived = models.BooleanField(_("archived"), default=False)

    objects = NoticeManger()

    def archive(self):
        self.archived = True
        self.save()

    def is_read(self):
        read = self.read
        if not read:
            self.read = True
            self.save()
        return read

    class Meta:
        ordering = ['-created_ts']
        verbose_name = _('notice')
        verbose_name_plural = _('notices')

    @classmethod
    def send(cls, sender, recipient, subject, template_name, context):
        message = render_to_string(template_name, context)
        notice = cls.objects.create(recipient=recipient, sender=sender, subject=subject, message=message)
        return notice

    @classmethod
    def send_notice(cls, sender, recipient, subject, message):
        notice = cls.objects.create(recipient=recipient, sender=sender, subject=subject, message=message)
        return notice
