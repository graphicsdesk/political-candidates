library(tidyverse)
install.packages("ggalluvial")
library(ggalluvial)

d <-read.csv("Candidates Performance1.csv")

data <- as.data.frame(d)

p <- ggplot(data,
       aes(y = data$Columbia.Total.., 
           axis1 = data$Political.Party,
           axis2 = data$Candidate.Name)) 

p + geom_alluvium(aes(fill = data$Candidate.Name)) +
  geom_stratum(width = 1/12, fill = "black", color = "grey") +
  geom_label(stat = "stratum", label.strata = TRUE) +
  scale_x_discrete(limits = c("Party","Candidate"), expand = c(.05, .05)) +
  scale_fill_brewer(type = "qual", palette = "Set1") 

