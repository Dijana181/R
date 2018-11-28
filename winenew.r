

data<- read.csv("C:\\Users\\Admin\\Desktop\\r\\Wine_Data_Unclean.csv")



pat <- ".+/"

fw <- regexpr(pat, data$variety_and_region)
vari <- regmatches(data$variety_and_region, fw)
clean <- gsub(pattern, "", data$variety)
data$variety <- clean

pattern <- "/.+/"

mw <- regexpr(pattern, data$variety_and_region)
reg <- regmatches(data$variety_and_region, mw)
regi <- sub("/", "" ,reg)
region <- sub("/", "",regi)
data$region <- region 

location <- gsub(pat,"", data$variety_and_region)
data$lw <- location

data$points <- NULL
