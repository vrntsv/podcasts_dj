from django import template
from django.utils.html import mark_safe
from pd_backend import models


register = template.Library()

@register.filter
def highlight(text, search):
    highlighted = text.lower().replace(search.lower(), '<span style="background-color: #FFFF00">{}</span>'.format(search.lower()))
    return mark_safe(highlighted.capitalize())


@register.filter
def len(data):
    return data.__len__()


@register.filter
def get_category_eng_name(id):
    print(models.Categorys.objects.filter(id_category=id).values('title_category')[0]['title_category'])
    return models.Categorys.objects.filter(id_category=id).values('title_category')[0]['title_category']