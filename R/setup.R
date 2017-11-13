# https://apps.twitter.com/

setup_map <- function (twitter_key, twitter_secret, geo_pat) {
  Sys.setenv(twitter_key = twitter_key,
  	twitter_secret = twitter_secret,
  	geo_pat = geo_pat)
  token <- rtweet::create_token(app="fiajfkdjflskdjflksadj", consumer_key=twitter_key, consumer_secret=twitter_secret)
  
  return(token)
}
