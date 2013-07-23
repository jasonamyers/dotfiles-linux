from django.contrib.auth.decorators import login_required
from django.shortcuts import get_object_or_404
from django.views.generic import ListView
from django.utils.translation import ugettext_lazy as _
from django.shortcuts import redirect, render
from django.conf import settings
from django.contrib import messages
from django.db.models import Q

if "django.contrib.messages" in settings.INSTALLED_APPS:
    from django.contrib.messages import add_message
else:
    def add_message(*args, **kwargs): pass

from letterbox.models import Notice

class NoticeListView(ListView):
    context_object_name = "notices"
    template_name = "letterbox/notices.html"

    def get_queryset(self):
        which = self.kwargs.get('which',None)
        if which:
            pass
        else:
            return Notice.objects.notices_for(self.request.user, archived=False)

@login_required
def detail(request, notice_id):
    notice = get_object_or_404(Notice, Q(pk=notice_id) & (Q(recipient=request.user) | Q(sender=request.user)))
    if not notice.read:
        notice.is_read()
    return render(request,"letterbox/detail.html",{"notice":notice})

@login_required
def notices(request):
    notices = Notice.objects.notices_for(request.user, archived=False, read=False)
    return render(request, "letterbox/notices.html",{"notices":notices})

@login_required
def all(request):
    notices = Notice.objects.notices_for(request.user)
    return render(request, "letterbox/notices.html",{"notices":notices,"view_type": "all"})

@login_required
def unread(request):
    notices = Notice.objects.notices_for(request.user, read=False)
    return render(request, "letterbox/notices.html",{"notices":notices,"view_type": "unread"})

@login_required
def archived(request):
    notices = Notice.objects.notices_for(request.user, archived=True)
    return render(request, "letterbox/notices.html",{"notices":notices,"view_type": "archived"})

def archive_notice(request, notice_id):
    notice = get_object_or_404(Notice, pk=notice_id)
    notice.archive()
    add_message(request, messages.INFO, _("Notice has been archived."))
    return redirect('letterbox_notices')

