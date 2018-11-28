nums <- read.csv("C:\\Users\\Admin\\Desktop\\r\\even.csv")

for(i in 1:6){
  nums[i]<- nums[i+1]
}

write.csv("C:\\Users\\Admin\\Desktop\\r\\odds.csv")
