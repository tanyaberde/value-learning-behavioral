# Calculate the final learning rates of each subject in each condition/face pair type.

attach(tempdata)

# Factorize grouping variables
Subject = factor(Subject)
ConditionPair = factor(ConditionPair)
Bin = factor(Bin)
detach(tempdata)

# Calculate average cumulative proportion every 10 trials
# Compute mean Cumul.Percent.Optimal and ddply over each of the 10 bins
require(plyr)

Ten.Bin.Means = ddply(tempdata,.(Subject, ConditionPair, Bin),
                    summarize, 
                    Bin.Percent.Optimal=mean(Cumul.Percent.Optimal)
                    )

# Calculate average cumulative proportion of the last 3 bins (30 trials). This is the final learning rate.
Final.Rate.data <- subset(Ten.Bin.Means, Bin=="18" | Bin=="19" | Bin=="20") # Grab last 30 trials of all subjects

Final.Rate = ddply(Final.Rate.data,.(Subject, ConditionPair), 
                 summarize,
                 Final.Percent.Optimal=mean(Bin.Percent.Optimal) # Calculate average learning rate for last 30 trials for each subject
                 )
# Restructure the Final.Rate dataset using cast()
require(reshape)
Final.Rate <- cast(Final.Rate,Subject~ConditionPair)

# Code whether they learned (> 60%) the Gain and Loss faces, or not
attach(Final.Rate)
Final.Rate$Learner = ifelse((Gain >= 0.6 & Loss >= 0.6),
                            "1","0")
detach(Final.Rate)

# Save result as csv
write.csv(Final.Rate, "LearningRates.csv")