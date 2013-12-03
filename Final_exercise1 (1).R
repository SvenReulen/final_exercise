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

dl_from_dropbox("woningwaardegemeenten.csv", "97saz2k2xkx3m73")
ww_gem_2012 = read.csv('woningwaardegemeenten.csv', fill=TRUE, sep = ";", header = T)

# 4. Create functions converting data following municipality reformations year by year
### Splitting municipalities in two datasets, reformed and not reformed
source('splittingdata.r')
devideddata <- splittingdata(mun_neth$GM_NAAM, gem_her$Nieuwe.gemeente, 2012)
no_reformations <- devideddata[1]
with_reformations <- devideddata[2]
### FUNCTION FOR ONE DATASET ADDING DATA FROM A DATASET TO THE MUN MAP FOR ALL THE MUNICIPALITIES IN no_reformations
no_reformations_data <- merge(no_reformations, ww_gem_2012)

### FUNCTION FOR THE SAME DATASET ADDING DATA FROM A DATASET TO THE MUN MAP FOR ALL THE MUNICIPALTIES IN DFWR
#   ADDING THE OLD MUNICIPALITIES TOGETHER
for(mun in gem_her$Oude.gemeenten)
  
with_reformations_data <- merge(with_reformations, gem_her)
subset(with_reformations_data, select=c("Oude.gemeenten", 'X', 'X.1', 'X.2', 'X.3', 'X.4'))
a <- head(with_reformations_data)[1:5]
a[1]
?subset
mun_neth@data = data.frame(mun_neth@data, dfnr[match(mun_neth@data[,2], dfnr[,1]),])

http://stackoverflow.com/questions/3650636/how-to-attach-a-simple-data-frame-to-a-spatialpolygondataframe-in-r
### Function for substracting the difference between the data now and in the year before to new number
differenceintime <- function(olddata, data2012){
  difference <- data2012-olddata
  return(difference)
}
mun_neth$name <-
  mun_neth$
  mun_neth$NewAT<-1:nrow(mun_neth)
mun_neth$NewAT
#   5. Load in CBS data of municipalities in the 18 years before 2012
### FOR DATASET OF 2012 WITHOUT REFORMATIONS
dl_from_dropbox("woningwaardegemeenten.csv", "97saz2k2xkx3m73")
ww_gem_2012 = read.csv('woningwaardegemeenten.csv', fill=TRUE, sep = ";", header = T)
mun_neth@data = data.frame(mun_neth@data, ww_gem_2012[match(mun_neth@data[,2], ww_gem_2012[,1]),])
mun_neth@data$woningwaarde
### FOR DATASET OF AN EARLIER YEAR

#   6. Run the functions on the data in order to make the data compatible to municipalities of 2012
convertingdata <- function(data, year, gem_her) # Split the municipality list in municipalities with reformations and
  # the ones without starting from the year of the data.
  mun_neth$"type in name" <-1:nrow(adddatawr <- function(namedata, dataset))

#   7. Join the compatible data to the shape file of municipalities in 2012

#   8. Create a nice plotting function with a standardized lay out 
http://stackoverflow.com/questions/15313273/r-map-how-do-i-fill-the-regions
http://stackoverflow.com/questions/9558040/ggplot-map-with-l

mun_neth@data$id <- rownames( mun_neth@data )
mun_neth.df <- as.data.frame( mun_neth )
mun_neth.fort <- fortify( mun_neth , region = "id" )
mun_neth.gg <- join( mun_neth.fort , mun_neth.df , by = "id" )
mun_neth.gg$id
n <- length(unique(mun_neth.gg$))
df <- data.frame(id = unique(mun_neth.gg$id),
                 growth = 4*runif(n),
                 category = factor(sample(1:5, n, replace=T)))
?runif
help(memory.size)

ggplot(data = mun_neth, aes(long, lat, group=group)) +
  geom_map(aes(fill = growth, color = category), map =mun_neth.gg) +
  scale_fill_gradient(high = "red", low = "white", guide = "colorbar")
scale_colour_hue(h = c(120, 240))
warnings()
ggplot(mun_neth$AANT_INW, aes(x=T_MEAN))

ggplot(aes(x=x,y=y,fill=AANT_INW),data=mun_neth)

test <- plot(mun_neth$AANT_INW)
plot(mun_neth)