# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AuthGroup(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.IntegerField(primary_key=True)
    group_id = models.IntegerField()
    permission_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group_id', 'permission_id'),)


class AuthPermission(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=255)
    content_type_id = models.IntegerField()
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type_id', 'codename'),)


class AuthUser(models.Model):
    id = models.IntegerField(primary_key=True)
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.IntegerField(primary_key=True)
    user_id = models.IntegerField()
    group_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'auth_user_groups'


class AuthUserUserPermissions(models.Model):
    id = models.IntegerField(primary_key=True)
    user_id = models.IntegerField()
    permission_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'


class CatItem(models.Model):
    id_item = models.SmallIntegerField()
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


class DjangoAdminLog(models.Model):
    id = models.IntegerField(primary_key=True)
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    id = models.IntegerField(primary_key=True)
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'


class DjangoMigrations(models.Model):
    id = models.IntegerField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class ErrorLinks(models.Model):
    url = models.TextField()

    class Meta:
        managed = False
        db_table = 'error_links'


class Items(models.Model):
    id_podcast = models.IntegerField()
    title_audio = models.TextField()
    description_audio = models.TextField(blank=True, null=True)
    audio = models.TextField()
    image_audio = models.TextField(blank=True, null=True)
    pubdata_audio = models.DateTimeField(blank=True, null=True)
    duration_audio = models.CharField(max_length=255, blank=True, null=True)
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


class KeywordsItems(models.Model):
    id_keyword_item = models.SmallIntegerField(primary_key=True)
    title_keyword = models.TextField()

    class Meta:
        managed = False
        db_table = 'keywords_items'


class Podcasts(models.Model):
    title_podcast = models.TextField(blank=True, null=True)
    description_podcast = models.TextField(blank=True, null=True)
    url_image_podcast = models.TextField(blank=True, null=True)
    author_podcast = models.TextField(blank=True, null=True)
    id_podcast = models.IntegerField(primary_key=True)

    class Meta:
        managed = False
        db_table = 'podcasts'


class PodcastsWithCategorys(models.Model):
    id_podcast = models.IntegerField(primary_key=True)
    id_category = models.SmallIntegerField()

    class Meta:
        managed = False
        db_table = 'podcasts_with_categorys'


class PodcastsWithKeywords(models.Model):
    id_podcast = models.IntegerField(primary_key=True)
    id_keyword = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'podcasts_with_keywords'


class SubcatItem(models.Model):
    id_item = models.SmallIntegerField(primary_key=True)
    title_subcategory = models.TextField()

    class Meta:
        managed = False
        db_table = 'subcat_item'


class SubcatPodcast(models.Model):
    id_podcast = models.IntegerField(primary_key=True)
    title_subcat = models.TextField()

    class Meta:
        managed = False
        db_table = 'subcat_podcast'


class UrlPodcasts(models.Model):
    id = models.AutoField(primary_key=True, default=1)
    url_podcast = models.TextField()
    status_podcast = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'url_podcasts'
