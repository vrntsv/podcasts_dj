from django.shortcuts import render
from django.shortcuts import render
from django.http import HttpResponse
from . import services
from . import models

def index_router(request):
    if request.method == 'GET':
        print('test', services.get_main_podcasts())

        return render(request, 'pd_backend/index.html',
                      {
                          'carousel_podcasts': services.get_podcasts_for_carousel(),
                          'carousel_podcasts_active': services.get_podcasts_for_carousel_active(),
                          'main_podcast': services.get_main_podcasts(),
                      }
                      )
    if request.method == 'POST':
        print(services.search_podcasts(request.POST.get('search_data')))
        return render(request, 'pd_backend/index.html',
                      {

                          'main_podcast': services.search_podcasts(request.POST.get('search_data')),
                      }
                      )
    return HttpResponse(status=405)


def podcast_router(request, podcast_id):
    print('teststes', services.get_podcast_full_info(id=podcast_id, return_series=True))
    if request.method == 'GET':
        return render(request, 'pd_backend/chanel.html',
            {
                'podcast': services.get_podcast_full_info(id=podcast_id, return_podcast=True),
                'tags': services.get_podcast_full_info(podcast_id, return_tags=True),
                'series': services.get_podcast_full_info(id=podcast_id, return_series=True)
            }
        )
    return HttpResponse(status=405)


def series_router(request, podcast_id, series_id):
    if request.method == 'GET':
        print('podcast id', podcast_id)
        print('serires id ', series_id)
        print(services.get_series_full_info(podcast_id, series_id))

        return render(request, 'pd_backend/series.html',
                      {'series': services.get_series_full_info(podcast_id, series_id)})



def tag_search(request, tag_id):
    services.search_tag(tag_id)
    return render(request, 'pd_backend/index.html',
                  {'main_podcast': services.search_tag(tag_id)})

# Create your views here.
