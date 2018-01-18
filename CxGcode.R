setwd("Desktop")
Sys.setlocale("LC_ALL","UTF-8")
library(readr)
library(ggplot2)
#install.packages("corrplot")

rm(df)
df <- read.csv("all_together.csv", header = TRUE, sep=",")
summary(df)

df1 <- read.csv("X a ne Y.csv", header = TRUE, sep=",")

# % pos neg neut for 2 WO -- barplot
tone <- rep(c("pos", "neg", "neut"), 2)
x_first <- c(38, 56, 6)
y_first <- c(41, 49, 10)

percent <- c(x_first, y_first)
construction <- c(rep("X а не Y", 3), rep("не Y а X", 3))
conn_data <- data.frame(tone, percent)

p <-ggplot(conn_data, aes(tone, percent))
p +geom_bar(stat = "identity", aes(fill = construction), position = "dodge") +
  ggtitle("Тональность") +
  geom_text(aes(label=percent), position=position_dodge(width=0.9), vjust=-0.25) +
  theme_bw()

# inanimate Y quantities -- barplot
y_words <- rep(c("жизнь", "отдых", "работа"), 2)
x_first1 <- c(34, 8, 54)
y_first1 <- c(30, 19, 18)

y_quants <- c(x_first1, y_first1)
construction <- c(rep("X а не Y", 3), rep("не Y а X", 3))
y_quant_data <- data.frame(y_words, y_quants)

p <-ggplot(y_quant_data, aes(y_words, y_quants))
p +geom_bar(stat = "identity", aes(fill = construction), position = "dodge") +
  ggtitle("Неодуш. объекты") +
  geom_text(aes(label=y_quants), position=position_dodge(width=0.9), vjust=-0.25) +
  theme_bw()

# animate Y quantities -- barplot
y_words <- rep(c("человек", "женщина", "ребенок"), 2)
x_first1 <- c(50, 12, 5)
y_first1 <- c(56, 8, 7)

y_quants <- c(x_first1, y_first1)
construction <- c(rep("X а не Y", 3), rep("не Y а X", 3))
y_quant_data <- data.frame(y_words, y_quants)

p <-ggplot(y_quant_data, aes(y_words, y_quants))
p +geom_bar(stat = "identity", aes(fill = construction), position = "dodge") +
  ggtitle("Одуш. объекты") +
  geom_text(aes(label=y_quants), position=position_dodge(width=0.9), vjust=-0.25) +
  theme_bw()

# animacy % -- barplot
types <- rep(c("одуш. Y", "неодуш. Y"))
x_first2 <- c(41, 59)
y_first2 <- c(51, 49)

percent <- c(x_first2, y_first2)
construction <- c(rep("X а не Y", 2), rep("не Y а X", 2))
animacy_percent <- data.frame(types, percent)

p <-ggplot(animacy_percent, aes(types, percent))
p +geom_bar(stat = "identity", aes(fill = construction), position = "dodge") +
  ggtitle("Оценка одуш. vs. неодуш. объектов") +
  geom_text(aes(label=percent), position=position_dodge(width=0.9), vjust=-0.25) +
  theme_bw()

# tone (pos, neg, neut), y animacy, word order -- correlation matrix
library(corrplot)
df2 <- read.csv("parameters_only.csv", header = TRUE, sep=",")

M <- cor(df2)
corrplot(M, method="circle")
corrplot(M, method="number")

# significance 
library(Hmisc)
rcorr(x, type="pearson")
rcorr(as.matrix(df2))

# y variables, tone (pos, neg, neut), y animacy, word order -- correlation matrix
df3 <- read.csv("variables_with_y.csv", header = TRUE, sep=",")

M1 <- cor(df3)
corrplot(M1, method="circle")
corrplot(M1, method="number")

# significance
rcorr(x, type="pearson")
rcorr(as.matrix(df3))

# RANDOM FOREST - importance (ignores x_word)
df5 <- read.csv("final_5.csv", header = TRUE, sep=",")

# RANDOM FOREST - importance (ignores x_word)
library(randomForest)
require(randomForest)

# dependent: x_first
fit_forest <- randomForest(factor(wo)~., data=df5, importance = TRUE)
importance(fit_forest)
varImpPlot(fit_forest, type=2) #mean decrease

# дерево решений
library(caTools)
set.seed(3000)
split <- sample.split(df5$wo, SplitRatio = 0.7)
train <- subset(df5, split == TRUE)
test <- subset(df5, split == FALSE)

library(rpart)
library(rpart.plot)

tree <- rpart(wo ~ pos+neut+y_animacy, data = train, method = "class", control=rpart.control(minbucket = 25))
prp(tree)

# accuracy test
accuracy <- predict(tree, newdata = test, type="class")
table(test$wo, accuracy)


tree <- rpart(wo ~ pos+neut+y_animacy+y_word, data = train, method = "class", control=rpart.control(minbucket = 25))
prp(tree)

# accuracy test
accuracy <- predict(tree, newdata = test, type="class")
table(test$wo, accuracy)



