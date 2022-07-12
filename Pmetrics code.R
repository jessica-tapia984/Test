library(Pmetrics)

wd <- c("~/LAPK/Pmetrics/Examples", #Mac
        "C:/LAPK/Pmetrics/Examples" #Windows
)[OS] 


#change to the working directory
setwd("~/Pmetrics")

setwd("Runs")


#copy the files model.txt and ex.csv to your Runs folder to get ready for a run
file.copy(from=c("../src/mymodel.txt","../src/pkData.csv"),to=getwd(),overwrite=T)

PMreadMatrix("../src/mymodel.txt","../src/pkData.csv")



#NPrun(data="pkData.csv",model="mymodel.txt")
list.files()

NPrun(data="pkData1.csv",model="mymodel.txt")


