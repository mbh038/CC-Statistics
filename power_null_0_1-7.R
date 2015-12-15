library(openintro)
data(COL)

BuildNull <- function(xlim = c(-10, 10)) {
  normTail(0, 1.70, L = -1000, U = 1000,
           df = 50, lwd = 2.5, axes = FALSE,
           curveColor = COL[1],
           xlim = xlim)
  axis(1, at = seq(-15, 15, 3))
  mtext(expression(bar(x)[trmt] - bar(x)[ctrl]),
        side = 1, line = 1.8)
  text(1.2, 0.2, "Null distribution", col = COL[1], pos = 4)
  lines(rep(0, 2), c(0, dnorm(0, 0, 1.70)),
        col = COL[1,4], lwd = 0.5)
}

# _____ Null Distribution Only _____ #
myPNG('power_null_A_0_1-7.png',
      800, 250,
      mar = c(2.8, 0, 0, 0),
      mgp = c(0, 0.45, 0))
BuildNull()
dev.off()



# _____ Null Distribution + Rejection Regions _____ #
myPNG('power_null_B_0_1_7_with_rejection_region.png',
      800, 300,
      mar = c(2.8, 0, 0, 0),
      mgp = c(0, 0.45, 0))
BuildNull()

segments(3.3 * c(-1, 1), rep(0, 2), y1 = rep(0.15, 2),
         col = COL[4], lty = 3, lwd = 3)
segments(3.3 * c(-1, 1), rep(0, 2), y1 = rep(0.15, 2),
         col = COL[4], lty = 3, lwd = 1.5)
text(c(-6, 0, 0, 6), c(0.07, 0.09, 0.05, 0.07),
     c(expression("Reject " * H[0]),
       "Do not",
       expression("reject " * H[0]),
       expression("Reject " * H[0])),
     col = COL[4])
dev.off()



# _____ Null Distribution + Alternative At -3 _____ #
myPNG('power_null_C_0_1_7_with_alt_at_3.png',
      700, 200,
      mar = c(2.8, 0, 0, 0),
      mgp = c(0, 0.45, 0))
#BuildNull(xlim = c(-9, 10))
normTail(-3, 1.70, L = -1000, U = 1000,
         df = 50, lwd = 2.5, add = TRUE,
         curveColor = COL[2],xlim = c(-8.8, 10))

x=seq(-9,9,.1)
y=dnorm(x,-3,1.7)
plot(x,y,col = COL[2],lwd=2.5,type="l",xaxp  = c(-9, 9, 6),axes=FALSE)
axis(1, at = seq(-15, 15, 3))

x=seq(-9,9,.1)
y=dnorm(x,0,1.7)
lines(x,y,col = COL[1],lwd=2.5,xaxp  = c(-9, 9, 6))

mtext(expression(bar(x)[trmt] - bar(x)[ctrl]),
      side = 1, line = 1.8)
text(1.2, 0.2, "Null distribution", col = COL[1], pos = 4)
lines(rep(-3, 2), c(0, dnorm(0, 0, 1.70)),
      col = COL[2,4], lwd = 0.5)
segments(3.3 * c(-1, 1), rep(0, 2), y1 = rep(0.15, 2),
         col = COL[4], lty = 3, lwd = 3)
segments(3.3 * c(-1, 1), rep(0, 2), y1 = rep(0.15, 2),
         col = COL[4], lty = 3, lwd = 1.5)
text(rep(-6.5, 2), c(0.21, 0.175),
     c("Distribution with",
       expression(mu[trmt] - mu[ctrl]*" = -3")),
     col = COL[2])
dev.off()



# _____ Null Distribution + Alternative At -3 + Shaded _____ #
myPNG('power_null_D_0_1-7_with_alt_at_3_and_shaded.png',
      700, 250,
      mar = c(2.8, 0, 0, 0),
      mgp = c(0, 0.45, 0))
#BuildNull(xlim = c(-9, 10))
normTail(-3, 1.70, L = -1000, U = 1000,
         df = 50, lwd = 2.5, add = TRUE,
         curveColor = COL[2],xlim = c(-8.8, 10))
