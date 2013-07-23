from django.contrib import admin
from popover.models import Popover

class PopoverAdmin(admin.ModelAdmin):
    list_display = ('slug','title')

admin.site.register(Popover, PopoverAdmin)
