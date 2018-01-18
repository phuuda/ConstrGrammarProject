# Порядок слов в конструкции "Чудо, а не ребенок"
Стырина Соня

### Материалы
[Таблица с данными](https://github.com/phuuda/ConstrGrammarProject/blob/master/all_together.csv)  
[Ссылка на код, здесь целиком с комментарием](https://github.com/phuuda/ConstrGrammarProject/blob/master/CxGcode.R)

## Рабочая гипотеза

* В русском языке оценочная конструкция <i>X, а не Y</i> чаще встречается с положительной тональностью, чем <i>не Y, а X</i>.
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

<b>зависимая переменная</b>: порядок слов (<i>X, а не Y</i>, <i>не Y, а X</i>)<br />
<b>переменные, влияющие на зависимую</b>:
* выбор X (как учитывать? в 300 примерах 147 разных X)
* выбор Y (человек, женщина, ребенок, жизнь, отдых, работа)
* одушевленность Y
* тональность конструкции (pos, neg, neut)

независимость/корреляция факторов: кореляция между одушевленностью & тональностью?<br />

трудности в разметке параметров: не всегда очевидна тональность примера


## Анализ: дескриптивная статистика

![toneplot](https://raw.githubusercontent.com/phuuda/ConstrGrammarProject/master/tone_plot.png "tone plot")

* В целом, преобладают отрицательные оценки
* <i>X, а не Y</i> чуть выше % отрицательных оценок, чем <i>не Y, а X</i>

![y_quants](https://raw.githubusercontent.com/phuuda/ConstrGrammarProject/master/all_y.png "y quantities")

* Примерно одинаково количеств. соотношение оцениваемых объектов
* Исключение: <i>работа</i> - намного чаще употребляется с <i>X, а не Y</i>
* <i>Отдых</i> чаще встречается с <i>не Y, а X</i>

![y_animacy](https://raw.githubusercontent.com/phuuda/ConstrGrammarProject/master/animacy_percents.png "y animacy")

* <i>не Y, а X</i> немного чаще употребляется для оценки одушевленных объектов, чем <i>X, а не Y</i>

<b>Матрица корреляции для переменных:</b><br />
* положительный тон
* отрицательные тон
* нейтральный тон
* одушевленность оцениваемого объекта (Y)
* порядок слов

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

<b>Матрица корреляции для переменных:</b><br />
* положительный тон
* отрицательные тон
* нейтральный тон
* одушевленность оцениваемого объекта (Y)
* порядок слов
* Y переменные

![corr_with_y](https://raw.githubusercontent.com/phuuda/ConstrGrammarProject/master/corr_with_y.png "correlation with y")

Статистическая значимость:
```
P
          y_человек y_женщина y_ребенок y_жизнь y_работа y_отдых pos    neg    neut   y_anim x_first
y_человек           0.0006    0.0090    0.0000  0.0000   0.0000  0.0000 0.0012 0.0017 0.0000 0.0735 
y_женщина 0.0006              0.3473    0.0161  0.0093   0.1472  0.0529 0.0081 0.1459 0.0000 0.5885 
y_ребенок 0.0090    0.3473              0.0666  0.0476   0.2686  0.1752 0.0090 0.0123 0.0001 0.3773 
y_жизнь   0.0000    0.0161    0.0666            0.0000   0.0045  0.0539 0.5299 0.0135 0.0000 0.8531 
y_работа  0.0000    0.0093    0.0476    0.0000           0.0022  0.0000 0.0007 0.0329 0.0000 0.0000 
y_отдых   0.0000    0.1472    0.2686    0.0045  0.0022           0.0000 0.0000 0.1367 0.0000 0.0072 
pos       0.0000    0.0529    0.1752    0.0539  0.0000   0.0000         0.0000 0.0001 0.0013 0.5650 
neg       0.0012    0.0081    0.0090    0.5299  0.0007   0.0000  0.0000        0.0000 0.4616 0.2657 
neut      0.0017    0.1459    0.0123    0.0135  0.0329   0.1367  0.0001 0.0000        0.0000 0.2830 
y_anim    0.0000    0.0000    0.0001    0.0000  0.0000   0.0000  0.0013 0.4616 0.0000        0.0731 
x_first   0.0735    0.5885    0.3773    0.8531  0.0000   0.0072  0.5650 0.2657 0.2830 0.0731        
```

Слабая, но стат. значимая корреляция:
* +0.23: между Y=работа и порядком слов (тяготеет к <i>X, а не Y</i>)
* -0.15: между Y=отдых и порядком слов (тяготеет к <i>не Y, а X</i>)
* +0.19 и +0.27: между Y=человек, Y=отдых и отрицательным тоном оценки
* +0.27: между Y=работа и положительным тоном оценки

## Мультифакторный анализ
Здесь рекомендуется использовать один из следующих подходов к моделированию/анализу данных:  
* коллострукционный анализ (в сопоставлении с метриками из Schmid et al.)  
* дерево решений ( + случайный лес для выявления важности переменных (variable importance))  
* логистическая регрессия (привести примеры нескольких моделей, закончив оптимальной, в которой остаются только значимые факторы)  
* (множественный) анализ соответствий ((M)CA), возможно, в сочетании с кластеризацией/k-means  
Требуется показать output модели(ей) и привести графики

<b>RandomForest - variable importance</b>:
![var_imp](https://raw.githubusercontent.com/phuuda/ConstrGrammarProject/master/fit_forest.png "var importance")
```
                  0          1 MeanDecreaseAccuracy MeanDecreaseGini
y_word    24.197025 12.7569815            27.858344        14.893534
pos       22.464894 -0.7195381            18.995440         4.776119
neut      -4.680028 13.4552570             5.054475         1.609461
y_animacy 12.913220  3.0398802            15.687881         2.544958
```
<b>Дерево решений</b>:
```
tree <- rpart(x_first ~ pos+neut+y_animacy, data = Train, method = "anova", control=rpart.control(minbucket = 25))
```
![tree1](https://raw.githubusercontent.com/phuuda/ConstrGrammarProject/master/pos_neut_anim_tree.png "tree1")

```
tree <- rpart(x_first ~ pos+neut+y_animacy+y_word, data = Train, method = "anova", control=rpart.control(minbucket = 25))
```
![tree2](https://raw.githubusercontent.com/phuuda/ConstrGrammarProject/master/pos_neut_yword_tree.png "tree2")


## Содержательный лингвистический анализ результатов статистического анализа

* Взаимодействие y_animacy и pos (положительный тон оценки): для отрицательной тональности & одуш. объекта чаще применяется порядок слов <i>X, а не Y</i>

* Не подтвердилась изначальная гопотеза о том, что <i>X, а не Y</i> чаще употребляется при положительной тональности

* Переменная y_word вытесняет тональность (pos, neut):
* немногочисленные объекты оценивания "женщина", "ребенок" и очень частотная "работа "тяготеют к <i>X, а не Y</i> -- overfitting?
* "жизнь", "человек", "отдых" с p = 0.55 употребляются с <i>не Y, а X</i>


## Обсуждение использованных квантитативных методов
Тут или ранее по ходу анализа нужно обсудить аккуратность (точность) классифицирующих моделей, classification power, adjusted R2, goodness of fit и т.п. -- стандартные показатели качества моделирования, а также важность / значимость факторов. 
В заключение вы можете предложить идеи по дальнейшей работе с данными и их статистическим анализом. 

* Main issue: не учитывается переменная X -- оценочные слова недостаточно устойчивы и их большое кол-во (дерево не справляется с > 53 категориями 1ой переменной) (в 300 данных примеров ~ 147 разных оценок, и это только для самых устойчивых Y)
* для топ-5 оценочных слов недостаточно примеров для простроения модели (~60 примеров).
* Additional issue with X variable -- оценки делятся на универсальные (применимые к любому Y) и специфичные (только для неодуш. объектов, только для людей, etc.) 
<br />

* Random trees are biased in favor of attributes with more levels!
* Из-за этого -- завышенная var importance y_word & эта переменная вытесняет тональность (pos, neut)
* Но анализ с помощью one-hot encoding для переменной y_word тоже отрицательно повлияет на качество
* Недостаточно данных:
* Неравномерное распределение категорий y_word ("работа" и "человек" встречались гораздо чаще, чем "женщина", "ребенок", "отдых")
