# Порядок слов в конструкции "Чудо, а не ребенок"
Стырина Соня

### Материалы
[Ссылка на таблицу с данными](https://github.com/...)  
[Ссылка на код, здесь целиком с комментарием](https://github.com/...) ( или ниже по тексту отдельными блоками )

## Рабочая гипотеза

В языке ... конструкция "..." чаще встречается при таких-то условиях, чем альтернативная ей конструкция "...". На выбор конструкции могут также оказывать влияние такие-то социолингвистические / лингвистические факторы.

не Y, а X

X, а не Y	чаще встречается с положительной тональностью

выбор X зависит от порядка слов в конструкции.

## Данные

### Материал исследования
Сколько и каких данных было взято, как они собирались.

корпус Russian Web 2011

не Y, а X   138 примеров

X, а не Y	163 примера

Из собранных ранее 612 примеров <i>не Y, а X</i> были выбраны 3 самых частотных одушевленных и 3 неодушевленных заполнения Y:
* человек, женщина, ребенок
* жизнь, отдых, работа

Данные <i>X, а не Y</i> собирались с помощью запросов <i>X, а не человек</i>; <i>X, а не жизнь</i> и т.д.

### Факторы выбора конструкции
Какая переменная является зависимой в дальнейшем анализе, от каких других переменных она предположительно зависит. Рекомендуется также обсудить независимость факторов, их корреляцию и т.д. Кроме того, можно обсудить, разметка каких параметров вызывала трудности.

зависимая переменная: порядок слов

переменные, влияющие на зависимую: выбор X, выбор Y, одушевленность Y, тональность.

независимость/корреляция факторов

трудности в разметке параметров: не всегда была очевидна тональность примера


## Анализ: дескриптивная статистика
В этом разделе располагаются таблицы, графики и обсуждение дистрибуции значений в отдельных переменных и взаимной дистрибуции пар переменных.
Рекомендуются гистограммы, density plots, боксплоты (или violin plots), метрики корреляции и статистической значимости. Если вы используете метрику хи-квадрат, не забывайте посчитать к ней effect size.

## Мультифакторный анализ
Здесь рекомендуется использовать один из следующих подходов к моделированию/анализу данных:  
* коллострукционный анализ (в сопоставлении с метриками из Schmid et al.)  
* дерево решений ( + случайный лес для выявления важности переменных (variable importance))  
* логистическая регрессия (привести примеры нескольких моделей, закончив оптимальной, в которой остаются только значимые факторы)  
* (множественный) анализ соответствий ((M)CA), возможно, в сочетании с кластеризацией/k-means  
Требуется показать output модели(ей) и привести графики

## Содержательный лингвистический анализ результатов статистического анализа
Без содержательного анализа факторов выбора конструкции (взаимодействия выделенных вами переменных, их значимости/важности) проект не будет считаться выполненным.   

## Обсуждение использованных квантитативных методов
Тут или ранее по ходу анализа нужно обсудить аккуратность (точность) классифицирующих моделей, classification power, adjusted R2, goodness of fit и т.п. -- стандартные показатели качества моделирования, а также важность / значимость факторов. 
В заключение вы можете предложить идеи по дальнейшей работе с данными и их статистическим анализом. 
