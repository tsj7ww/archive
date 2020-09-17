rm(list=ls())


#######################################################
################# LOAD BASIC VA MAP #################
#######################################################

#http://stackoverflow.com/questions/27328372/r-create-a-spatial-bubble-plot-that-overlays-a-basemap-of-the-us-and-other-spati

#library(maptools)
#library(mapproj)
#library(rgeos)
#library(rgdal)
#library(ggplot2)
#library(devtools)
# for theme_map
#devtools::source_gist("33baa3a79c5cfef0f6df")
# nice US map GeoJSON
#us <- readOGR(dsn="http://eric.clst.org/wupl/Stuff/gz_2010_us_040_00_500k.json", layer="OGRGeoJSON")
# even smaller polygons
#us <- SpatialPolygonsDataFrame(gSimplify(us, tol=0.1, topologyPreserve=TRUE), 
#                               data=us@data)
# don't need these for the continental base map
#us <- us[us$NAME %in% c("Virginia"),]
# for ggplot
#map <- fortify(us, region="NAME")


######################################################
################# LOAD COUNTY VA MAP #################
######################################################
library(ggplot2)
library(maptools)
library(rgeos)
library(Cairo)
library(ggmap)
library(scales)
library(RColorBrewer)
#install.packages("gpclib", type="source")
library(gpclib)
library(rgdal)
setwd("/Users/trev/Desktop/independent_research/va_solar_power")
virginia.shp <- readShapeSpatial("virginia.shp")
class(virginia.shp)
names(virginia.shp)
print(virginia.shp$COUNTY)

# generate made-up data file for coloring the map
num.counties<-length(virginia.shp$COUNTY)
county.data<-data.frame(county=virginia.shp$COUNTY, id=virginia.shp$FIPS, prevalence=rnorm(num.counties, 55, 20))

# prepare shapefile for merging with the data
virginia <- fortify(virginia.shp, region = "FIPS")

############################################
################# THE DATA #################
############################################
library(RMySQL)
con <- dbConnect(MySQL(), user='tsj7ww', password='x', host='x', 
                 port=x, dbname='x')
rs <- dbSendQuery(con, "Select * from solar_info_5_27")
    solar_info = fetch(rs, n=-1)
#keep + rename vars
solar_info$ID <- NULL
solar_info$FIPS <- NULL
solar_info$Description <- NULL
solar_info$Link <- NULL
solar_info$GNID <- NULL
solar_info$Location <- NULL
solar_info$`County/City` <- NULL
solar_info$`Acreage (acres)` <- NULL
solar_info$Wattage <- solar_info$`Wattage (MW)`
solar_info$`AC (0=Unspecified, 1=Yes)` <- NULL
solar_info$`Completion Date` <- NULL
solar_info$Notes <- NULL
solar_info$`Confidence (0=no, 1=maybe, 2=yes)` <- NULL
solar_info$`Wattage (MW)` <- NULL
solar_info$Wattage <- as.numeric(solar_info$Wattage)
solar_info$Latitude <- as.numeric(solar_info$Latitude)
solar_info$Longitude <- as.numeric(solar_info$Longitude)

###########################################
################# THE MAP #################
###########################################
gg <- ggplot()
# the base map
gg <- gg + geom_map(data=virginia, map=virginia,
                    aes(x=long, y=lat, map_id=id, group=group), #using Longitude & Latitude don't work
                    fill="#ffffff", color="#0e0e0e", size=0.15)
# your bubbles
gg <- gg + geom_point(data=solar_info, 
                      aes(x=Longitude, y=Latitude, size=Wattage), color="#AD655F") 
gg <- gg + labs(title="Solar Energy Production Plants")
# much better projection for US maps
gg <- gg + coord_map(projection="albers", lat=39, lat1=45)
#gg <- gg + theme_map()
gg <- gg + theme(legend.position="bottom")
gg <- gg + theme(plot.title=element_text(size=16))
gg