# setwd("C:/Users/cdedios/Dropbox/AB ERP/analyses/behavioral")

# If you merged all individual subject edat files into one using E-Merge, use lines 4~8 below:
raw.data <- read.delim("Phase I raw/001_137 merge.txt", 
#                           skip = 1,
                          header = T,
                          na.strings = "",
                          fileEncoding = "UTF-16") # Damn you, encoding!

# # If E-Merge isn't handy, read each individual file here and merge later
# d1 <- read.delim("Phase I raw/001_126 merge.txt", 
# #                  skip = 1,
#                  header = T,
#                  na.strings = "",
#                  fileEncoding = "UTF-16")
# 
# d2 <- read.delim("Phase I raw/127_129 merge.txt", 
#                  #                  skip = 1,
#                  header = T,
#                  na.strings = "",
#                  fileEncoding = "UTF-16")
# 
# d3 <- read.delim("Phase I raw/131_132 merge.txt", 
#                  #                  skip = 1,
#                  header = T,
#                  na.strings = "",
#                  fileEncoding = "UTF-16")
# 
# d4 <- read.delim("Phase I raw/133_134 merge.txt", 
#                  #                  skip = 1,
#                  header = T,
#                  na.strings = "",
#                  fileEncoding = "UTF-16")
# 
# # Merge
# raw.data <- merge(d1, d2, all=T)
# raw.data <- merge(raw.data, d3, all=T)
# raw.data <- merge(raw.data, d4, all=T)

# Drop unnecessary columns/E-Prime attributes, update datafile
drops <- c("Age", "Clock.Information", "DataFile.Basename", "Display.RefreshRate", 
           "ExperimentVersion", "SessionDate", "Group", "Handedness", "RandomSeed", "ResearchedID", 
           "RuntimeCapabilities", "RuntimeVersion", "RuntimeVersionExpected", 
           "SessionStartDateTimeUtc", "SessionTime", "StudioVersion", 
           "BlockList.Cycle", "BlockList.Sample", "Procedure.Block.", "Running.Block.", 
           "PairDisplay.ACC", "PairDisplay.CRESP", "PairDisplay.DurationError", "PairDisplay.OnsetDelay", "PairDisplay.OnsetTime", "PairDisplay.OnsetToOnsetTime", "PairDisplay.RTTime",
           "Procedure.Trial.", "Running.Trial.") 
data <- raw.data[,!(names(raw.data) %in% drops)]

rm(raw.data, drops) # Clean up
# rm(d1,d2,d3,d4) # Clean up

# Source the appropriate Group-n.R script
# Then run LearningRate.R