from letterbox.models import Notice

def unread_count(request):
    if request.user.is_authenticated():
        return {
            'letterbox_unread_count': Notice.objects.unread_count_for(request.user),
        }
    else:
        return {}
