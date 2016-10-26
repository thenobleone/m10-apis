### Exercise 3 ###
library(jsonlite)
library(dplyr)
# Use the `load` function to load in the nelly_tracks file.  That should make the data.frame
# `top_nelly` available to you
load(file = 'nelly_tracks.Rdata')

# Use the `flatten` function to flatten the data.frame -- note what differs!
nelly.flat <- flatten(top.nelly)

# Use your `dplyr` functions to get the number of the songs that appear on each album
nelly.track.count <- nelly.flat %>%
  group_by(album) %>% 
  summarise(n = n()) %>% 
  arrange(-n)


# Bonus: perform both of the steps above in one line (one statement)
