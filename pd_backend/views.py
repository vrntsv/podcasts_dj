from django.shortcuts import render
from django.shortcuts import render, redirect
from django.http import HttpResponse
from . import services
from . import models
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger


def index_redirect(request):
    return redirect('/ru')


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
                          'categories': services.get_categories_for_index(),
                          #'carousel_podcasts': services.get_podcasts_for_carousel(),
                          #'carousel_podcasts_active': services.get_podcasts_for_carousel_active(),
                          'main_podcast': main_podcast,
                      }
                      )
    if request.method == 'POST':
        print(services.search_podcasts(request.POST.get('search_data')))
        # for item in services.search_podcasts(request.POST.get('search_data'))['items']:
        #     if request.POST.get('search_data') in item['description_audio']:
        #         print('--------------------------------------')
        #         print('TRUE')
        #         print('ITEM ------>', item['description_audio'])
        #         print('SEARCH ------>', request.POST.get('search_data'))
        #         print('--------------------------------------')

        return render(request, 'pd_backend/index.html',
                      {
                          'categories': services.get_categories_for_index(),
                          'search_data': request.POST.get('search_data'),
                          'main_podcast': services.search_podcasts(request.POST.get('search_data'))['chanels'],
                          'items_title': services.search_podcasts(request.POST.get('search_data'))['items_title'],
                          'items_description': services.search_podcasts(request.POST.get('search_data'))['items_description'],
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
                #'categories_ids': services.get_podcast_full_info(podcast_id, return_cat_ids=True),
                'series': services.get_podcast_full_info(id=podcast_id, return_series=True),
                'series_count': services.get_podcast_full_info(id=podcast_id, return_series_count=True)
            }
        )
    return HttpResponse(status=405)


def series_router(request, podcast_id, series_id):
    if request.method == 'GET':
        print('podcast id', podcast_id)
        print('serires id ', series_id)
        print(services.get_series_full_info(podcast_id, series_id))

        return render(request, 'pd_backend/series.html',
                      {
                          'series': services.get_series_full_info(podcast_id, series_id),
                          'podcast_title': services.get_podcast_title_by_id(podcast_id),
                          'podcast_author': services.get_podcast_authour_by_id(podcast_id),
                          'podcast_categories': services.get_podcast_full_info(podcast_id, return_cat=True),
                      })


def category_search_router(request, category_id):
    print(services.get_cats_pd_id())

    return render(request, 'pd_backend/index.html',
                  {
                      'categories': services.get_categories_for_index(),
                      'search_data': services.get_cat_name_by_id(category_id),
                      'main_podcast': services.search_category(category_id),
                      'cats_by_id': services.get_cats_pd_id(),
                      'searched_cat_id': category_id,
                      'searched_cat_name': services.get_cat_name_by_id(category_id)
                   }
                  )

# Create your views here.
