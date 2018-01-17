# Порядок слов в конструкции "Чудо, а не ребенок"
Стырина Соня

### Материалы
[Таблица с данными](https://github.com/phuuda/ConstrGrammarProject/blob/master/all_together.csv)  
[Ссылка на код, здесь целиком с комментарием](https://github.com/...) ( или ниже по тексту отдельными блоками )

## Рабочая гипотеза

В языке ... конструкция "..." чаще встречается при таких-то условиях, чем альтернативная ей конструкция "...". На выбор конструкции могут также оказывать влияние такие-то социолингвистические / лингвистические факторы.

* В русском языке оценочная конструкция <i>X, а не Y</i>	чаще встречается с положительной тональностью, чем <i>не Y, а X</i>.
* Выбор X влияет на порядок слов в конструкции: определенная частотная оценка тяготеет к определенному порядку слов.
* Выбор Y влияет на порядок слов в конструкции: определенный оцениваемый объект тяготеет к определенному порядку слов.

## Данные

### Материал исследования
Из собранных ранее 612 примеров <i>не Y, а X</i> были выбраны 3 самых частотных одушевленных и 3 неодушевленных заполнения Y:
* человек, женщина, ребенок
* жизнь, отдых, работа

Данные <i>X, а не Y</i> собирались с помощью запросов <i>X, а не человек</i>; <i>X, а не жизнь</i> и т.д. в корпусе Russian Web 2011:

* <i>не Y, а X</i> -- 138 примеров
* <i>X, а не Y</i> -- 163 примера

Разметка параметров произведена вручную (определение тональности) и автоматически (см. файл [rus_data_proc.py](https://github.com/phuuda/ConstrGrammarProject/blob/master/rus_data_proc.py)).

### Факторы выбора конструкции
Какая переменная является зависимой в дальнейшем анализе, от каких других переменных она предположительно зависит. Рекомендуется также обсудить независимость факторов, их корреляцию и т.д. Кроме того, можно обсудить, разметка каких параметров вызывала трудности.

<b>зависимая переменная</b>: порядок слов<br />
<b>переменные, влияющие на зависимую</b>:
* выбор X
* выбор Y
* одушевленность Y
* тональность конструкции

независимость/корреляция факторов: кореляция между одушевленностью & тональностью?<br />

трудности в разметке параметров: не всегда была очевидна тональность примера


## Анализ: дескриптивная статистика
В этом разделе располагаются таблицы, графики и обсуждение дистрибуции значений в отдельных переменных и взаимной дистрибуции пар переменных.
Рекомендуются гистограммы, density plots, боксплоты (или violin plots), метрики корреляции и статистической значимости. Если вы используете метрику хи-квадрат, не забывайте посчитать к ней effect size.

![toneplot](https://raw.githubusercontent.com/phuuda/ConstrGrammarProject/master/tone_plot.png "tone plot")

* В целом, преобладают отрицательные оценки
* <i>X, а не Y</i> чуть выше % отрицательных оценок, чем <i>не Y, а X</i>

![y_quants](https://raw.githubusercontent.com/phuuda/ConstrGrammarProject/master/all_y.png "y quantities")

* Примерно одинаково количеств. соотношение оцениваемых объектов
* Исключение: <i>работа</i> - намного чаще употребляется с <i>X, а не Y</i>
* <i>Отдых</i> чаще встречается с <i>не Y, а X</i>

![y_animacy](https://raw.githubusercontent.com/phuuda/ConstrGrammarProject/master/animacy_percents.png "y animacy")

* <i>не Y, а X</i> немного чаще употребляется для оценки одушевленных объектов, чем <i>X, а не Y</i>

<p><b>Матрица корреляции для переменных:</b><br />
* положительный тон
* отрицательные тон
* нейтральный тон
* одушевленность оцениваемого объекта (Y)
* порядок слов</p>

![corr_plot](https://raw.githubusercontent.com/phuuda/ConstrGrammarProject/master/variable_corr.png "var correlation")

Статистическая значимость:
```
P
        pos    neg    neut   y_anim x_first
pos            0.0000 0.0001 0.0013 0.5650 
neg     0.0000        0.0000 0.4616 0.2657 
neut    0.0001 0.0000        0.0000 0.2830 
y_anim  0.0013 0.4616 0.0000        0.0731 
x_first 0.5650 0.2657 0.2830 0.0731        
```
P-value для y_anim & pos, y_anim & neut < 0.05 (0.0013 и 0.0000), следовательно статистически значимы:
* корреляция (-0.18) между одушевл. объектами оценки (y_anim) и положительными оценками (pos) 
* корреляция (0.27) между одушевл. объектами оценки (y_anim) и нейтральными оценками (neut)


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
