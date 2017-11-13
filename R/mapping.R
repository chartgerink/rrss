# x = tweeps_location() object
mapping <- function (x) {
  mp <- NULL
  mapWorld <- ggplot2::borders("world", colour="gray80", fill="gray60") # create a layer of borders
  mp <- ggplot2::ggplot() + mapWorld
  mp <- mp + ggplot2::geom_point(data=x, aes(x = lon, y = lat, fill="red", alpha=0.5), size=3, shape=21) +
    ggplot2::ggtitle("@FORCE11SCI followers locations")
  
  return(mp)
}

