from django import template
from django.utils.html import mark_safe


register = template.Library()

@register.filter
def highlight(text, search):
    highlighted = text.lower().replace(search.lower(), '<span style="background-color: #FFFF00">{}</span>'.format(search.lower()))
    return mark_safe(highlighted.capitalize())


@register.filter
def len(data):
    return data.__len__()