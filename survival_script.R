library(foreign)
my.data1 <- read.arff("/home/asier/Desktop/FAP2/FAP2__4_5_2016/FAP_gvasc.arff")
attach(my.data1)

## Load survival package
library(survival)
library(survplot)

months = 240

survplot(Surv(months_die, alive_dead == 2 & months_die < months) ~ gvasc, data = my.data1, 
  xlab = 'Time', ylab = 'Fraction surviving', xlim=c(1, months),
  stitle = 'gvasc', legend.pos = 'right')


## Multivariate Analysis
#What happens if both variables are considered together (multivariate)? Will they
#remain significant?

multivar.coxph <- coxph( Surv(months_die, alive_dead == 2 & months_die < months) ~ Grado_grouped+Stage_grouped+Diametro_grouped+gvasc, method="exact")

summary(multivar.coxph) 
