library(openintro)
data(COL)

m<-0
s<-1
k=25

signif=0.05
means<-vector("numeric",n)
SE<-vector("numeric",n)
for (i in 1:k) {
    aSample <- rnorm(100,m,s)
    means[i] <- mean(aSample)
    SE[i]<-sd(aSample)/sqrt(n)
    
    print (interval)
}


xR <- m + 4 * c(-1, 1) * s / sqrt(n)
yR <- c(0.7, 25.3)
plot(xR, yR,
     type = 'n',
     xlab = 'X',
     ylab = '',
     axes = FALSE)
abline(v = m, lty = 2, col = COL[5,2])
axis(1, at = m, expression(mu*' = 0'))
for(i in 1:k){
    ci <- means[i] + 2 * c(-1, 1) * SE[i]
    if(abs(means[i] - m) > 1.96 * SE[i]){
        col <- COL[4]
        points(means[i], i, cex = 1.4, col = col)
        lines(ci, rep(i, 2), col = col, lwd = 4)
    } else {
        col <- COL[1]
    }
    points(means[i], i, pch = 20, cex = 1.2, col = col)
    lines(ci, rep(i, 2), col = col)
}