from . import models
from django.db.models import Count
import random
from django.db.models import Q

def dictfetchall(cursor):
    "Return all rows from a cursor as a dict"
    columns = [col[0] for col in cursor.description]
    return [
        dict(zip(columns, row))
        for row in cursor.fetchall()
    ]

def get_main_podcasts(_from=12, _to=None, ):
    if _to:
        podcasts = models.Podcasts.objects.all().values().annotate(id_podcast_count=Count('id_podcast')).order_by('-id_podcast_count')[_from:_to]
    else:
        podcasts = models.Podcasts.objects.all().values().annotate(id_podcast_count=Count('id_podcast')).order_by('-id_podcast_count')[_from:]

    return podcasts





def get_podcasts_for_carousel_active(): # должно делиться на три
    podcasts_id_dict = models.Podcasts.objects.all().values('id_podcast')
    podcasts_id_list = []
    print('\n\n\npodcasts_id_list - ', podcasts_id_list)
    for item in list(podcasts_id_dict):
        podcasts_id_list.append(item['id_podcast'])
    print('\n\n\npodcasts_id_list - ', podcasts_id_list)

    random_profiles_id_list = random.sample(podcasts_id_list, 3)
    print('\n\n\nrandom_profiles_id_list - ', random_profiles_id_list)
    podcasts = models.Podcasts.objects.filter(id_podcast__in=random_profiles_id_list).values()
    print(podcasts.__len__())
    return list(podcasts)


def get_podcasts_for_carousel(len=3): # должно делиться на три
    pod_list=[]
    for i in range(0, len):
        pod_list.append(get_podcasts_for_carousel_active())
    return pod_list


def get_podcast_full_info(id, return_podcast=False, return_cat=False, return_series=False):
    podcast = models.Podcasts.objects.all().filter(id_podcast=id).values()
    if return_podcast:
        return podcast
    series = models.Items.objects.all().filter(id_podcast=id).values()
    if return_series:
        return series
    cat_podcast = []
    cat_ids = models.PodcastsWithCategorys.objects.all().filter(id_podcast=id).values('id_category')
    for id in cat_ids:
        print(id['id_category'])
        tag = models.Categorys.objects.all().filter(id_category=int(id['id_category'])).values()
        try:
            cat_podcast.append(
                {
                    'id_category': tag[0]['id_category'],
                    'title_category': tag[0]['title_category']


                }
                )
        except Exception:
            print('err')
    if return_cat:
        return cat_podcast


def search_podcasts(search_str):
    # podcasts = models.Podcasts.objects.filter(Q(title_podcast__icontains=search_str) |
    #                                           Q(description_podcast__icontains=search_str) |
    #                                           Q(author_podcast__icontains=search_str)
    #                                           ).values()
    # podcasts = models.Podcasts.objects.raw('SELECT podcasts.* FROM podcasts '
    #                                        'JOIN items ON (podcasts.id_podcast=items.id_podcast)'
    #                                        ' WHERE podcasts.title_podcast LIKE "%s" '
    #                                        'OR podcasts.description_podcast LIKE "%s" '
    #                                        'OR podcasts.author_podcast LIKE "%s" '
    #                                        'OR items.title_audio LIKE "%s" '
    #                                        'OR items.description_audio LIKE "%s"', (search_str, search_str, search_str, search_str, search_str)
    #                                        )
    search_str = str('%' + search_str + '%')
    # query = 'SELECT podcasts.*,items.* FROM podcasts RIGHT JOIN items ON items.id_podcast=podcasts.id_podcast' \
    #         ' WHERE LOWER(podcasts.description_podcast) LIKE ("{}")' \
    #         ' OR LOWER(podcasts.title_podcast) ' \
    #         'LIKE ("{}") OR LOWER(podcasts.author_podcast) LIKE ("{}") OR LOWER(items.description_audio)' \
    #         ' LIKE ("{}") OR LOWER(items.title_audio) LIKE ("{}")'.format(search_str, search_str, search_str, search_str, search_str)

    chanels = 'SELECT podcasts.* FROM podcasts WHERE LOWER(podcasts.title_podcast) LIKE ("{}")' \
             ' OR LOWER(podcasts.description_podcast) LIKE ("{}")' \
              ' OR LOWER(podcasts.author_podcast) LIKE ("{}") '.format(search_str, search_str, search_str)
    items_title = 'SELECT podcasts.id_podcast, podcasts.title_podcast, podcasts.url_image_podcast, items.id_item, items.title_audio, items.description_audio FROM podcasts RIGHT JOIN items ON items.id_podcast=podcasts.id_podcast' \
            ' WHERE LOWER(items.title_audio) LIKE ("{}")' \
            ''.format(search_str)
    items_description = 'SELECT podcasts.id_podcast, podcasts.title_podcast, podcasts.url_image_podcast, items.id_item, items.title_audio, items.description_audio, items.image_audio FROM podcasts RIGHT JOIN items ON items.id_podcast=podcasts.id_podcast' \
            ' WHERE LOWER(items.description_audio) LIKE ("{}")' \
            ''.format(search_str)
    from django.db import connection
    cursor = connection.cursor()
    cursor.execute(chanels)
    pd_chanels = dictfetchall(cursor)
    cursor.execute(items_title)
    pd_items_title = dictfetchall(cursor)
    cursor.execute(items_description)
    pd_items_description = dictfetchall(cursor)
    cursor.close()
    return {'chanels': pd_chanels, 'items_title': pd_items_title, 'items_description': pd_items_description}


def search_category(tag_id):
    podcast_ids = models.PodcastsWithCategorys.objects.filter(id_category=tag_id).values('id_podcast')
    if podcast_ids.__len__() > 1:
        podcasts = []
        for id in podcast_ids:
            podcasts.append(models.Podcasts.objects.filter(id_podcast=id['id_podcast']).values()[0])
        return podcasts
    else:
        return 'NotFoundCat'


def get_cats_pd_id():
    data = {}
    podcasts = models.PodcastsWithCategorys.objects.all().values()
    print(podcasts)
    for p in podcasts:
        if p['id_podcast'] in data.keys():
            data[p['id_podcast']].update(
                {
                    p['id_category']:
                models.Categorys.objects.all().filter(id_category=p['id_category']).values()[0]['title_category']
                }
            )
        else:
            data.update({
                p['id_podcast']: {
                    p['id_category']:
                    models.Categorys.objects.all().filter(id_category=p['id_category']).values()[0]['title_category']
                }
            })
    return data


def get_cat_name_by_id(cat_id):
    return models.Categorys.objects.filter(id_category=cat_id).values()[0]['title_category']


def get_categories_for_index():
    data = []
    cats = models.Categorys.objects.all().values()
    cats_div_len = int(cats.__len__()/3)*3
    for i in range(0, cats_div_len, 3):
        data.append([cats[i], cats[i+1], cats[i+2]])
    return list(cats)


def get_series_full_info(podcast_id, series_id):
    return models.Items.objects.all().filter(id_podcast=podcast_id, id_item=series_id).values()