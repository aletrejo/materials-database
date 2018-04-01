from django.db import models
from django.template.defaultfilters import slugify
from django.contrib.auth.models import User

class Material(models.Model):
    material_id = models.PositiveIntegerField(primary_key=True)
    name = models.CharField(max_length=100, blank=True, null=True)
    material_type = models.ForeignKey('MaterialType', models.DO_NOTHING)
    description = models.CharField(max_length=500, blank=True, null=True)
    location = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'material'


class MaterialProcessing(models.Model):
    material = models.ForeignKey(Material, models.DO_NOTHING)
    processing = models.ForeignKey('Processing', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'material_processing'


class MaterialProperty(models.Model):
    material = models.ForeignKey(Material, models.DO_NOTHING)
    property = models.ForeignKey('Property', models.DO_NOTHING)
    property_value = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'material_property'


class MaterialType(models.Model):
    material_type_id = models.PositiveIntegerField(primary_key=True)
    name = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'material_type'


class Processing(models.Model):
    processing_id = models.PositiveSmallIntegerField(primary_key=True)
    name = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'processing'


class Property(models.Model):
    property_id = models.PositiveSmallIntegerField(primary_key=True)
    property_type_id = models.PositiveSmallIntegerField()
    name = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'property'


class PropertyOption(models.Model):
    property = models.ForeignKey(Property, models.DO_NOTHING)
    state = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'property_option'


class PropertyType(models.Model):
    property_type_id = models.PositiveSmallIntegerField(primary_key=True)
    name = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'property_type'
