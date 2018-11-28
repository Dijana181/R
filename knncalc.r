install.packages("class")
library(class)

install.packages("ggplot2")
library(ggplot2)

RawData <- read.csv("C:\\Users\\Admin\\Documents\\R\\BreastCancerData.csv", header = FALSE)

names(RawData) <- c("ID","diagnosis","radius_mean","texture_mean","perimeter_mean","area_mean","smoothness_mean","compactness_mean","concavity_mean","concave points_mean","symmetry_mean","fractal_dimensions_mean","radius_se","texture_se","perimeter_se","area_se","smoothness_se","compactness_se","concavity_se","concave points_se","symmetry_se","fractal_dimensions_se","radius_worst","texture_worst","perimeter_worst","area_worst","smoothness_worst","compactness_worst","concavity_worst","concave points_worst","symmetry_worse","fractal_dimensions_worse")

Data_NoID <- RawData[,-1]
Data_NoResults <- Data_NoID[,-1]
FeatureScaling <- function(x) { ((x - min(x)) / (max(x) - min(x))) }
Data_Normalised <- as.data.frame(lapply(Data_NoResults, FeatureScaling))
Data_Training <- Data_Normalised[1:350,]
Data_Test <- Data_Normalised[351:569,]
K_Value <- floor(sqrt(length(Data_Training[,1]))) 
Data_Predictions <- knn(Data_Training,Data_Test,Data_NoID[1:350,1], k=K_Value)
Data_Reference <- Data_NoID[351:569,1]
table(Data_Predictions,Data_Reference)

big_errors <- c()

kValues <- c()

for(i in c(1:100)) {
  
  next_error <-  table(knn(Data_Training,Data_Test,Data_NoID[1:350,1],k=i),Data_Reference)[1,2] +
    table(knn(Data_Training,Data_Test,Data_NoID[1:350,1],k=i),Data_Reference)[2,1]
  
  big_errors <- c(big_errors, next_error)
  
  kValues <- c(kValues, i)
}
big_errors_df <- data.frame(kValues,big_errors)

names(big_errors_df) <- c("k-Value","Error Value")

ggplot(big_errors_df, aes(x = kValues, y = big_errors)) +
  geom_point() +
  geom_smooth(method = "loess",colour = "blue", size = 1) + 
  ggtitle("Error vs k-Value for Breast Cancer Data") +
  xlab("k-Values") +
  ylab("Error") +
  theme(axis.text.x=element_text(angle=-45, vjust=0.5)) +
  theme(axis.text.y=element_text(angle=-45, hjust=-0.1, vjust=-0.5)) +
  scale_colour_manual(values = c("red","blue"))


