import re
import csv
from collections import Counter

file = open('X_ane_Y_past.txt', 'r', encoding = 'utf-8')
s = file.read()
lines = s.split('\n')

y_word = '< был[аои]? не (.*?),[ ]?а'
x_word = ',[ ]?а (.*?) >'
x_word = '< был[аои]? (.*?)[, ]'
x_word = '< это (.*?)[, ]'
constr = '< был[аои]? (не .*?,[ ]?а .*?) >'
constr = '< это (.*?[, ] а не .*?) >'
constr = '< был[аои]? (.*?[, ] а не .*?) >'

x_words = []
y_words = []
all_constr = []

for line in lines:
    cons = re.findall(constr, line)
    if cons:
#        all_constr.append(cons[0])
        print(cons[0])

    if not cons:
#        all_constr.append(line)
        print('')

##    x = re.findall(x_word, line)
##    if x:
##        x_words.append(x[0])
##        print(x[0])
##    if not x:
##        x_words.append(line)
##        print('')

##    y = re.findall(y_word, line)
##    if y:
##        y_words.append(y[0])
##    if not y:
##        y_words.append(line)

#x_dict = Counter(x_words).most_common()
#y_dict = Counter(y_words).most_common()
#constr_dict = Counter(all_constr).most_common()

#for c in constr_dict:
    #print(c[0])
#    print(c[1])
