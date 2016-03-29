
## Load data plus Preliminary exploratory data analysis

library(datasets)
data(ToothGrowth)
tg=ToothGrowth
str(ToothGrowth)
#The 20 pigs assigned to each dose level were in turn equally split between 
#two delivery methods i.e. Orange Juice (OJ) and Ascorbic Acid (VC)
with(tg, table(dose, supp))
tg$dose<-as.factor(tg$dose)

library(dplyr)
aggregate(tg$len,list(Supplement_type=tg$supp,supplement_dose=tg$dose),mean)

#The boxplot below indicates that overall the supplement dosage increase 
#has a growth increase effect on guinea pig thooth
library(ggplot2)
tg=ToothGrowth
levels(tg$supp)<-c("Orange Juice","Ascorbic Acid")
ggplot(tg, aes(x=factor(dose), y=len)) +
        geom_boxplot(aes(fill = factor(dose))) + 
        facet_grid(. ~ supp) +
        xlab('Dose (mg)') +
        ylab('Tooth length (mm)') +
        ggtitle('Guinea Pig tooth length by dose level and supplement type')

# Confidence intervals and hypothesis tests to compare the tooth growth by supplement and dose

## Difference in supplement types
### Hypothesis 1
# Orange juice and ascorbic acid deliver the same tooth growth across the data set.
hp1<-t.test(len~supp,data=tg,paired=FALSE,var.equal=FALSE)
hp1$conf.int
hp1$p.value

#The confidence interval includes 0 and the p-value is greater than the significance level $\alpha=0.05$ 
#which means we fail to reject the null hypothesis. 

## Difference in dose levels
### Hypothesis 2 - Dose 0.5 mg/day

#For the dosage of 0.5mg/day, the orange juice and ascorbic acid supplements deliver 
#the same tooth growth across the data set.

hp2<-t.test(len~supp,data=subset(tg,dose==0.5),paired=FALSE,var.equal=FALSE)
hp2$conf.int
hp2$p.value

#The confidence interval does not includes 0 and the p-value is smaller than $\alpha=0.05$. 
#The null hypothesis can be rejected.The alternative hypothesis that 0.5mg/day dose of orange juice 
#delivers more tooth growth than ascorbic acid is accepted.

### Hypothesis 3 - Dose 1 mg/day

#For the dosage of 1mg/day, the orange juice and ascorbic acid supplements 
#deliver the same tooth growth across the data set.

hp3<-t.test(len~supp,data=subset(tg,dose==1),paired=FALSE,var.equal=FALSE)
hp3$conf.int
hp3$p.value

#The confidence interval does not includes 0 and the p-value is smaller than $\alpha=0.05$. 
#The null hypothesis can be rejected.The alternative hypothesis that 1mg/day dose 
#of orange juice delivers more tooth growth than ascorbic acid is accepted.

### Hypothesis 4 - Dose 2 mg/day

#For the dosage of 2mg/day, the orange juice and ascorbic acid supplements deliver 
#the same tooth growth across the data set.

hp4<-t.test(len~supp,data=subset(tg,dose==2),paired=FALSE,var.equal=FALSE)
hp4$conf.int
hp4$p.value