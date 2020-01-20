from django.contrib import admin
from .models import UrlPodcasts, ErrorLinks
from django import forms



class UrlForm(forms.ModelForm):
    class Meta:
        model = UrlPodcasts
        fields = ['url_podcast']

    def clean(self):
        url = self.cleaned_data.get('url_podcast')
        print(url)
        for err_url in ErrorLinks.objects.all().values('url'):
            if url == err_url['url']:
                raise forms.ValidationError("Ссылка в списке некорректных")
        return self.cleaned_data


@admin.register(UrlPodcasts)
class UrlPodcastsAdmin(admin.ModelAdmin):
    form = UrlForm
    list_display = ('id', 'url_podcast',)


