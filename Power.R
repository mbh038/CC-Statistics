## ----------------------- ##
## Computing and Graphing  ##
## Statistical Power       ##
## ----------------------- ##

## Parameters of the Problem ##

mu0   = 6     ## Null-hypothesized value
alpha = 0.05  ## Significance Level
s.sq  = 16    ## Variance from pilot study
n1    = 64    ## Sample Size
alt =   8.0

se = sqrt(s.sq/n1)

## -------------------------- ##
## What is Statistical Power? ##
## -------------------------- ##

cuts = c(1-alpha/2, alpha/2)
crits = qnorm(cuts, mu0, sqrt(s.sq/n1))    ## Critical Values Based on Null
shadenorm(mu=mu0, sig = se, outside=crits) ## My own function
shadenorm(mu = 6.5, sig = se, lines=TRUE, outside=crits, col="blue")

## ------------------------------ ##
## Write a Function to Compute it ##
## ------------------------------ ##

power = function(theta, mu, var, n, alpha=0.05){
  crit.l = qnorm(alpha/2, mu, sqrt(var/ n))    ## Critical Value Based on Null
  crit.h = qnorm(1-alpha/2, mu, sqrt(var/ n))  ## Critical Value Based on Null
  pr.high = pnorm(crit.h, theta, sd = sqrt(var/ n),lower.tail=FALSE) ## Prob Reject High
  pr.low  = pnorm(crit.l, theta, sd = sqrt(var/ n))                  ## Prob Reject Low
  pow = pr.low+pr.high
  
  pow
  
}

power(thet=6.5, mu=6, var= 16, n = 64)
thet = seq(3,9, by=0.01)

pow = power(thet, mu0, s.sq, n1)
plot(thet, pow, type="l", ylim=c(0,1), main="My Power Plot")

n2 = 256  ## New Larger Sample Size
pow2 = power(thet, mu0, s.sq,n2)
lines(thet, pow2, lty="dashed", col="blue")
abline(h=0.05, lty="dotted")

## -------------------------- ##
## An R Function that Shades  ##
## under a normal density.    ##
##                            ##
## This is a convenience      ##
## function for polygon()     ##
## -------------------------- ##

shadenorm = function(below=NULL, above=NULL, pcts = c(0.025,0.975), mu=0, sig=1, numpts = 500, color = "gray", dens = 40,
                     lines=FALSE,between=NULL,outside=NULL){
  if(is.null(between)){
    bothnull = is.null(below) & is.null(above)
    if(bothnull==TRUE){
      below = ifelse(is.null(below), qnorm(pcts[1],mu,sig), below)
      above = ifelse(is.null(above), qnorm(pcts[2],mu,sig), above)
    }
  }
  
  if(is.null(outside)==FALSE){
    if(is.numeric(outside)==FALSE){if(outside==TRUE){outside=qnorm(pcts,mu,sig)}}
    below = min(outside)
    above = max(outside)
  }
  
  lowlim = mu - 4*sig
  uplim  = mu + 4*sig
  
  x.grid = seq(lowlim,uplim, length= numpts)
  dens.all = dnorm(x.grid,mean=mu, sd = sig)
  
  if(lines==FALSE){
    plot(x.grid, dens.all, type="l", xlab="X", ylab="Density")
  }
  
  if(lines==TRUE){
    lines(x.grid,dens.all)
  }
  
  if(is.null(below)==FALSE){
    x.below    = x.grid[x.grid<below]
    dens.below = dens.all[x.grid<below]
    polygon(c(x.below,rev(x.below)),c(rep(0,length(x.below)),rev(dens.below)),col=color,density=dens)
  }
  
  if(is.null(above)==FALSE){
    x.above    = x.grid[x.grid>above]
    dens.above = dens.all[x.grid>above]
    polygon(c(x.above,rev(x.above)),c(rep(0,length(x.above)),rev(dens.above)),col=color,density=dens)
  }
  
  
  
  if(is.null(between)==FALSE){
    if(is.numeric(between)==FALSE){if(between==TRUE){between=qnorm(pcts,mu,sig)}}
    from = min(between)
    to   = max(between)
    
    x.between    = x.grid[x.grid>from&x.grid<to]
    dens.between = dens.all[x.grid>from&x.grid<to]
    polygon(c(x.between,rev(x.between)),c(rep(0,length(x.between)),rev(dens.between)),col=color,density=dens)
  }
}