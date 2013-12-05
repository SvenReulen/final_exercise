plottingmap <- function(variablename, titlemap){
  mun_neth.fort <- fortify(mun_neth, region = variablename)
  mun_neth.fort$id <- as.numeric(mun_neth.fort$id)
  mun_neth.fort$id <- mun_neth.fort$id
  ggplot(data = mun_neth.fort, aes(x = long, y = lat, fill = id, group = group)) +
    geom_polygon(colour = "black") +
    scale_fill_gradient(high = "red", low = "white", guide = "colorbar") +
    coord_equal() +
    theme() +
    ggtitle(titlemap)
}