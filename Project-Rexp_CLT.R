set.seed (1938)
n<-1000
lambda<-0.2
nval<-40
exp_mean<-0

## Simulation of forty exponentials

for(i in 1:n) {
        exp_mean<-c(exp_mean, mean(rexp(nval,lambda)))
}
## Comparison - Sample mean and theoretical distribution mean
mean(exp_mean)
mean_t<-1/lambda

round(var(exp_mean), 2)
var_t<-1/lambda^2/nval

library(ggplot2)
data<-as.data.frame(exp_mean)
ggplot(data,aes(x=exp_mean))+
        geom_histogram(aes(y=..density..),binwidth = 0.4,color="black",fill="white")+
        stat_function(fun=dnorm,color="blue",
                      arg=list(mean=1/lambda,sd=(lambda*sqrt(nval))^-1),size=2)+
        xlim(2,8)+
        xlab("Sample mean")+
        ylab("Density")+
        ggtitle("Sample distribution vs. theoretical distribution")
