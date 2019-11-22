library(tidyverse)
library(ggalluvial)

r <-read.csv("Bernie.csv")

data <- as.data.frame(r)

p <- ggplot(data,
            aes(y = data$total,
                axis1 = data$employer,
                axis2 = data$committee_name))

p + geom_alluvium(aes(fill = data$committee_name)) +
  geom_stratum(width = 1/12, fill = "black", color = "grey") +
  geom_label(stat = "stratum", label.strata = TRUE) +
  scale_x_discrete(limits = c("University","Candidate"), expand = c(.05, .05)) +
  scale_fill_brewer(type = "qual", palette = "Set1") 

g <- ggplot(data,
            aes(y = data$total,
                x = data$employer)
            )
g + geom_col(position = "dodge") +
  scale_y_continuous(limits = c(0,40000))+
  coord_flip()

