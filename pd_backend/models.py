# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class CatOfItem(models.Model):
    id_item = models.SmallIntegerField(primary_key=True)
    title_category = models.TextField()

    class Meta:
        managed = False
        db_table = 'cat_item'


class Categorys(models.Model):
    id_category = models.SmallIntegerField(primary_key=True)
    title_category = models.TextField()

    class Meta:
        managed = False
        db_table = 'categorys'


class Items(models.Model):
    id_podcast = models.IntegerField()
    title_audio = models.TextField()
    description_audio = models.TextField(blank=True, null=True)
    audio = models.TextField()
    image_audio = models.TextField(blank=True, null=True)
    pubdata_audio = models.DateTimeField(blank=True, null=True)
    duration_audio = models.TimeField(blank=True, null=True)
    id_item = models.AutoField(primary_key=True)

    class Meta:
        managed = False
        db_table = 'items'


class ItemsWithKeywords(models.Model):
    id_item = models.IntegerField()
    id_keyword = models.SmallIntegerField()

    class Meta:
        managed = False
        db_table = 'items_with_keywords'


class Keywords(models.Model):
    id_keyword = models.AutoField(primary_key=True)
    title_keyword = models.TextField()

    class Meta:
        managed = False
        db_table = 'keywords'


class KeywordsOfItems(models.Model):
    id_keyword_item = models.SmallIntegerField(primary_key=True)
    title_keyword = models.TextField()

    class Meta:
        managed = False
        db_table = 'keywords_items'


class Podcasts(models.Model):
    title_podcast = models.TextField()
    description_podcast = models.TextField(blank=True, null=True)
    url_image_podcast = models.TextField()
    author_podcast = models.TextField(blank=True, null=True)
    id_podcast = models.AutoField(primary_key=True)

    class Meta:
        managed = False
        db_table = 'podcasts'


class PodcastsWithCategorys(models.Model):
    id_podcast = models.IntegerField()
    id_category = models.SmallIntegerField()

    class Meta:
        managed = False
        db_table = 'podcasts_with_categorys'


class PodcastsWithKeywords(models.Model):
    id_podcast = models.IntegerField()
    id_keyword = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'podcasts_with_keywords'


class SubcatOfItem(models.Model):
    id_item = models.SmallIntegerField()
    title_subcategory = models.TextField()

    class Meta:
        managed = False
        db_table = 'subcat_item'


class SubcatOfPodcast(models.Model):
    id_podcast = models.IntegerField()
    title_subcat = models.TextField()

    class Meta:
        managed = False
        db_table = 'subcat_podcast'


class UrlOfPodcasts(models.Model):
    url_podcast = models.TextField()
    status_podcast = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'url_podcasts'
