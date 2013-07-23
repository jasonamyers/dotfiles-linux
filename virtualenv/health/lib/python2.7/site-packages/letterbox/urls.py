from django.conf.urls.defaults import patterns, url


from letterbox.views import (
    archive_notice,
    notices,
    all,
    unread,
    archived,
    detail
)

urlpatterns = patterns('',
    url(r'^$', notices, name='letterbox_notices'),
    url(r'^all/$', all, name='letterbox_all'),
    url(r'^archived/$', archived, name='letterbox_archived'),
    url(r'^unread/$', unread, name='letterbox_unread'),
    url(r'^(?P<notice_id>\d+)/$', detail, name='letterbox_detail'),
    url(r'^archive/(?P<notice_id>\d+)/$',archive_notice, name='letterbox_archive'),
)
