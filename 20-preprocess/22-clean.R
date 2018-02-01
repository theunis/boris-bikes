journey_data %<>% 
  mutate(`End Date` = as.POSIXct(`End Date`, format = '%d/%m/%Y %H:%M')) %>% 
  mutate(`Start Date` = as.POSIXct(`Start Date`, format = '%d/%m/%Y %H:%M'))

livecyclehireupdates %<>% 
  mutate(id = as.integer(id),
         lat = as.numeric(lat),
         long = as.numeric(long)) %>% 
  select(-nbBikes, -nbEmptyDocks, -nbDocks)