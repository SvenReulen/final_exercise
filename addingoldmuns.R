old_muns <- reforms[2:7] 
reformations_data <- merge(old_muns$Oude.gemeenten, ww_gem_2012$woningwaarde)


ADD DATA TO ALL COLUMNS 
SUM DATA 
ADD TO MUNICIPAL

with_reformations_data <- merge(with_reformations, gem_her)

subset(with_reformations_data, select=c("Oude.gemeenten", 'X', 'X.1', 'X.2', 'X.3', 'X.4'))
a <- head(with_reformations_data)[1:5]
a[1]
?subset
mun_neth@data = data.frame(mun_neth@data, dfnr[match(mun_neth@data[,2], dfnr[,1]),])