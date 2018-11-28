
mean_uptake <- mean(CO2$uptake)
class(mean_uptake)

boxplot(CO2$uptake~CO2$Type)

qPlant <- CO2$Plant[CO2$Type=="Quebec"]
qType <- CO2$Type[CO2$Type=="Quebec"]
qTreatment <- CO2$Treatment[CO2$Type=="Quebec"]
qConc <- CO2$conc[CO2$Type=="Quebec"]
qUptake <- CO2$uptake[CO2$Type=="Quebec"]


CO2_quebec <- data.frame(qPlant, qType, qTreatment, qConc, qUptake)

mPlant <- CO2$Plant[CO2$Type=="Mississippi"]
mType <- CO2$Type[CO2$Type=="Mississippi"]
mTreatment <- CO2$Treatment[CO2$Type=="Mississippi"]
mConc <- CO2$conc[CO2$Type=="Mississippi"]
mUptake <- CO2$uptake[CO2$Type=="Mississippi"]


CO2_mississippi <- data.frame(mPlant, mType, mTreatment, mConc, mUptake)







