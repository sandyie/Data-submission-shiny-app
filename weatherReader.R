# housekeeping
rm(list=ls()) # remove everything currently held in the R memory
options(stringsAsFactors=FALSE)

# Setting working directory. Add in your own path in an if statement for your file structure
if (length(grep("Lizzie", getwd())>0)) { 
  setwd("~/Documents/git/projects/vinmisc/bcvin/hardiness") 
} else if (length(grep("sandyyiee", getwd())>0)) {
  setwd("~/bcvin/hardiness/dashboard/dashboard-sandy")
} else setwd("C:/Users/Faith Jones/Documents/ubc/github/bcvin/hardiness")
#setwd ("/home/faith/Documents/git/bcvin/hardiness")

setwd("~/bcvin/hardiness/dashboard/dashboard-sandy")
weatherData <- read.csv(file = "/Users/sandyyiee/bcvin/hardiness/dashboard/dashboard-sandy/2017weather.csv", sep=",", header=TRUE, stringsAsFactors = FALSE)
getwd()