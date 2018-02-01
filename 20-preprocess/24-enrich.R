journey_data %<>% left_join(livecyclehireupdates %>% select(`StartStation Id` = id,
                                                           startstation_lat = lat,
                                                           startstation_long = long))
journey_data %<>% left_join(livecyclehireupdates %>% select(`EndStation Id` = id,
                                                           endstation_lat = lat,
                                                           endstation_long = long))
journey_data %<>% mutate(distance = gcd.hf(startstation_long, startstation_lat,
                                           endstation_long, endstation_lat))

