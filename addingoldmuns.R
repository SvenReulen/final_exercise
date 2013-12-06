reforms <- subset(gem_her, Jaar >= 1995)
old_muns <- reforms[2:7] 
old_muns <- merge(old_muns, melt(inwoners1995, id.var="Onderwerpen"), by.x="Oude.gemeenten", by.y="Onderwerpen")
old_muns1 <- merge(old_muns, melt(inwoners1995, id.var="Onderwerpen"), by.x="X", by.y="Onderwerpen")
old_muns2 <- merge(old_muns, melt(inwoners1995, id.var="Onderwerpen"), by.x="X.1", by.y="Onderwerpen")
old_muns3 <- merge(old_muns, melt(inwoners1995, id.var="Onderwerpen"), by.x="X.2", by.y="Onderwerpen")
old_muns4 <- merge(old_muns, melt(inwoners1995, id.var="Onderwerpen"), by.x="X.3", by.y="Onderwerpen")
old_muns5 <- merge(old_muns, melt(inwoners1995, id.var="Onderwerpen"), by.x="X.4", by.y="Onderwerpen")
old_muns5
with_reformations <- data.frame(devideddata[2])
ADD DATA TO ALL COLUMNS 
SUM DATA 
ADD TO MUNICIPAL
