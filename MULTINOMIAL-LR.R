mydata <- read.csv("~/OBS-Network-DataSet_2_Aug27.arff.txt",sep = ',',header = FALSE)
mydata$NSPF <-as.factor( as.numeric(mydata$V22))
View(mydata)
str(mydata)
library(nnet)
mydata$out<-relevel(mydata$NSPF, ref="3")
mymodel<-multinom(V22~., data=mydata)
summary(mymodel)
pred=predict(mymodel,mydata)                    
table(pred,mydata$V22)

