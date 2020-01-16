from . import models
from django.db.models import Count


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


def get_podcast_full_info(id, return_podcast=False, return_tags=False, return_series=False):
    podcast = models.Podcasts.objects.all().filter(id_of_podcast=id).values()
    if return_podcast:
        return podcast
    series = models.Items.objects.all().filter(id_of_podcast=id).values()
    if return_series:
        return series
    tags_podcast = []
    keywords_ids_podcast = models.PodcastsWithKeywords.objects.all().filter(id_of_podcast=id).values('id_of_keyword')
    for id in keywords_ids_podcast:
        print(id['id_of_keyword'])
        tag = models.Keywords.objects.all().filter(id_of_keyword=int(id['id_of_keyword'])).values()
        try:
            tags_podcast.append(
                {
                    'id_of_keyword': tag[0]['id_of_keyword'],
                    'title_of_keyword': tag[0]['title_of_keyword']
                }
                )
        except Exception:
            print('err')
    if return_tags:
        return tags_podcast


def get_series_full_info(podcast_id, series_id):
    print()
    return models.Items.objects.all().filter(id_of_podcast=podcast_id, id_of_item=series_id).values()