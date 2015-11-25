Pair.Type.Trial <- seq(1,200) # Produce vector of integers 1 through 200 to attach to each
                              # Subject x ConditionPair. There are 200 trials per face pair in one subject.
binRep = 10 # To bin each group of 10 trials
Bin <- rep(1:20, each=binRep) # Produce array of length 200, to be attached to each Subject x ConditionPair
nSubjects = as.integer(length(unique(data$Subject)))
sub.pair.reps = nSubjects*600 # Number of subjects x 

# Gain Pair
GainPair.data <- subset(data, ConditionPair=="Gain", select=c(Subject, Trial, Outcome, Optimal, Version, ConditionPair), drop = T) # Subset the trials of this pair type from the master dataset
GainPair.data$Pair.Type.Trial = rep(Pair.Type.Trial, nSubjects) # Pair.Type.Trial gives the trial number for this pair type
GainPair.data$Bin = rep(Bin, nSubjects) # Bin the 200 trials per condition into twenty 10-trial bins. 

## Update Gain Pair dataset with Cumul.Sum.Optimal and cumul.Percent.Optimal, retaining all other columns
require(plyr)
GainPair.data = ddply(GainPair.data,.(Subject),
                  summarize,
                  Cumul.Sum.Optimal=cumsum(Optimal), # Calculate subject's running total of optimal responses at each trial
                 Cumul.Percent.Optimal=Cumul.Sum.Optimal/Pair.Type.Trial, #  At trial n, divide running total by the index of trial n
                 Trial=Trial,
                 Outcome=Outcome,
                 Optimal=Optimal,
                 ConditionPair=ConditionPair,
                 Pair.Type.Trial=Pair.Type.Trial,
                 Bin=Bin,
                 Version=Version
)

# Loss Pair
LossPair.data <- subset(data, ConditionPair=="Loss", select=c(Subject, Trial, Outcome, Optimal, Version, ConditionPair), drop = T) # Subset the trials of this pair type from the master dataset
LossPair.data$Pair.Type.Trial = rep(Pair.Type.Trial, nSubjects) # Pair.Type.Trial gives the trial number for this pair type
LossPair.data$Bin = rep(Bin, nSubjects) # Bin the 200 trials per condition into twenty 10-trial bins. 

## Update Loss Pair dataset with Cumul.Sum.Optimal and cumul.Percent.Optimal, retaining all other columns
require(plyr)
LossPair.data = ddply(LossPair.data,.(Subject),
                      summarize,
                      Cumul.Sum.Optimal=cumsum(Optimal), # Calculate subject's running total of optimal responses at each trial
                      Cumul.Percent.Optimal=Cumul.Sum.Optimal/Pair.Type.Trial, #  At trial n, divide running total by the index of trial n
                      Trial=Trial,
                      Outcome=Outcome,
                      Optimal=Optimal,
                      ConditionPair=ConditionPair,
                      Pair.Type.Trial=Pair.Type.Trial,
                      Bin=Bin,
                      Version=Version
)

# Nothing Pair
NothingPair.data <- subset(data, ConditionPair=="Nothing", select=c(Subject, Trial, Outcome, Optimal, Version, ConditionPair), drop = T) # Subset the trials of this pair type from the master dataset
NothingPair.data$Pair.Type.Trial = rep(Pair.Type.Trial, nSubjects) # Pair.Type.Trial gives the trial number for this pair type
NothingPair.data$Bin = rep(Bin, nSubjects) # Bin the 200 trials per condition into twenty 10-trial bins. 

## Update Nothing Pair dataset with Cumul.Sum.Optimal and cumul.Percent.Optimal, retaining all other columns
require(plyr)
NothingPair.data = ddply(NothingPair.data,.(Subject),
                      summarize,
                      Cumul.Sum.Optimal=cumsum(Optimal), # Calculate subject's running total of optimal responses at each trial
                      Cumul.Percent.Optimal=Cumul.Sum.Optimal/Pair.Type.Trial, #  At trial n, divide running total by the index of trial n
                      Trial=Trial,
                      Outcome=Outcome,
                      Optimal=Optimal,
                      ConditionPair=ConditionPair,
                      Pair.Type.Trial=Pair.Type.Trial,
                      Bin=Bin,
                      Version=Version
)
# Combine all PairType datasets 2 at a time, end up with tempdata
GL.data <- merge(GainPair.data, LossPair.data, all=T)
GLN.data <- merge(GL.data, NothingPair.data, all=T)

tempdata <- GLN.data[order(GLN.data$Subject, GLN.data$ConditionPair), ]

rm(data,GL.data,GLN.data,
   GainPair.data,LossPair.data,NothingPair.data
   ) # Clean up