library(caTools)

framingham = read.csv("C:\\users\\hlesmana\\documents\\springboard_projects\\unit 7\\framingham.csv")

str(framingham)

set.seed(1000)

split = sample.split(framingham$TenYearCHD, SplitRatio = 0.65)
train = subset(framingham, split==TRUE)
test = subset(framingham, split==FALSE)
framinghamLog = glm(TenYearCHD ~ ., data = train, family = binomial)
summary(framinghamLog)

predictTest = predict(framinghamLog, type="response", newdata=test)
table(test$TenYearCHD, predictTest > 0.5)

(1069+11)/(1069+6+187+11)

(1069+6)/(1069+6+187+11) # baseline

library(ROCR)
ROCRPred = 