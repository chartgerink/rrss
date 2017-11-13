setup <- function (twitter_key, twitter_secret, geo_pat) {
  key <- "your_twitter_app_key"
  secret <- "your_twitter_app_secret"
  token <- rtweet::create_token(app="your_twitter_app_name",consumer_key=key, consumer_secret=secret)
  geocode_API_key <- "your_Google_geocode_api_key"
}
