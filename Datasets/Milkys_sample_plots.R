
library(ggplot2)  # for plotting
library(dplyr)    # for filter and %>%

#
# Individual measurements  
#
dat_ind <- read.csv("Milkys_individual_data_selection.csv")

ggplot(dat_ind %>% filter(Substance == "HG" & Species == "Gadus morhua" & Station_code == "30B"), 
       aes(Body_length, Conc, color = Limit_of_quantification)) +
  geom_point() +
  facet_wrap(vars(Year)) +
  labs(title = "Mercury concentration vs. body length")

#
# Median per station*year  
#
dat_median <- read.csv("Milkys_median_data_selection.csv")

param <- "CB118"
ggplot(dat_median %>% filter(Substance == param & Species == "Mytilus edulis"), 
       aes(Year, Conc, color = Limit_of_quantification)) +
  geom_point() +
  facet_wrap(vars(Station_code)) +
  labs(title = paste(param, "in blue mussel"))
