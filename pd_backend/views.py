from django.shortcuts import render
from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.http import HttpResponseRedirect
from . import services
from . import models
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger


def index_redirect(request):
    return HttpResponseRedirect('ru')

def index_router(request):
    if request.method == 'GET':
        main_podcast = services.get_main_podcasts()
        page = request.GET.get('page', 1)
        print(services.get_cats_pd_id())
        paginator = Paginator(main_podcast, 20)
        try:
            main_podcast = paginator.page(page)
        except PageNotAnInteger:
            main_podcast = paginator.page(1)
        except EmptyPage:
            main_podcast = paginator.page(paginator.num_pages)
        return render(request, 'pd_backend/index.html',
                      {
                          'carousel_podcasts': services.get_podcasts_for_carousel(),
                          'carousel_podcasts_active': services.get_podcasts_for_carousel_active(),
                          'main_podcast': main_podcast,
                      }
                      )
    if request.method == 'POST':
        print(services.search_podcasts(request.POST.get('search_data')))
        return render(request, 'pd_backend/index.html',
                      {
                          'search_data': request.POST.get('search_data'),
                          'main_podcast': services.search_podcasts(request.POST.get('search_data')),
                      }
                      )
    return HttpResponse(status=405)


def podcast_router(request, podcast_id):
    print('teststes', services.get_podcast_full_info(id=podcast_id, return_cat=True))
    if request.method == 'GET':
        return render(request, 'pd_backend/chanel.html',
            {
                'podcast': services.get_podcast_full_info(id=podcast_id, return_podcast=True),
                'categories': services.get_podcast_full_info(podcast_id, return_cat=True),
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



def category_search_router(request, category_id):
    print(services.get_cats_pd_id())

    return render(request, 'pd_backend/index.html',
                  {
                      'main_podcast': services.search_category(category_id),
                      'cats_by_id': services.get_cats_pd_id(),
                      'searched_cat_id': category_id,
                      'searched_cat_name': services.get_cat_name_by_id(category_id)
                   }
                  )

# Create your views here.
