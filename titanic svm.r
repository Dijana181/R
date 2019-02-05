install.packages("class")
library(class)
install.packages("randomForest")
library(randomForest)
install.packages("rgl")
library(rgl)
install.packages("rpart")
library(rpart)
install.packages("rattle")
library(rattle)
install.packages("e1071")
library(e1071)

train <- read.csv("~/Documents/titanic/train.csv", header=TRUE)
col1 <-train$Survived
col2<-train$PassengerId
col3<-train$Pclass
col4<-train$Name
col5<-train$Sex
col6<-train$Age
col7<-train$SibSp
col8 <-train$Parch
col9<-train$Ticket
col10<-train$Fare
col11<- train$Cabin
col12<-train$Embarked

train<-data.frame(col1,col2,col3,col4,col5,col6,col7,col8,col9,col10,col11,col12)
names(train) <- c("survived","PassengerId","Pclass","Name","Sex","Age","SibSp","Parch","Ticket","Fare","Cabin","Embarked")
test <- read.csv("~/Documents/titanic/test.csv",header=TRUE)
test.survived <- data.frame(survived=rep("None",nrow(test)), test[,])
str(train)

train$survived <- as.factor(train$survived)
train$Pclass<-as.factor(train$Pclass)
train$PassengerId<-NULL
train$Fare<-NULL
train$Embarked<-NULL
train$Cabin<-NULL
train$Ticket<-NULL
train$Name <- NULL
train$Age[is.na(train$Age)]<- 29.88
train<- na.omit(train)
id<- test$PassengerId
test$Pclass<-as.factor(test$Pclass)
test$PassengerId<-NULL
test$Fare<-NULL
test$Embarked<-NULL
test$Cabin<-NULL
test$Ticket<-NULL
test$Name <- NULL
test$Age[is.na(test$Age)]<- 29.88
test<- na.omit(test)


str(train)
FeatureScaling <- function(x) { ((x - min(x)) / (max(x) - min(x))) }
Normalised <- function(data){FeatureScaling(data)}

train$SibSp <- Normalised(train$SibSp)
train$Parch <- Normalised(train$Parch)


fit <- svm(survived ~. , data=train)


pred <- predict(fit, train)

table(pred,train$survived)

test$survived <- predict(fit,test)

result <- data.frame(id,test$survived)
names(result)<- c("PassengerId","Survived")
setwd("~/Documents/titanic")
write.csv(result, file ="result2.csv",row.names = FALSE)
