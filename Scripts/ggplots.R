library(tidyverse)

gapminder <- read_csv("data/gapminder_data.csv")

gapminder_1977 <- filter(gapminder, year==1977)

gapminder_1977

# plot gdpPercap against lifeExp for all the countries 
# in all continents (with different colour for different continent 
# and different sized spot for population size) for the year 1977

ggplot(data = gapminder_1977, mapping = aes(x=gdpPercap, y=lifeExp, colour = continent, size = pop))+geom_point()

ggplot(data = gapminder_1977, mapping = aes(x=gdpPercap, y=lifeExp, colour = continent))+geom_point()
ggplot(data = gapminder_1977, mapping = aes(x=gdpPercap, y=lifeExp, colour = continent, size = pop))+geom_point()+scale_x_log10()

ggplot(data = gapminder_1977, mapping = aes(x=lifeExp, y=gdpPercap, colour = pop, size = continent))+geom_point()

ggplot(data = gapminder_1977, mapping = aes(x=continent, y=pop, colour = lifeExp, size = gdpPercap))+geom_point()
ggplot(data = gapminder_1977, mapping = aes(x=lifeExp, y=gdpPercap, colour = continent, size = pop))+geom_point()
gapminder_1977 %>% ggplot() + geom_point(mapping = aes(x=gdpPercap, y=lifeExp, shape = continent, colour= pop))+scale_x_log10()
help("aes")
help(geom_point)
gapminder_1977 %>% ggplot(mapping = aes(x=gdpPercap, y=lifeExp, colour = continent, size= pop))+geom_point(colour='blue',size=5)+scale_x_log10()

# numbers for shapes are found by googling

ggplot(
data = gapminder_1977, 
mapping = aes(x=gdpPercap, y=lifeExp, shape = continent, colour = pop)
)+
geom_point(alpha =.4,colour='red', shape=0) +
scale_x_log10()

ggplot(data = gapminder_1977, mapping = aes(x=gdpPercap, y=lifeExp, colour = continent, size = pop)
)+geom_point(colour='green', shape=6) +scale_x_log10()

# challenge 7
# scatterplot using gapminder data showing the change of life expectancy over time

ggplot(data = gapminder, mapping = aes(x=year, y=lifeExp, colour = continent, size = pop))+geom_point()

# show the same thing with more transparency by adjusting the alpha value)
ggplot(data = gapminder, mapping = aes(x=year, y=lifeExp, colour = continent, size = pop))+geom_point(alpha=0.4)

# showing same without any colour or to show different contients and size of the population

ggplot(data = gapminder, mapping = aes(x=year, y=lifeExp))+geom_point()

# scatterplot using gapminder data showing the change of life expectancy over time without indicating the population size

ggplot(data = gapminder, mapping = aes(x=year, y=lifeExp, colour = continent))+geom_point()

# line plot using gapminder data showing the change of life expectancy over time without indicating the population size
# but this doesn't make much sense

ggplot(data = gapminder, mapping = aes(x=year, y=lifeExp, colour = continent))+geom_line()

# by grouping by country we can show the data for a country as a seperate line 
ggplot(data = gapminder, mapping = aes(x=year, y=lifeExp, colour = continent, group=country))+geom_line()

# adding another layer - the following will show the same as above with both points and lines)
ggplot(data = gapminder, mapping = aes(x=year, y=lifeExp, colour = continent, group=country))+geom_line()+
geom_point()

# the following will show the points in black colour (both of the following)

ggplot(data = gapminder, mapping = aes(x=year, y=lifeExp, colour = continent, group=country))+geom_line()+
  geom_point(colour='black')

# by changing the order they are written determines which layer comes to the top

ggplot(data = gapminder, aes(x=year, y=lifeExp, group=country))+geom_line(mapping = aes(colour = continent))+
  geom_point()

ggplot(data = gapminder, aes(x=year, y=lifeExp, group=country))+geom_point()+geom_line(mapping = aes(colour = continent))

# the following will show the points in black colour with better transparency

ggplot(data = gapminder, mapping = aes(x=year, y=lifeExp, colour = continent, group=country))+geom_point(colour='black', alpha = 0.3)+geom_line()
 
ggplot(data = gapminder, mapping = aes(x=year, y=lifeExp, colour = continent, group=country))+geom_line(mapping=aes(colour=continent))+
  geom_point(colour='black',alpha=0.4) 

#mapping row data

gapminder %>% ggplot(aes(x=gdpPercap,y=lifeExp))+geom_point(alpha=0.5)+scale_x_log10()

# to fit  simple relationship (geom_smooth)

