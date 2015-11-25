# # Conditions for Version 1
# "M01.bmp" = "HighGain"
# "M02.bmp" = "LowGain"
# "M05.bmp" = "HighLoss"
# "M06.bmp" = "LowLoss"
# "M09.bmp" = "HighNeutral"
# "M10.bmp" = "LowNeutral"

attach(data)
# Which version of the task?
data$Version = ifelse(ExperimentName=="Phase-I-1_Short", "1",
                      ifelse(ExperimentName=="Phase-I-2_Short", "2",
                             ifelse(ExperimentName=="Phase-I-3_Short", "3",
                                    ifelse(ExperimentName=="Phase-I-4_Short", "4",
                                           ifelse(ExperimentName=="Phase-I-5_Short", "5",
                                                  "6"
                                    )))))

# Optimal response or no? Depends on task Version and face choice for that trial
data$Optimal = ifelse(Version=="1" & (TrialChoice=="M01.bmp" |                               
                        TrialChoice=="M06.bmp" |                                             
                        TrialChoice=="M09.bmp"), "1", 
                      ifelse(Version=="2" & (TrialChoice=="M02.bmp" |                               
                                               TrialChoice=="M05.bmp" |                                             
                                               TrialChoice=="M09.bmp"), "1", 
                             ifelse(Version=="3" & (TrialChoice=="M01.bmp" |                               
                                                      TrialChoice=="M06.bmp" |                                             
                                                      TrialChoice=="M09.bmp"), "1", 
                                    ifelse(Version=="4" & (TrialChoice=="M01.bmp" |                               
                                                             TrialChoice=="M10.bmp" |                                             
                                                             TrialChoice=="M05.bmp"), "1",
                                           ifelse(Version=="5" & (TrialChoice=="M09.bmp" |                               
                                                                    TrialChoice=="M02.bmp" |                                             
                                                                    TrialChoice=="M05.bmp"), "1",
                                                  ifelse(Version=="6" & (TrialChoice=="M05.bmp" |                               
                                                                           TrialChoice=="M10.bmp" |                                             
                                                                           TrialChoice=="M01.bmp"), "1",
                      "0"
                      ))))))

# What condition was the face pair? Depends on task Version and face choice for that trial
data$ConditionPair = ifelse(Version=="1" & (TrialChoice=="M01.bmp" | TrialChoice=="M02.bmp"), "Gain",
                            ifelse(Version=="1" & (TrialChoice=="M05.bmp" | TrialChoice=="M06.bmp"), "Loss",
                                   ifelse(Version=="2" & (TrialChoice=="M05.bmp" | TrialChoice=="M06.bmp"), "Gain",
                                          ifelse(Version=="2" & (TrialChoice=="M01.bmp" | TrialChoice=="M02.bmp"), "Loss",
                                                 ifelse(Version=="3" & (TrialChoice=="M09.bmp" | TrialChoice=="M10.bmp"), "Gain",
                                                        ifelse(Version=="3" & (TrialChoice=="M05.bmp" | TrialChoice=="M06.bmp"), "Loss",
                                                               ifelse(Version=="4" & (TrialChoice=="M01.bmp" | TrialChoice=="M02.bmp"), "Gain",
                                                                      ifelse(Version=="4" & (TrialChoice=="M09.bmp" | TrialChoice=="M10.bmp"), "Loss",
                                                                             ifelse(Version=="5" & (TrialChoice=="M09.bmp" | TrialChoice=="M10.bmp"), "Gain",
                                                                                    ifelse(Version=="5" & (TrialChoice=="M01.bmp" | TrialChoice=="M02.bmp"), "Loss",
                                                                                           ifelse(Version=="6" & (TrialChoice=="M05.bmp" | TrialChoice=="M06.bmp"), "Gain",
                                                                                                  ifelse(Version=="6" & (TrialChoice=="M09.bmp" | TrialChoice=="M10.bmp"), "Loss",
                                   "Nothing"
                                   ))))))))))))

# GEEZBUS THERE HAS TO BE SOMETHING BETTER THAN IFELSE STATEMENTS, GAWD
detach(data)