from . import models
from django.db.models import Count
from django.db.models import Q



def get_main_podcasts(_from=12, _to=None, ):
    if _to:
        podcasts = models.Podcasts.objects.all().values().annotate(id_of_podcast_count=Count('id_of_podcast')).order_by('-id_of_podcast_count')[_from:_to]
    else:
        podcasts = models.Podcasts.objects.all().values().annotate(id_of_podcast_count=Count('id_of_podcast')).order_by('-id_of_podcast_count')[_from:]

    return podcasts


def get_podcasts_for_carousel(len=9): # должно делиться на три
    pod_list=[]
    podcasts = models.Podcasts.objects.all().values().annotate(id_of_podcast_count=Count('id_of_podcast')).order_by('-id_of_podcast_count')[3:len+3]
    for i in range(0, len, 3):
        pod_list.append([podcasts[i], podcasts[i+1], podcasts[i+2]])
    return pod_list


def get_podcasts_for_carousel_active(): # должно делиться на три
    podcasts = models.Podcasts.objects.all().values().annotate(id_of_podcast_count=Count('id_of_podcast')).order_by('-id_of_podcast_count')[:3]
    pod_list = []
    for i in range(0, 3, 3):
        pod_list.append([podcasts[i], podcasts[i+1], podcasts[i+2]])
    return pod_list


def get_podcast_full_info(id, return_podcast=False, return_cat=False, return_series=False):
    podcast = models.Podcasts.objects.all().filter(id_of_podcast=id).values()
    if return_podcast:
        return podcast
    series = models.Items.objects.all().filter(id_of_podcast=id).values()
    if return_series:
        return series
    cat_podcast = []
    cat_ids = models.PodcastsWithCategorys.objects.all().filter(id_of_podcast=id).values('id_of_category')
    for id in cat_ids:
        print(id['id_of_category'])
        tag = models.Categorys.objects.all().filter(id_of_category=int(id['id_of_category'])).values()
        try:
            cat_podcast.append(
                {
                    'id_of_category': tag[0]['id_of_category'],
                    'title_of_category': tag[0]['title_of_category']


                }
                )
        except Exception:
            print('err')
    if return_cat:
        return cat_podcast


def search_podcasts(search_str):
    podcasts = models.Podcasts.objects.filter(Q(title_of_podcast__icontains=search_str) |
                                              Q(description_of_podcast__icontains=search_str) |
                                              Q(author_of_podcast__icontains=search_str)).values()
    return podcasts


def search_category(tag_id):
    podcast_ids = models.PodcastsWithCategorys.objects.filter(id_of_category=tag_id).values('id_of_podcast')
    if podcast_ids.__len__() > 1:
        podcasts = []
        for id in podcast_ids:
            podcasts.append(models.Podcasts.objects.filter(id_of_podcast=id['id_of_podcast']).values()[0])
        return podcasts
    else:
        return 'NotFoundCat'


def get_series_full_info(podcast_id, series_id):
    return models.Items.objects.all().filter(id_of_podcast=podcast_id, id_of_item=series_id).values()