library(tidyverse)
library(ggalluvial)

OccuData <- read.csv("Occupation.csv")

data <- as.data.frame(OccuData)


p <- ggplot(data,
            aes(x = data$committee_name))

p + geom_bar(aes(fill = (data$contributor_occupation)))+
  coord_flip()

