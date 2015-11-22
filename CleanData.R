# setwd("C:/Users/cdedios/Dropbox/AB ERP/analyses/behavioral")

# You first want to merge all individual subject edat files into one using E-Merge
# Then read the data
raw.data <- read.delim("Phase I raw/Learning I 302-001.txt", 
                          skip = 1,
                          header = T,
                          na.strings = "",
                          fileEncoding = "UTF-16") # Damn you, encoding!

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

# Source the appropriate Group-n.R script