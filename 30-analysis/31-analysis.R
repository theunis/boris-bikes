journey_data %<>% mutate(km_per_hour = distance/(Duration/60))
library(leaflet)

journeys_start <- journey_data %>% group_by(`StartStation Name`, startstation_long, startstation_lat) %>% 
  summarise(avg_duration = mean(Duration, na.rm = TRUE))
journeys_end <- journey_data %>% group_by(`EndStation Name`, endstation_long, endstation_lat) %>% 
  summarise(avg_duration = mean(Duration, na.rm = TRUE))

leaflet(journeys_start) %>% addProviderTiles('CartoDB.Positron') %>% 
  addCircleMarkers(lng = ~startstation_long, lat = ~startstation_lat, 
                   radius = ~avg_duration/200, 
                   stroke = FALSE, fillColor = 'green',
                   fillOpacity = 0.6,
                   popup = ~paste0('<strong>',`StartStation Name`,'</strong><br />',
                                   avg_duration))
leaflet(journeys_end) %>% addProviderTiles('CartoDB.Positron') %>% 
  addCircleMarkers(lng = ~endstation_long, lat = ~endstation_lat, 
                   radius = ~avg_duration/200, 
                   stroke = FALSE, fillColor = 'red',
                   fillOpacity = 0.6,
                   popup = ~paste0('<strong>',`EndStation Name`,'</strong><br />',
                                   avg_duration))
