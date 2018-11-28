data("iris")
boxplot(iris$Petal.Width~iris$Species)
plot(iris$Petal.Length, iris$Petal.Width, pch=c(2,3,4)[iris$Species], col=c("black", "blue", "red")[iris$Species])
legend("topleft", legend = levels(iris$Species),pch=(2:4))
