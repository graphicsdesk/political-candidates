library(tidyverse)

raw <-read.csv("contributions.csv")

summary(raw$committee_name) ##for compiling total number per candidate

## Amount Over Time
raw$contribution_receipt_date <- as.Date(raw$contribution_receipt_date, "%m/%d/%y")

temp<-filter(raw, committee_name == "WARREN FOR PRESIDENT, INC.")
temp$contribution_receipt_date <- as.Date(temp$contribution_receipt_date, "%m/%d/%y")

p <- ggplot(
  data = raw, 
  mapping = aes(x = raw$contribution_receipt_date)
  )

p + geom_bar() +
  scale_x_date(limits = as.Date(c("2019-02-01","2019-10-01"))) +
  scale_y_continuous(limits = c(0,13))
  #facet_wrap(raw$committee_name)



 

