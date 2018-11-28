data<- read.csv("C:\\Users\\Admin\\Desktop\\r\\Wine_Data_Unclean.csv")

pattern <- "/.+/"

mw <- regexpr(pattern, data$variety_and_region)
reg <- regmatches(data$variety_and_region, mw)
regi <- sub("/", "" ,reg)
region <- sub("/", "",regi)

pat <- ".+/"

fw <- regexpr(pat, data$variety_and_region)
vari <- regmatches(data$variety_and_region, fw)
variety <- sub("/", "", vari)

cola <- data$X.1
colb <- data$X
colc <- data$country
cold <- data$variety_and_region
Resultb <- data.frame(cola, colb, colc, cold, variety, region)
