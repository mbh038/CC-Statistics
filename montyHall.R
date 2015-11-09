## My Monty Hall code

# which door does the host choose?
montydoor<-function(prizedoor,guessdoor){
    if (prizedoor !=1 & guessdoor !=1){
        1
    } else if (prizedoor !=2 & guessdoor !=2){
        2
    } else {
        3
    }
}

# fraction of wins forthe chosen strategy (stay, switch, random) in numTrials attempts.
monty<-function(strategy="stay",numTrials=1000){
    
    doors<-1:3
    wins=0
    for (i in 1:numTrials) {
        prizedoor=sample(1:3,1)
        guessdoor=sample(1:3,1)
        hostdoor<-montydoor(prizedoor,guessdoor)
        
        if (strategy=="stay"){
            guessdoor=guessdoor
        } else if (strategy=="switch"){
            guessdoor=doors[-c(guessdoor,hostdoor)]
        } else if (strategy=="random"){
            guessdoor=sample(c(guessdoor,doors[-c(guessdoor,hostdoor)]),1)
        }
        if (guessdoor==prizedoor){
            wins=wins +1
        } 
    }
    wins/numTrials # return the win fraction
}

theFullMonty<-function(numTrials=1000){

    wins <- as.data.frame(matrix(nrow = numTrials, ncol = 4))
    names(wins)<-c("Trials","Stay","Switch","Random")

    for (N in 1:numTrials){
        wins$Trials[N]<-N
        wins$Stay[N]<-monty("stay",N)
        wins$Switch[N]<-monty("switch",N)
        wins$Random[N]<-monty("random",N)
    }

    # plot the results
    plot(wins$Trials,wins$Stay,
         type="l",
         col="red",
         xlim=c(0,numTrials),
         ylim=c(0,1),
         xlab="Number of trials",ylab="Win fraction" )
    lines(wins$Trials,wins$Switch,col="blue")
    lines(wins$Trials,wins$Random,col="green")
    legend("topright",
           inset=.02,
           cex=0.8,
           c("Stay","Switch","Random"),
           col=c("red","blue","green"),
           lty=c(1,1,1))
 
}
