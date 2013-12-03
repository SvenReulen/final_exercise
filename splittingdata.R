splittingdata <- function(SPDF_with_names, scale_map_with_ID, year_dataset){ 
  #& year < 2012 & year > 1995)
  dfnr <- data.frame(Date=as.Date(character()),                  
                     File=character(),                      
                     User=character(),                     
                     stringsAsFactors=FALSE)
  dfwr <- data.frame(Date=as.Date(character()),                  
                     File=character(),                   
                     User=character(),                   
                     stringsAsFactors=FALSE)
  options(stringsAsFactors=FALSE)
  for(mun in SPDF_with_names){
    if(mun %in% scale_map_with_ID){    #& y >= gem_her$Jaar                     
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