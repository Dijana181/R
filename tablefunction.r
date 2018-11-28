
separator<- function(link,colname){

data<- read.csv(link)

pat <- ".+/"

fw <- regexpr(pat, data$colname)
aa <- regmatches(data$colname, fw)
ab <- gsub(pattern, "", aa)
data$a <- ab

pattern <- "/.+/"

mw <- regexpr(pattern, data$colname)
ba <- regmatches(data$colname, mw)
bb <- sub("/", "" ,ba)
bc <- sub("/", "",bb)
data$b <- bc

lw <- gsub(pat,"", data$colname)
data$c <- lw
}

separator("C:\\Users\\Admin\\Desktop\\r\\Wine_Data_Unclean.csv","variety_and_region")

