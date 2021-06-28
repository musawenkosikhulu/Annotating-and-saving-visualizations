# In this activity, I’ll review a scenario, and practice adding annotations to a data visualization with ggplot2. I will also learn how to save images from ggplot2 visualizations 
# so that I can add them directly to presentations

# As a junior data analyst for a hotel booking company, I have been creating visualizations in `R` with the `ggplot2`  package to share insights about your data with stakeholders. 
# After creating a series of visualizations using `ggplot()`, `ggplot2` aesthetics, and filters, your stakeholder asks you to add annotations to your visualizations to help explain my findings in a presentation. 
# Luckily, `ggplot2` has annotation functions built in.

# Import the data 
hotel_bookings <- read.csv("hotel_bookings.csv")

# As a reminder I plotted the graph before but I will plot it again

ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel)

# Adding a title to my graphs

ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) +
  labs(title="Payment type by city")

# Finding the minimum and maximum at each city
min(hotel_bookings$arrival_date_year)
max(hotel_bookings$arrival_date_year)

mindate <- min(hotel_bookings$arrival_date_year)
maxdate <- max(hotel_bookings$arrival_date_year)

# Now, I will add in a subtitle using `subtitle=` in the `labs()` function. 
# Then, I can use the `paste0()` function to use my newly-created variables in your labels.
# This is really handy, because if the data gets updated and there is more recent data added, 
# I don't have to change the code below because the variables are dynamic.

ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title="Comparison of market segments by hotel type for hotel bookings",
       subtitle=paste0("Data from: ", mindate, " to ", maxdate))

# I have realized that this chart is displaying the technical details a little too prominently. 
# I don't want that to be the second thing people notice during the presentation. 
# I have decided to switch the `subtitle`  to a `caption` which will appear in the bottom right corner instead
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title="Comparison of market segments by hotel type for hotel bookings",
       caption=paste0("Data from: ", mindate, " to ", maxdate))

# Now I want to clean up the x and y axis labels to make sure they are really clear. 
# To do that, you can add to the `labs()` function and use `x=` and `y=`. 
# Feel free to change the text of the label and play around with it.

ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title="Comparison of market segments by hotel type for hotel bookings",
       caption=paste0("Data from: ", mindate, " to ", maxdate),
       x="Market Segment",
       y="Number of Bookings")

# Now I will save my work
ggsave('hotel_booking_chart.png', width=7,
       height=7)