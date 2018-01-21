baseball = read.csv("C:\\users\\hlesmana\\documents\\springboard_projects\\unit 7\\baseball.csv")

str(baseball)

moneyball = subset(baseball, Year < 2002)

str(moneyball)

moneyball$RD = moneyball$RS - moneyball$RA

str(moneyball)


WinsReg = lm(W ~ RD, data=moneyball)
summary(WinsReg)

RunsReg = lm(RS ~ OBP + SLG + BA, data=moneyball)
summary(RunsReg)

RunsReg2 = lm(RS ~ OBP + SLG, data=moneyball)
summary(RunsReg2)

baseball = read.csv("C:\\users\\hlesmana\\documents\\springboard_projects\\unit 7\\baseball.csv")


