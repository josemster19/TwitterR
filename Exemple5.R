# load packages
library(streamR);
library(ggmap);
library(twitteR);

# load credentials
load("credentials.RData");

# get tweets from specified location
filterStream("tweetsSpain.json", locations = c(-9, 35, 4, 44), timeout = 60, oauth = cred);
# parse tweets
tweets.df <- parseTweets("tweetsSpain.json", verbose = FALSE);
# get points set (lon/lat)
points <- data.frame(x = as.numeric(tweets.df$lon), y = as.numeric(tweets.df$lat));

# get map

register_google(key ="API_KEY")   # First time you need to register your session into google

spain <- get_map('Spain', zoom=6);
spainMap <- ggmap(spain, extent='device', legend='topleft');

# map + points of lon/lat from tweets
print(spainMap + geom_point(aes(x = x, y = y), data = points, colour = 'red', size = 1))
