# Стань стальной крысой
![Навигация между главами](https://ibb.co/fCtGnBz)
![Начальный экран](https://ibb.co/VH7Mczs)
![Боковое меню](https://ibb.co/pRsGtbx)

Мой первый проект на Flutter.

Скачать apk файл для андройда можно тут -> https://drive.google.com/file/d/1D9ASd6quQ-yZQ0TLNGFCPoSfg2jVdvn6/view?usp=sharing
ios версии пока нет, надо еще разобраться как юзать Xcode на windows :)

## Как я его писал

  Я без понятия что тут пишут) Так что напишу как его писал. 
  
  Задача стояла такая: перенести книжную версию книги квеста в приложение для телефона.
Вроде простой интерфейс: текст и кнопки перехода на следующую главу, на Flutter делается элементарно.

  Для начала я взял саму книгу, создал свой List список, назвал его TextStructure, он состоит из 2х элементов
строки и числа(номер главы). 

  Потом добавил 350 записей в созданный List<TextStructure>, тут можно было подумать побольше и распарсить текст,
чтобы он сам разбился на 350 записей и добавился в List, но на раздумие было бы потрачено не мало времени, а в ручную
я сделал это где то за 15-20 минут.
  
  Следующей задачей передо мной стоял вопрос, как парсить тексты главы, чтобы вытаскивать с них номер перехода, пару дней
придумывания алгоритма(вечер и утро) и уже освежаю в памяти регулярные выражения и тестирую на DartPade функцию захвата числа.

  Позже, разобравшись с этим вопросом и добавив его реализацию в приложении, пришлось отловить главы, в которых тебе нужно было вернуться на шаг назад и писать номер, куда это назад ведет. 
  
  И начался процесс редизайна и отладки приложения.
  
  В конце концов, помучился с загрузкой на гит, но это тоже полезный опыт.
  
  Хех, как же хорошо, что тут нет каких то ограничений и никто не будет придираться к оформлению, как в дипломе)
  
