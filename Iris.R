#Upload data
Iris<-read.csv("E:/IRIS.csv")
head(Iris)
str(Iris)
summary(Iris)
#Cleaning
sum(duplicated(Iris))
New_Iris<-distinct(Iris)
boxplot(New_Iris$sepal_width)
outliers<-boxplot(New_Iris$sepal_width)$out
outliers
New_Iris[which(New_Iris$sepal_width%in%outliers),]
New_Iris<-New_Iris[-which(New_Iris$sepal_width%in%outliers),]
New_Iris
#model
tree<-rpart(species~.,data=New_Iris,method = 'class')
tree
rpart.plot(tree)
#test
Iris_data<-data.frame( sepal_length = 4.9, sepal_width = 3.0, petal_length = 1.4, petal_width = 0.2)
prediction<-predict(tree,Iris_data)
prediction