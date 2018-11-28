
data<- read.csv("C:\\Users\\Admin\\Desktop\\r\\Wine_Data_Unclean.csv")

pattern <- "/.+"

mw <- regexpr(pattern,data$variety_and_region)

reg <- regmatches(data$variety_and_region, mw)

pattern1 <- "/"

pattern2 <- ".+/"

fw <- regexpr(pattern2, reg)

vari <- regmatches(reg, fw)

first <- regexpr(".+/", data$variety_and_region)

variety <- regexpr(data$variety_and_region, first)



cola <- data$X.1
colb <- data$X
colc <- data$country
cold <- data$variety_and_region
Result <- data.frame(cola, colb, colc, cold, vari, reg, variety)
