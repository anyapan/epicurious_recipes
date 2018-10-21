install.packages("Rglpk")
library(Rglpk)
setwd("/Users/apple/Desktop/ISE533/homework/Yan_Pan_ISE533_HW3")
d0=read.csv("/Users/apple/Desktop/ISE533/homework/Yan_Pan_ISE533_HW3/receipt_data.csv")
d1=read.csv("/Users/apple/Desktop/ISE533/homework/Yan_Pan_ISE533_HW3/prices.csv")
d2=read.csv("/Users/apple/Desktop/ISE533/homework/Yan_Pan_ISE533_HW3/time.csv")

#calculate the prices
milk=d1$X...milk[c(1)]
bread=d1$bread[c(1)]
rice=d1$rice[c(1)]
egg=d1$egg[c(1)]
cheese=d1$cheese[c(1)]
chicken=d1$chicken[c(1)]
beef=d1$beef[c(1)]
apple=d1$apple[c(1)]
carrot=d1$carrot[c(1)]
mango=d1$mango[c(1)]
tomato=d1$tomato[c(1)]
potato=d1$potato[c(1)]
onion=d1$onion[c(1)]
leafy.green=d1$leafy.green[c(1)]
d0$budget=((d0$apple)*apple+(d0$milk)*milk+(d0$bread)*bread+(d0$rice)*rice+(d0$egg)*egg+(d0$cheese)*cheese+(d0$chicken)*chicken+(d0$beef)*beef+(d0$apple)*apple+(d0$carrot)*carrot+(d0$mango)*mango+(d0$tomato)*tomato+(d0$potato)*potato+(d0$onion)*onion+(d0$leafy.green)*leafy.green)


#the LP solve model
mat1 = c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)
obj=d0$rating
mat=rbind(mat1,d0$calories,d0$budget,d0$Time,d0$protein,d0$fat,d0$fat,d0$sodium,d0$chicken+d0$beef,d2$Y+d2$Z-d0$Time)
dir=c("==","<=", "<=", "<=","<=",">=","<=","<=","==",">=")
rhs=c(5,10000,57.9,5,230,230,390,11500,5,0)
types=c("B","B","B","B","B","B","B","B","B","B",
        "B","B","B","B","B","B","B","B","B","B",
        "B","B","B","B","B","B","B","B","B","B")
max=TRUE
Rglpk_solve_LP(obj, mat, dir, rhs, types = types, max = max)