gapminder %>% ggplot(aes(x=gdpPercap,y=lifeExp))+geom_point(alpha=0.5)+scale_x_log10()+geom_smooth(method = 'lm')

# can play with the thickness of the line

gapminder %>% ggplot(aes(x=gdpPercap,y=lifeExp))+geom_point(alpha=0.5)+scale_x_log10()+geom_smooth(method = 'lm', size=1.5)

# Challenge 9 - modify the colour and size of the points

gapminder %>% ggplot(aes(x=gdpPercap,y=lifeExp))+geom_point(colour = 'red',size = 0.2, alpha=0.5)+scale_x_log10()+geom_smooth(method = 'lm', size =1.5)

# Challenge 10 - points with different shape (triangles) and coloured by continents with new trendlines (same colour as per dots)
# both of the following commands do the same

gapminder %>% ggplot(aes(x=gdpPercap,y=lifeExp, colour =continent))+geom_point(size = 2, shape=17)+scale_x_log10()+geom_smooth(method = 'lm', size =1.5)

gapminder %>% ggplot(aes(x=gdpPercap,y=lifeExp))+geom_point(mapping = aes(colour=continent),size = 2, shape=17)+scale_x_log10()+geom_smooth(mapping = aes(colour = continent), method = 'lm', size =1.5)


#Scales

# one that we tried before (without assigned colours)
# e.g.1
ggplot(data = gapminder, mapping = aes(x=year, y=lifeExp, colour = continent))+geom_point()
# e.g.2
ggplot(data = gapminder, mapping = aes(x=gdpPercap, y=lifeExp, colour = continent))+geom_point()+scale_x_log10()

# new ones with assigned colour
# e.g.1
gapminder %>% ggplot(aes(x=year ,y=lifeExp, colour=continent))+geom_point()+scale_colour_manual(values = c("red","green","blue","purple","black"))
# e.g.2
ggplot(data = gapminder, mapping = aes(x=gdpPercap, y=lifeExp, colour = continent))+geom_point()+scale_x_log10()+scale_colour_manual(values = c("red","green","blue","purple","black"))

# using different colour scales

colours() # will show us a list of colours that R can use

ggplot(data = gapminder, mapping = aes(x=gdpPercap, y=lifeExp, colour = continent))+geom_point()+scale_x_log10()+scale_colour_manual(values = c("bisque4","brown1","cyan3","darksalmon","deeppink3"))

scale_color_brewer() # takes an argument pallette

# find the pallette names by googling

ggplot(data = gapminder, mapping = aes(x=gdpPercap ,y=lifeExp, colour=continent))+geom_point()+scale_x_log10()+scale_color_brewer(palette ="Dark2")

ggplot(data = gapminder, mapping = aes(x=gdpPercap ,y=lifeExp, colour=continent))+geom_point()+scale_x_log10()+scale_color_brewer(palette ="Blues")

ggplot(data = gapminder, mapping = aes(x=gdpPercap ,y=lifeExp, colour=continent))+geom_point()+scale_x_log10()+scale_color_brewer(palette ="Set1")

# Seperating figures

a_countries <- filter(gapminder,str_starts(country, "A"))
a_countries

#shows the trend for each continent (by grouping all countries in each continent start with an "A")

ggplot(data = a_countries, aes(x=year, y=lifeExp, colour = continent, group = country))+geom_line()


#adding layers (seperating more)

ggplot(a_countries, aes(x=year, y=lifeExp, colour = continent, group = country))+geom_line()+facet_wrap(~country)

# Challenge 12 = modify the full gapminder data set by adding a facet_wrap to demonstrate change through time
# both of the following produced same results

gapminder %>%  ggplot(aes(x=gdpPercap, y=lifeExp, colour = continent, size = pop))+geom_point(alpha=2)+scale_x_log10() + facet_wrap(~year)

ggplot(data = gapminder, aes(x=gdpPercap, y=lifeExp, colour = continent,size = pop))+geom_point(alpha=2)+scale_x_log10()+facet_wrap(~year)

# ggplots (<DATA>, AESTHETIC MAPPING)+<GEOM FUNCTION>>+<SCALE FUNCTION> +<FACETS FUNCTION)

# Challenge 13 = create a density plot of population, filled by continent

ggplot (data = gapminder, aes(x=pop,fill=continent))+geom_density(alpha=0.6)+scale_x_log10()+facet_wrap(~year)
 
library(tidyverse)

gapminder <- read_csv("data/gapminder_data.csv")

a_countries <- filter(gapminder,str_starts(country, "A"))
a_countries

