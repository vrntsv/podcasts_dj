import threading
import requests
import util
import func_for_clear_text


def pre_parse():
    """
        Фукнкция которая парсит все url'ы с бд, и под каждый url выделяет поток, после чего парсит
        с url'a инфу.
    """
    for each_podcast in util.check_new_podcast():  # проходимся по ВСЕМ подкастам
        if each_podcast.get('status_of_podcast') == 2:  # если подкаст нуждается в полной записи
            threading.Thread(target=parse, args=(each_podcast.get('url_of_podcast'), )).start()
            # parse(each_podcast.get('url_of_podcast'))


def parse(each_podcast):
    """
        Качаем ВСЕ выпуски данного подкаста, выпуск который уже есть в бд пропускаем.
        В конце, после закачки ВСЕХ выпусков, ставим статус 3, который оповещает о полной
        скаченности подкаста.
    """

    html = requests.get(each_podcast).content.decode('utf-8')     # получаем саму ленту

    pre_item_html = html[:html.find('<item>')]  # записываем в ленте часть перед выпусками (для быстрдействия?)

    # находим название подкаста
    title_of_podcast = pre_item_html[pre_item_html.find('<title>') + 7: pre_item_html.find('</title>')]
    title_of_podcast = func_for_clear_text.check_on_shit(title_of_podcast)  # название пригодится при парсинге выпуском

    html = html[html.find('<item>'):]   # обрезаем весь html до item

    while html.find('<item>') > -1:    # до тех пор пока находим новый выпуск
        # получаем блок с этим itemом, чтоб работать не по всей странице
        item_code = html[html.find('<item>') + 7: html.find('</item>')]

        # получаем название выпуска
        title_of_item = item_code[item_code.find('<title>') + 7: item_code.find('</title>')]
        title_of_item = func_for_clear_text.check_on_shit(title_of_item)

        # переходим в тег с ссылкой на аудио
        enclosure = item_code[item_code.find('<enclosure'):]
        enclosure = enclosure[enclosure.find('url="') + 5:enclosure.find('/>')]
        mp3 = enclosure[: enclosure.find('"')]  # получаем аудио

        if util.check_item(title_of_item, title_of_podcast, mp3):    # если такой выпуск уже есть, не выходим, а просто его пропускаем
            html = html[html.find('</item>') + 7:]  # режем ту строку с которой отработали, и идем далее
            continue

        # получаем описание выпуска
        description_of_item = None
        if item_code.find('description') > -1:
            description_of_item = func_for_clear_text.parse_description(item_code)

        # получаем дату публикации выпуска
        pubdata_of_item = func_for_clear_text.clear_pubdata(item_code[item_code.find('<pubDate>') + 14: item_code.find('</pubDate>') - 6])

        # получаем область с длительностью аудио
        duration_of_item = str()
        if item_code.find('duration>') > -1:
            temp_code = item_code[item_code.find('duration>') + 9: item_code.find('duration>') + 20]
            duration_of_item = temp_code[:temp_code.find('</')]    # получаем длительность аудио
            if duration_of_item and duration_of_item.find(':') == -1:     # проверяем разделено ли время : (иначе оно указано в секундах)
                duration_of_item = func_for_clear_text.convert_of_time(int(duration_of_item))

        # получаем картинку выпуска если такова есть
        image_of_item = str()
        if item_code.find('image ') > -1 and item_code.find('"image"') == -1:
            temp_code = item_code[item_code.find('image ') + 6:]
            temp_code = temp_code[temp_code.find('href="') + 6:]
            image_of_item = temp_code[: temp_code.find('"')]

        categorys_of_item, subcategorys_of_item = func_for_clear_text.parse_category(item_code[:item_code.find('</item>')])

        # находим ключевые слова если они есть
        keyword_of_item = str()
        if item_code.find('keywords>') > -1:  # если есть ключевые слова
            keyword_of_item = func_for_clear_text.parse_keywords(item_code[:item_code.find('</item>')])
        util.set_new_item(title_of_podcast, title_of_item, description_of_item, mp3, image_of_item,
                          pubdata_of_item, duration_of_item, categorys_of_item, subcategorys_of_item, keyword_of_item)
        html = html[html.find('</item>') + 7:]   # режем ту строку с которой отработали, и идем далее
        # print('Название выпуска: ' + title_of_item + '\n',
        #       'Описание выпуска: ' + description_of_item + '\n',
        #       'Музыка: ' + mp3 + '\n',
        #       'Дата публикации выпуска: ' + pubdata_of_item + '\n',
        #       'Длительность выпуска: ' + duration_of_item + '\n',
        #       'Картинка выпуска: ' + image_of_item + '\n',
        #       'Категории выпуска: ', categorys_of_item , '\n',
        #       'Подкатегории выпуска: ', subcategorys_of_item , '\n',
        #       'Ключевые слова выпуска: ', keyword_of_item , '\n',
        #       )

    util.change_of_status(each_podcast, 3)


if __name__ == '__main__':
    pre_parse()
