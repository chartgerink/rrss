tweeps_location <- function(twitter_username, following=FALSE, followers=FALSE) {
  # First check if at least one of the arguments needed (following/followers) was set to TRUE
  if (!following && !followers) {
    print("You must specify following OR followers = TRUE")
  } else if (following && followers) {
    print("You must specify just one, following OR followers = TRUE")
  } else {  
    if (followers) {
      tweeps_id <- get_followers(twitter_username)
      message("Obtaining data for ", length(tweeps_id$user_id), " followers of ", twitter_username)
    } else if (following) {
      tweeps_id <- get_friends(twitter_username)
      message("Obtaining data for ", length(tweeps_id$user_id), " followed by ", twitter_username)
    }
    
    tweeps <- lookup_users(tweeps_id$user_id)
    
    following_withLocation <- subset(tweeps, location != "")
    message("There are ", length(following_withLocation$location), " accounts with location information")
    
    locationData <- lapply(following_withLocation$location, function(x) 
    tryCatch(lookup_coords(x, key=geocode_API_key, box = FALSE),
           warning = function(w) {message("invalid location: ", x); NULL},
           error = function(e) {message("invalid location: ", x); NULL}
    ))
    
    locationData <- list.clean(locationData, is.null, recursive=FALSE)
    message("The Google Geocode API found ", length(locationData), " valid locations")
    
    stack <- locationData %>%
      unlist() %>%
      stack()
    
    lon <- as.numeric(stack[stack$ind=="point.lng",1])
    lat <- as.numeric(stack[stack$ind=="point.lat",1])
    df <- as.data.frame(cbind(lon, lat))
    return(df)
  }
}

FORCE11SCIdf_followers <- tweeps_location("FORCE11SCI", followers=TRUE) #by example, we use Force11 twitter account

