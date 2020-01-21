from django.contrib import admin
from .models import UrlPodcasts, ErrorLinks
from django import forms
from django.db.utils import IntegrityError
from django.shortcuts import render, redirect

from django.contrib.auth.models import Group, User




class UrlForm(forms.ModelForm):
    class Meta:
        model = UrlPodcasts
        fields = ['url_podcast']

    def clean(self):
        f_urls = self.cleaned_data.get('url_podcast').split('\n')
        urls = []
        [urls.append(item.strip('\r')) for item in f_urls if item.strip('\r') not in urls]
        print('urls', urls)
        print(urls)
        for err_url in ErrorLinks.objects.all().values('url'):
            for url in urls:
                if url.strip('\r') == err_url['url']:
                    raise forms.ValidationError("Ссылка {} в списке некорректных".format(url.strip('\r')))
        print(UrlPodcasts.objects.all().values('url_podcast'))
        for err_url in UrlPodcasts.objects.all().values('url_podcast'):
            for url in urls:
                print(url, err_url, '\n')
                if url.strip('\r') == err_url['url_podcast']:
                    raise forms.ValidationError("Ссылка {} уже есть в таблице".format(url.strip('\r')))
        return self.cleaned_data



@admin.register(UrlPodcasts)
class UrlPodcastsAdmin(admin.ModelAdmin):
    form = UrlForm
    list_display = ('id', 'url_podcast',)

    def save_model(self, request, obj, form, change):
        f_data = form.cleaned_data['url_podcast'].split('\n')
        data = []
        [data.append(item.strip('\r')) for item in f_data if item.strip('\r') not in data]
        print(data)

        for i in data:

            new_url = UrlPodcasts(url_podcast=i.strip('\r'))
            new_url.save()



admin.site.site_header = "TgPodcasts Admin"
admin.site.site_title = "TgPodcasts Admin"
admin.site.index_title = "Добро пожаловать в админ панель"
admin.site.unregister(Group)
admin.site.unregister(User)