x=seq(-9,9,.1)
y=dnorm(x,-3,1.7)
plot(x,y,col = COL[2],lwd=2.5,type="l",xaxp  = c(-9, 9, 6),axes=FALSE)

xshade=seq(-9,-3.3,.1)
yshade=dnorm(xshade,-3,1.7)

polygon(c(-9,xshade,-3.3),c(0,yshade,0),col=COL [16])

axis(1, at = seq(-15, 15, 3))
x=seq(-9,9,.1)
y=dnorm(x,0,1.7)
lines(x,y,col = COL[1],lwd=2.5,xaxp  = c(-9, 9, 6))

mtext(expression(bar(x)[trmt] - bar(x)[ctrl]),
      side = 1, line = 1.8)
text(1.2, 0.2, "Null distribution", col = COL[1], pos = 4)
lines(rep(-3, 2), c(0, dnorm(0, 0, 1.70)),
      col = COL[2,4], lwd = 0.5)
segments(3.3 * c(-1, 1), rep(0, 2), y1 = rep(0.15, 2),
         col = COL[4], lty = 3, lwd = 3)
segments(3.3 * c(-1, 1), rep(0, 2), y1 = rep(0.15, 2),
         col = COL[4], lty = 3, lwd = 1.5)
text(rep(-6.5, 2), c(0.21, 0.175),
     c("Distribution with",
       expression(mu[trmt] - mu[ctrl]*" = -3")),
     col = COL[2])
text(8,.22,"n = 100",cex=2.0)
dev.off()


# _____ Null Distribution + Alternative At -3 + Shaded n=500 _____ #
myPNG('power_null_D_0_1-7_with_alt_at_3_and_shaded_n500.png',
      700, 250,
      mar = c(2.8, 0, 0, 0),
      mgp = c(0, 0.45, 0))
#BuildNull(xlim = c(-9, 10))
normTail(-3, .76, L = -1000, U = 1000,
         df = 50, lwd = 2.5, add = TRUE,
         curveColor = COL[2],xlim = c(-8.8, 10))
x=seq(-9,9,.1)
y=dnorm(x,-3,0.76)
plot(x,y,col = COL[2],lwd=2.5,type="l",xaxp  = c(-9, 9, 6),axes=FALSE)

xshade=seq(-9,-1.49,.1)
yshade=dnorm(xshade,-3,0.76)

polygon(c(-9,xshade,-1.49),c(0,yshade,0),col=COL [16])

axis(1, at = seq(-15, 15, 3))
x=seq(-9,9,.1)
y=dnorm(x,0,0.76)
lines(x,y,col = COL[1],lwd=2.5,xaxp  = c(-9, 9, 6))

mtext(expression(bar(x)[trmt] - bar(x)[ctrl]),
      side = 1, line = 1.8)
text(1.2, 0.2, "Null distribution", col = COL[1], pos = 4)
lines(rep(-3, 2), c(0, dnorm(0, 0, 1.70)),
      col = COL[2,4], lwd = 0.5)
segments(1.49 * c(-1, 1), rep(0, 2), y1 = rep(0.15, 2),
         col = COL[4], lty = 3, lwd = 3)
segments(1.49 * c(-1, 1), rep(0, 2), y1 = rep(0.15, 2),
         col = COL[4], lty = 3, lwd = 1.5)
text(rep(-6.5, 2), c(0.21, 0.175),
     c("Distribution with",
       expression(mu[trmt] - mu[ctrl]*" = -3")),
     col = COL[2])

text(8,.4,"n = 500",cex=2.0)
dev.off()


# _____ Power of 80% _____ #
myPNG('power_80.png',
      700, 250,
      mar = c(2.8, 0, 0, 0),
      mgp = c(0, 0.45, 0))
#BuildNull(xlim = c(-9, 10))
normTail(-3, 1.071, L = -1000, U = 1000,
         df = 50, lwd = 2.5, add = TRUE,
         curveColor = COL[2],xlim = c(-8.8, 10))
