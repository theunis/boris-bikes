# data from http://cycling.data.tfl.gov.uk/
journey_data <- read_csv('00-data/18JourneyDataExtract10Aug2016-16Aug2016.csv')
library(XML)
# download.file('https://tfl.gov.uk/tfl/syndication/feeds/cycle-hire/livecyclehireupdates.xml',
#               'livecyclehireupdates.xml',quiet = TRUE)
livecyclehireupdates_xml <- read_file('livecyclehireupdates.xml')
livecyclehireupdates <- xmlToDataFrame(livecyclehireupdates_xml)
