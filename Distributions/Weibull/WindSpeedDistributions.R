library(openintro)
data(COL)

wTail<-function(scale=5, shape=2, L=NULL, U=NULL, M=NULL,curveColor=1, border=1, col='#569BBD', xlim=NULL, ylim=NULL, xlab='', ylab='', digits=2, axes=1, detail=999, xLab=c('number', 'symbol'), cex.axis=1, xAxisIncr=1, ...){
  if(is.null(xlim)[1]){
    xlim <- c(0,18)
  }
  temp <- diff(range(xlim))
  x    <- seq(0, xlim[2], length.out=detail)
  y    <- dweibull(x,shape,scale)
  if(is.null(ylim)[1]){
    ylim <- range(c(0,y))
  }
  plot(x, y, type='l', xlim=xlim, ylim=ylim, xlab=xlab, ylab=ylab, axes=FALSE, col=curveColor, ...)
  if(!is.null(L[1])){
    these <- (x <= L)
    X <- c(x[these][1], x[these], rev(x[these])[1])
    Y <- c(0, y[these], 0)
    polygon(X, Y, border=border, col=col)
  }
  if(!is.null(U[1])){
    these <- (x >= U)
    X <- c(x[these][1], x[these], rev(x[these])[1])
    Y <- c(0, y[these], 0)
    polygon(X, Y, border=border, col=col)
  }
  if(all(!is.null(M[1:2]))){
    these <- (x >= M[1] & x <= M[2])
    X <- c(x[these][1], x[these], rev(x[these])[1])
    Y <- c(0, y[these], 0)
    polygon(X, Y, border=border, col=col)
  }

  if(axes == 1 || axes > 2){
    if(xLab[1]=='symbol'){
      xAt  <- m + (-3:3)*s
      xLab <- expression(mu-3*sigma, mu-2*sigma,
                         mu-sigma, mu,	mu+sigma,
                         mu+2*sigma, mu+3*sigma)
    } else if(xLab[1] != 'number'){
      stop('Argument "xLab" not recognized.\n')
    } else {
      temp <- seq(xAxisIncr, max(abs(xlim-m))/s, xAxisIncr)*s
      xAt <- m + c(-temp, 0, temp)
      xLab <- round(xAt, digits=digits)
    }
  }
  if(axes > 2){
    axis(1, at=xAt, labels=xLab, cex.axis=cex.axis)
    buildAxis(2, c(y,0), n=3, nMax=3, cex.axis=cex.axis)
  } else if(axes > 1){
    buildAxis(2, c(y,0), n=3, nMax=3, cex.axis=cex.axis)
  } else if(axes > 0){
    axis(1, at=xAt, labels=xLab, cex.axis=cex.axis)
  }
  abline(h=0)
}

BuildNull <- function(mean=6,shape=2,xlim = c(0, 20),L=NULL,U=NULL,M=NULL) {
  scale=mean/gamma(1+1/shape)
  wTail(scale, shape,L=L,U=U,M=M,
           lwd = 2.5, axes = FALSE,
           curveColor = COL[1],
           xlim = xlim)
  axis(1, at = seq(0, 20, 2))
  axis(2, at = seq(0, 0.16, .02))
  mtext("Wind speed v (m/s)",
        side = 1, line = 2.)
  mtext("Probability",
        side = 2, line = 2.)
  text(1.2, 0.2, "Null distribution", col = COL[1], pos = 4)
  lines(rep(0, 2), c(0, dnorm(0, 0, 1.70)),
        col = COL[1,4], lwd = 0.5)
}
myPNG('4to7',
      700, 250,
      mar = c(2.8, 0, 0, 0),
      mgp = c(0, 0.45, 0))
BuildNull(7,M=c(4,7))
dev.off()
