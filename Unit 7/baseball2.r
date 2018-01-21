NBA = read.csv("C:\\users\\hlesmana\\documents\\springboard_projects\\unit 7\\NBA_train.csv")


str(NBA)

table(NBA$W, NBA$Playoffs)

NBA$PTSdiff = NBA$PTS - NBA$oppPTS

plot(NBA$PTSdiff, NBA$W)

WinsReg = lm(W ~ PTSdiff, data=NBA)

summary(WinsReg)




PointsReg = lm(PTS~X2PA +X3PA + FTA + AST + ORB + DRB + TOV + STL + BLK, data = NBA)

summary(PointsReg)

PointsReg$residuals

SSE = sum(PointsReg$residuals^2)

SSE

RMSE = sqrt(SSE/nrow(NBA))

RMSE

mean(NBA$PTS)

PointsReg2 = lm(PTS~X2PA +X3PA + FTA + AST + ORB + DRB + STL + BLK, data = NBA)

summary(PointsReg2)


NBA_test = read.csv("C:\\users\\hlesmana\\documents\\springboard_projects\\unit 7\\NBA_test.csv")


PointsPredictions = predict(PointsReg3, newdata = NBA_test)
SSE = sum((PointsPredictions - NBA_test$PTS)^2)
SST = sum((mean(NBA$PTS) - NBA_test$PTS)^2)

R2 = 1 - SSE/SST
R2

RMSE = sqrt(SSE/nrow(NBA_test))
RMSE