# adding titles, axis titles etc to the plot
# done by saving the plot by assigning it to a variable
rough_plot <- ggplot(a_countries, aes(x=year, y=lifeExp, colour = continent, group = country))+geom_line()+facet_wrap(~country)

rough_plot+labs(title="Figure 1")
rough_plot+
  labs(title="Figure 1", 
       x="Year", 
       y="Life Expectancy",
       colour ="Continent")

# Challenge 1

rough_plot+
  labs(title="Change of life expectancy for 'A' countries", 
       x="Year", 
       y="Life Expectancy",
       colour ="Continent",caption = "source:gapminder data")

# Try in google to find better ways to name titles etc handing spaces between words

# Modifying looks

rough_plot+
  labs(title="Change of life expectancy for 'A' countries", 
       x="Year", 
       y="Life Expectancy",
       colour ="Continent",caption = "source:gapminder data")+theme_gray()

rough_plot+
  labs(title="Change of life expectancy for 'A' countries", 
       x="Year", 
       y="Life Expectancy",
       colour ="Continent",caption = "source:gapminder data")+theme_bw()

rough_plot+
  labs(title="Change of life expectancy for 'A' countries", 
       x="Year", 
       y="Life Expectancy",
       colour ="Continent",caption = "source:gapminder data")+theme_bw()+theme(panel.grid.minor = element_blank())

rough_plot+
  labs(title="Change of life expectancy for 'A' countries", 
       x="Year", 
       y="Life Expectancy",
       colour ="Continent",caption = "source:gapminder data")+theme_bw()+theme(panel.grid.minor = element_blank(), plot.title = element_text(face = "bold"))

# Challenge 2
# 1. To remove the grey boxes behind the country name
rough_plot+
  labs(title="Change of life expectancy for 'A' countries", 
       x="Year", 
       y="Life Expectancy",
       colour ="Continent",caption = "source:gapminder data")+theme_bw()+theme(strip.background  = element_blank())

# 2. Increase the size of the major gridlines
rough_plot+
  labs(title="Change of life expectancy for 'A' countries", 
       x="Year", 
       y="Life Expectancy",
       colour ="Continent",caption = "source:gapminder data")+theme_bw()+theme(strip.background  = element_blank())+theme(panel.grid.major = element_line(size=1))
# 3. Change the axis titles to be shrunk to size 10 and colour blue 
rough_plot+
  labs(title="Change of life expectancy for 'A' countries", 
       x="Year", 
       y="Life Expectancy",
       colour ="Continent",caption = "source:gapminder data")+theme_bw()+theme(strip.background  = element_blank())+theme(panel.grid.major = element_line(size=1))
# Change axis title to be shrunk to size 10 and coloured blue ???

rough_plot+
  labs(title="Change of life expectancy for 'A' countries", 
       x="Year", 
       y="Life Expectancy",
       colour ="Continent",caption = "source:gapminder data")+theme_bw()+theme(panel.grid.major = element_line(size=1)+axis.title = element_text(size = 10, colour = "blue"))

# Saving the images of plots
# 1 assign the final plot a name

lifeEx_Final <- rough_plot+
  labs(title="Change of life expectancy for 'A' countries", 
       x="Year", 
       y="Life Expectancy",
       colour ="Continent",caption = "source:gapminder data")+theme_bw()+theme(panel.grid.major = element_line(size=1))
lifeEx_Final

# save
ggsave(filename = "Results/LifeExp.png", plot = lifeEx_Final, width = 12, height =10, dpi=300, units = "cm")
# another way to do the same
ggsave(filename = "Results/rough.png", width = 12, height =10, dpi=300, units = "cm")

install.packages("cowplot")
library(cowplot)

plot1 <- ggplot(gapminder, aes(x=gdpPercap,y=lifeExp))+geom_point()
plot1
plot2 <- ggplot(gapminder, aes(x=continent,y=lifeExp))+geom_boxplot()
plot2
plot3 <- ggplot(gapminder, aes(x=gdpPercap,y=pop))+geom_point()
plot3
plot4 <- ggplot(gapminder, aes(x=lifeExp,y=pop))+geom_point()
plot4

# to see all the plots in one panel

plot_grid(plot1, plot2, plot3, plot4)

plot_grid(plot1, plot2, plot3, plot4, rel_heights = c(1,3), rel_widths = c(4,1))

plot_grid(plot1, plot2, plot3, plot4, labels = "auto")

library(tidyverse)

gapminder <- read_csv("data/gapminder_data.csv")
gapminder
aus_data <- filter(gapminder, country=="Australia")
ggplot(aus_data, aes(x=year, y=pop))+geom_line()
