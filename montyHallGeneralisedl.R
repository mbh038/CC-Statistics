## My Monty Hall code

sampleWithoutSurprises <- function(x,y) {
    if (length(x) <= 1) {
        return(x)
    } else {
        return(sample(x,y))
    }
}

# fraction of wins forthe chosen strategy (stay, switch, random) in numTrials attempts.
monty<-function(strategy="stay",numTrials=1000,numDoors=3,numPrizes=1){
    
    doors<-1:numDoors
    wins=0
    for (i in 1:numTrials) {
        prizedoors<-sample(1:numDoors,numPrizes)
        guessdoor<-sample(1:numDoors,1)
        hostdoor<-doors[!doors %in% c(prizedoors,guessdoor)]
        hostdoor<-sampleWithoutSurprises(hostdoor,1)
         if (strategy=="stay"){
             guessdoor=guessdoor
         } else if (strategy=="switch"){
             guessdoor=sample(doors[-c(guessdoor,hostdoor)],1)
         } else if (strategy=="random"){
             guessdoor<-sample(c(guessdoor,sample(doors[-c(guessdoor,hostdoor)],1)),1)
         }
         if (guessdoor %in% prizedoors){
             wins=wins +1
         } 
      }
     wins/numTrials # return the win fraction
}

theFullMonty<-function(numTrials=1000,numDoors=3,numPrizes=1){

    wins <- as.data.frame(matrix(nrow = numTrials, ncol = 4))
    names(wins)<-c("Trials","Stay","Switch","Random")

    for (N in 1:numTrials){
        wins$Trials[N]<-N
        wins$Stay[N]<-monty("stay",N,numDoors,numPrizes)
        wins$Switch[N]<-monty("switch",N,numDoors,numPrizes)
        wins$Random[N]<-monty("random",N,numDoors,numPrizes)
    }

    # plot the results
    plot(wins$Trials,wins$Stay,
         type="l",
         col="red",
         xlim=c(0,numTrials),
         ylim=c(0,1),
         xlab="Number of trials",
         ylab="Win fraction",
         main="Monty Hall, 4 doors, 2 prizes")
    lines(wins$Trials,wins$Switch,col="blue")
    lines(wins$Trials,wins$Random,col="green")
    legend("topright",
           inset=.02,
           cex=0.8,
           c("Stay","Switch","Random"),
           col=c("red","blue","green"),
           lty=c(1,1,1))
 
}
