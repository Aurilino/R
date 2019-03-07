Var_calculation<-function(d,p=0.05,nu=1000000,normal=TRUE,cf=FALSE)
{
  
  library(moments)
  library(fGarch)
  mu<-mean(d) 
  sigma<-sd(d) 
  if (normal)
  {
    if (nu<1000000) nu=1000000
    prob_inverse<-qnorm(p) 
    if (cf)
      prob_inverse<-prob_inverse+(prob_inverse^2-1)*(skewness(d)/6)+
        (prob_inverse^3-3*prob_inverse)*(kurtosis(d)/24)-
        (2*prob_inverse^3-5*prob_inverse)*(skewness(d)^2/36) 
    
  }
  else
  {
    if (nu==1000000) nu<-5
    prob_inverse<-qstd(p,nu=nu) 
  }
  return(mu+sigma*sqrt(nu/(nu-2))*prob_inverse)
}