library(openintro)

# myPDF('schizoTree.pdf', 6.5, 3.4)
treeDiag(c('Truth', 'Test Result'),
         c(0.02, 0.98),
         list(c(0.95, 0.05),
              c(0.03, 0.97)),
         textwd = 0.25,
         solwd = 0.35,
         cex.main = 1.4,
         c('Schizo. (S)', 'Healthy (H)'),
         c('+', '-'),
         digits = 5,
         col.main = COL[1],
         showWork = TRUE)
# dev.off()
