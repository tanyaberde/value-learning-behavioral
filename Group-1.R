# # Conditions
# "M01.bmp" = "HighGain"
# "M02.bmp" = "LowGain"
# "M05.bmp" = "HighLoss"
# "M06.bmp" = "LowLoss"
# "M09.bmp" = "HighNeutral"
# "M10.bmp" = "LowNeutral"

attach(data)
# Optimal or no?
data$Optimal = ifelse(TrialChoice=="M01.bmp" | 
                        TrialChoice=="M06.bmp" | 
                        TrialChoice=="M09.bmp", "1", "0")
detach(data)      

Pair.Type.Trial <- seq(1,200) # Produce vector of integers 1 through 200 to attach to each
                              # Face Pair dataset. There are 200 trials per face pair.
# Face Pair 1
Pair1.data <- subset(data, FacePairs=="1", select=c(Subject, Trial, Outcome, Optimal))
Pair1.data$Pair.Type.Trial = Pair.Type.Trial

Pair1.data$Cumul.Optimal <- cumsum(Pair1.data$Optimal)

