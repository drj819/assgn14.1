
getwd()
p='C:/Users/Admin/Downloads/blogfeedback'
setwd(p)
list.files()
list.dirs()
library(data.table)
blogData_train <- read_csv('C:/Users/Admin/Downloads/blogfeedback/blogData_train.csv')
View(blogData_train)

library(ISLR) 
train_sg <- read.csv("blogfeedback/train_sg.csv") 
test_sg <- read.csv("blogfeedback/test_sg.csv") 
View(train_sg) 
View(test_sg) 
str(train_sg) 
str(test_sg) 
pairs(train_sg)
pairs(test_sg)
hist(train_sg$y,col='blue')

library(tree) 
tree.train_sg<-tree(meta_knn~.-meta_rf,train_sg) 
summary(tree.train_sg) 

tree.test_sg<-tree(meta_knn~.-meta_rf,test_sg) summary(tree.test_sg) 

t.test(train_sg$meta_knn,mu=0.6) 
t.test(train_sg$meta_rf, mu=0.7) 
t.test(train_sg$y, mu=0.5) 

plot(train_sg$meta_knn,train_sg$meta_rf) 

cor(train_sg$meta_knn,train_sg$meta_rf) 

mod<-lm(train_sg$meta_knn~train_sg$meta_rf)
summary(mod) 