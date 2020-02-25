# load packages
library(streamR);

# load credentials
load("credentials.RData");

# connect to Twitter stream a get messages
filterStream("tweets.json", track = c("Obama", "Putin"), timeout = 60, oauth = cred);

# parse tweets
tweets.df <- parseTweets("tweets.json", simplify = TRUE);

# compute some measures
show(paste("Numero de tweets con #Obama:", length(grep("Obama", tweets.df$text, ignore.case = TRUE))));
show(paste("Numero de tweets con #Putin:", length(grep("Putin", tweets.df$text, ignore.case = TRUE))))
