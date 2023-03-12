# copied from internet, not to be used as is

library(tidyverse)
library(ggthemes)

# Load map data
world_map = map_data("world")

distinct(world_map, region) %>%
  ggplot(aes(map_id = region)) +
  geom_map(map = world_map) +
  expand_limits(x = world_map$long, y = world_map$lat) +
  xlim(-80, 55) +
  ylim(-65, 70) +
  coord_equal() +
  theme_void()

countries <- world_map %>%
  distinct(region) %>%
  rowid_to_column()


world_map = map_data("world") %>%
  filter(! long > 180)

countries = world_map %>%
  distinct(region) %>%
  rowid_to_column()

countries %>%
  ggplot(aes(fill = rowid, map_id = region)) +
  geom_map(map = world_map) +
  expand_limits(x = world_map$long, y = world_map$lat) +
  theme_map()


distinct(world_map, region) %>%
  ggplot(aes(map_id = region)) +
  geom_map(map = world_map) +
  expand_limits(x = world_map$long, y = world_map$lat) +
  xlim(-80, 55) +
  ylim(-65, 70) +
  coord_equal() +
  theme_void()
