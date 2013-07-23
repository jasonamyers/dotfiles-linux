from django.db import models

# Create your models here.
class Popover(models.Model):
    slug = models.SlugField()
    title = models.CharField(max_length=100)
    content = models.TextField()

