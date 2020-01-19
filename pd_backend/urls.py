"""podcasts_dj URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from pd_backend import views

app_name = "pd_backend"


urlpatterns = [
    path('', views.index_router, name='index_url'),
    path('podcast?p_id=<int:podcast_id>', views.podcast_router, name='podcast_url'),
    path('podcast_series?p_id=<int:podcast_id>;s_id=<int:series_id>', views.series_router, name='series_url'),
    path('category?<int:category_id>', views.category_search_router, name='cat_url'),
    #path('tag?<int:tag_id>', views.tag_search, name='tag_url'),
]
