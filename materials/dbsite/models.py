from django.db import models
from django.template.defaultfilters import slugify
from django.contrib.auth.models import User

class Material(models.Model):
    material_type_id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=100)