x=seq(-9,9,.1)
y=dnorm(x,-3,1.071)
plot(x,y,col = COL[2],lwd=2.5,type="l",xaxp  = c(-9, 9, 6),axes=FALSE)

xshade=seq(-9,-2.1,.1)
yshade=dnorm(xshade,-3,1.071)

polygon(c(-9,xshade,-2.1),c(0,yshade,0),col=COL [16])
axis(1, at = seq(-15, 15, 3))
x=seq(-9,9,.1)
y=dnorm(x,0,1.071)
lines(x,y,col = COL[1],lwd=2.5,xaxp  = c(-9, 9, 6))

mtext(expression(bar(x)[trmt] - bar(x)[ctrl]),
      side = 1, line = 1.8)
text(1.2, 0.2, "Null distribution", col = COL[1], pos = 4)
lines(rep(-3, 2), c(0, dnorm(0, 0, 1.70)),
      col = COL[2,4], lwd = 0.5)
segments(2.1 * c(-1, 1), rep(0, 2), y1 = rep(0.15, 2),
         col = COL[4], lty = 3, lwd = 3)
segments(2.1 * c(-1, 1), rep(0, 2), y1 = rep(0.15, 2),
         col = COL[4], lty = 3, lwd = 1.5)
text(rep(-6.5, 2), c(0.21, 0.175),
     c("Distribution with",
       expression(mu[trmt] - mu[ctrl]*" = -3")),
     col = COL[2])
arrows(-3, 0.02, -2.15, 0.02,
       col = COL[3], lwd = 2,
       length = 0.05, code = 3)
text(-2.85, 0.018, "0.84 SE", pos = 3, col = COL[3], cex = 1.0)
rect(-1.5, 0.005, 0.5, 0.1, col = "#ffffffAA", border = "#00000000")
arrows(-2.05, 0.02, 0, 0.02,
       col = COL[4], lwd = 2,
       length = 0.05, code = 3)
text(-1, 0.018, "1.96 SE", pos = 3, col = COL[4], cex = 1.0)
dev.off()

# _____ Variable power _____ #
myPNG('power_80.png',
      700, 250,
      mar = c(2.8, 0, 0, 0),
      mgp = c(0, 0.45, 0))
#BuildNull(xlim = c(-9, 10))

sd=12
effect=3
n=50
alpha=.05
power=0.8
se=sqrt(2*sd^2/n)

normTail(-3, 1.071, L = -1000, U = 1000,
         df = 50, lwd = 2.5, add = TRUE,
         curveColor = COL[2],xlim = c(-8.8, 10))
x=seq(-9,9,.1)
y=dnorm(x,-effect,se)
plot(x,y,col = COL[2],lwd=2.5,type="l",xaxp  = c(-9, 9, 6),axes=FALSE)

xshade=seq(-9,-qnorm(1-alpha/2)*se,.1)
yshade=dnorm(xshade,-effect,se)

polygon(c(-9,xshade,-qnorm(1-alpha/2)*se),c(0,yshade,0),col=COL [16])
axis(1, at = seq(-15, 15, 3))
x=seq(-9,9,.1)
y=dnorm(x,0,se)
lines(x,y,col = COL[1],lwd=2.5,xaxp  = c(-9, 9, 6))

mtext(expression(bar(x)[trmt] - bar(x)[ctrl]),
      side = 1, line = 1.8)
text(1.2, 0.2, "Null distribution", col = COL[1], pos = 4)
lines(rep(-3, 2), c(0, dnorm(0, 0, 1.70)),
      col = COL[2,4], lwd = 0.5)
segments(-qnorm(1-alpha/2)*se * c(-1, 1), rep(0, 2), y1 = rep(0.15, 2),
         col = COL[4], lty = 3, lwd = 3)
segments(-qnorm(1-alpha/2)*se * c(-1, 1), rep(0, 2), y1 = rep(0.15, 2),
         col = COL[4], lty = 3, lwd = 1.5)


dev.off()