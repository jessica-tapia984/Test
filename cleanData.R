setwd("~/Pmetrics")
library(bit64)
library(tidyverse)
library(tibble)
mydata <- read.csv("C:\\Users\\acer\\Documents\\Pmetrics\\src\\sourcedata.csv")
mydata.dose = mydata$DOSE



mydata$DOSE <- 0
mydata$EVID <- 0
mydata$DUR <- 0
mydata$ADDL <- 0
mydata$II <- 0
mydata$INPUT <- 0
mydata$OUT <- mydata$Concentration
mydata$Concentration <-NULL
mydata$OUTEQ <- 1
mydata$C0 <- 0.01
mydata$C1 <- 0.1
mydata$C2 <- 0
mydata$C3 <- 0
mydata$GENDER <- replace(mydata$GENDER, mydata$GENDER == 2, 0) 

#X.ID = 1, EVID = 0, TIME = 0, DUR = '.', DOSE = 0, ADDL ='.', II = '.', INPUT = 1, OUT = '.', OUTEQ = '.', C0 = '.', C1 = '.',C2 = '.', C3 = '.', WT = 70.2,BMI = 25.2, AGE = 36, GENDER = 1,
mydata = mydata[, c("X.ID", "EVID", "TIME", "DUR", "DOSE", "ADDL", "II","INPUT", "OUT", "OUTEQ", "C0", "C1", "C2","C3", "WT", "BMI", "AGE", "GENDER" )]

mydata.id = mydata$X.ID
mydata.wt = mydata$WT
mydata.age = mydata$AGE
mydata.bmi = mydata$BMI
mydata.gender = mydata$GENDER

#Get unqiue values for ID columns
x <- as.integer64(as.numeric(mydata$X.ID))
myunique <- unipos(x)
myunique



rownum <- length(myunique)
rownum

for(n in 1:rownum)
  { count = 0
  while(mydata$X.ID == n){
  count = count+1
  if (mydata$TIME[2]- mydata$TIME[1] < 0){
    print('Negative')
    print(n)
  }
}
} 

count = 0
 for(n in 1:rownum){
  myrow = myunique[n] #it's not finding this i can't set it to get the value at the index
  #mydose = mydata.dose[myrow]
  #as.character(mydose)
  #myweight = mydata[myrow, 15]
  #mybmi = mydata[myrow,16]
  #myage = mydata[myrow, 17]
  #mygender = mydata[myrow,18]
  mydata = add_row(mydata, X.ID = mydata$X.ID[myrow+count], EVID = 1, TIME = 0, DUR = 0, DOSE = mydata.dose[myrow+count], ADDL = 999, II = 999, INPUT = 1, OUT = 0, OUTEQ = 0, C0 = 0, C1 = 0,C2 = 0, C3 = 0, WT = mydata$WT[myrow+count],BMI = mydata$BMI[myrow+count], AGE = mydata$AGE[myrow+count], GENDER = mydata$GENDER[myrow+count], .before = myrow + count)
  count = count+1
 }
typeof(mydata$DOSE)


as.integer(mydata$DOSE)


write.csv(mydata, "C:\\Users\\acer\\Documents\\Pmetrics\\src\\pkData.csv")


