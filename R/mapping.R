mp <- NULL
mapWorld <- borders("world", colour="gray80", fill="gray60") # create a layer of borders
mp <- ggplot() +   mapWorld
mp <- mp + geom_point(data=FORCE11SCIdf_followers, aes(x = lon, y = lat, fill="red", alpha=0.5), size=3, shape=21) +
  ggtitle("@FORCE11SCI followers locations")
mp
