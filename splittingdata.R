splittingdata <- function(SPDF_with_names, year_dataset){ 
  dfnr <- data.frame(Date=as.Date(character()),                  
                     File=character(),                      
                     User=character(),                     
                     stringsAsFactors=FALSE)
  dfwr <- data.frame(Date=as.Date(character()),                  
                     File=character(),                   
                     User=character(),                   
                     stringsAsFactors=FALSE)
  options(stringsAsFactors=FALSE)
  reforms <- subset(gem_her, Jaar >= year_dataset)
  for(mun in SPDF_with_names){
    if(mun %in% reforms$Nieuwe.gemeente){
      dfwr <- rbind(dfwr, mun) 
    }
    else{
      dfnr <- rbind(dfnr, mun)
    }
  }
  names(dfnr) <- "GM_NAAM"
  names(dfwr) <- "With_reformations"
  return(c(dfnr, dfwr))
}