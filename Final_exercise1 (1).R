# Author: Sven Reulen
# Date: 20-11-2013
# Dependencies
# Description: Final exercise for the course geoscripting
# Variables

rm(list = ls())
getwd()
### Home computer
#setwd("~/Wageningen/2.2 Geoscripting/data")
#datdir = "~/Wageningen/2.2 Geoscripting/data"
### School computer
setwd("M:/Applied_geoscripting/test")
datdir <- "M:/Applied_geoscripting/test"
source('packages.r')

# 1. Load map and data 2012
source('loadfromdropbox.r')
dl_from_dropbox("Netherlands.zip", "bocfjn1l2yhxzxe")
unzip("Netherlands.zip")
mun_neth <- readOGR('gem_2012_v1.shp', layer = 'gem_2012_v1')

# 2. Clean the shapefile from empty water areas
numberswithvalues <- which(mun_neth@data$AANT_INW > 0)
mun_neth <- mun_neth[numberswithvalues,]

# 3. Add a CSV file containing all municipal reformations in the last 18 years
dl_from_dropbox("Gemeentelijke_herindelingen.csv", "ks3o746s6wy1mdd")
gem_her = read.csv('Gemeentelijke_herindelingen.csv', fill=TRUE, sep = ",", header = T)

# 4. Create functions converting data following municipality reformations year by year
### Splitting municipalities in two datasets, reformed and not reformed
source('splittingdata.r')
### Calculating the reformations
source('addingoldmuns.r')

### Function for substracting the difference between the data now and in the year before to new number

#   5. Load in CBS data of municipalities in the 18 years before 2012
### FOR DATASET OF 2012 WITHOUT REFORMATIONS
dl_from_dropbox("woningwaardegemeenten.csv", "97saz2k2xkx3m73")
ww_gem_2012 = read.csv('woningwaardegemeenten.csv', fill=TRUE, sep = ";", header = T)

dl_from_dropbox("inwoners_1995.csv", "70zyf2ndkulx8l7")
inwoners1995 <- read.csv('inwoners_1995.csv', fill=TRUE, header = T)

#   6. Run the functions on the data in order to make the data compatible to municipalities of 2012
### Splitting municipalities in two datasets, reformed and not reformed
devideddata <- splittingdata(mun_neth$GM_NAAM, '2010')
no_reformations <- devideddata[1]
with_reformations <- devideddata[2]

#   7. Join the compatible data to the shape file of municipalities in 2012
http://stackoverflow.com/questions/3650636/how-to-attach-a-simple-data-frame-to-a-spatialpolygondataframe-in-r
### ADDING DATA FROM A DATASET TO THE MUN MAP FOR ALL THE MUNICIPALITIES IN no_reformations
no_reformations_data <- merge(no_reformations, ww_gem_2012)
### FUNCTION FOR THE SAME DATASET ADDING DATA FROM A DATASET TO THE MUN MAP FOR ALL THE MUNICIPALTIES IN DFWR
#   ADDING THE OLD MUNICIPALITIES TOGETHER
FUNCTION TO CALCULATE REFORMED MUNICIPALITIES

### Adding data to map (((DIRECTLY FROM DATASET)))
mun_neth@data = data.frame(mun_neth@data, ww_gem_2012[match(mun_neth@data[,2], ww_gem_2012[,1]),])

#   8. Create a nice plotting function with a standardized lay out 
mun_neth.fort <- fortify(mun_neth, region = "woningwaarde")
mun_neth.fort$id <- as.numeric(mun_neth.fort$id)
mun_neth.fort$id <- mun_neth.fort$id

ggplot(data = mun_neth.fort, aes(x = long, y = lat, fill = id, group = group)) +
  geom_polygon(colour = "black") +
  scale_fill_gradient(high = "red", low = "white", guide = "colorbar") +
  coord_equal() +
  theme() +
  ggtitle("Gemiddelde woningwaarde in duizendtallen")
