#insall the tidyverse package and the load the library before running these codes after computer restart
install.packages("tidyverse")
library(tidyverse)
hotel_bookings <- read.csv("hotel_bookings.csv")
head(hotel_bookings)
colnames(hotel_bookings)

install.packages('ggplot2')
library(ggplot2)

#create scatterplot to explore the relationship between booking lead time and guests traveling with children
ggplot(data = hotel_bookings) +
  geom_point(mapping = aes(x = lead_time, y = children,))

#Your stakeholder asked about the group of guests who typically make early bookings, and this plot showed 
#that many of these guests do not have children

#Now, your stakeholder wants to run a family-friendly promotion targeting key market segments. She wants to
#know which market segments generate the largest number of bookings, and where these bookings are made 
#(city hotels or resort hotels)

ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = hotel, fill = market_segment))

#After creating this bar chart, you realize that it's difficult to compare the size of the market segments 
#at the top of the bars. You want your stakeholder to be able to clearly compare each segment

ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = hotel)) +
  facet_wrap(~market_segment)

#Your stakeholder asks if you can create a plot that shows the relationship between lead time and guests 
#traveling with children for online bookings at city hotels

onlineta_city_hotels <- filter(hotel_bookings, 
                               (hotel=="City Hotel" & 
                                  hotel_bookings$market_segment=="Online TA"))
View(onlineta_city_hotels) #to view the new data frame after applying filter

#another way to do this is to use the pipe operator
onlineta_city_hotels_v2 <- hotel_bookings %>%
  filter(hotel=="City Hotel") %>%
  filter(market_segment=="Online TA")
View(onlineta_city_hotels_v2)
