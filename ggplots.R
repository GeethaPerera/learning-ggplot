library(tidyverse)

gapminder <- read_csv("data/gapminder_data.csv")
gapminder_1977 <- filter(gapminder, year==1977)

