from django.contrib import admin

from letterbox.models import Notice

class NoticeAdmin(admin.ModelAdmin):
    list_display = ('recipient','subject','sender','created_ts','read','archived')
    list_filter = ('read', 'archived')

admin.site.register(Notice, NoticeAdmin)
