
# This is my first GITHUB project
install.packages('xgboost');
library("xgboost")
xgb.train?

bst <- xgb.train(data=train, 
                 booster = "gblinear", 
                 max.depth=2, 
                 nthread = 1, 
                 nround=2, 
                 watchlist=watchlist, 
                 eval.metric = "error", 
                 eval.metric = "logloss", 
                 objective = "reg:linear");


install.packages('gbm');
library(gbm)
library(lubridate)
?gbm
names(RestTrain)
fitControl <- trainControl(## 10-fold CV
  method = "repeatedcv",
  number = 10,
  ## repeated ten times
  repeats = 10);

gbmGrid <-  expand.grid(interaction.depth = c(1, 5, 9),
                        n.trees = (1:30)*50,
                        shrinkage = 0.1);

gbmFit1 <- train(revenue ~ ., data = RestTrain[,-c(1,2,3,4,5)],
                 method = "gbm",
                 trControl = fitControl,
                 ## This last option is actually one
                 ## for gbm() that passes through
                 verbose = FALSE,
                 tuneGrid = gbmGrid)

names(FRestTrainFOut)
gbmFit2 <- train(revenue ~ ., data = FRestTrainFOut,
                 method = "gbm",
                 trControl = fitControl,
                 ## This last option is actually one
                 ## for gbm() that passes through
                 verbose = FALSE,
                 tuneGrid = gbmGrid)

summary(gbmFit2)
plot(gbmFit2)

test$newRev<- predict(gbmFit1,test);
test$newRev1 <- predict(gbmFit2,test);
write.csv(test$newRev,"out.csv")

summary(test$newRev)
?hist
hist(test$newRev,xlim = range(1500000,9000000))
hist(test$newRev1,xlim = range(1500000,9000000))
