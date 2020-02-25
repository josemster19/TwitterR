library(RCurl)
options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))
require(twitteR)
library(ROAuth)

api_key <- "1OLNKXR09y8qZnYiLs1RzzCSn"

api_secret <- "wc0CQ8FPNFb3ECL2KPYagcSErrxYlNmZksrk1ztaH0anB9Qh3F"

access_token <- "2979743511-qzTuauOe2UNNDMjhPKFIxQwSBPQXGcDmXAh2maL"

access_token_secret <- "wNDm1DBPJlJ7Fl8TVnPyoEtIqVyyp09Saq8aJN0xrly3W"

reqURL <- "https://api.twitter.com/oauth/request_token"
accessURL <- "https://api.twitter.com/oauth/access_token"
authURL <- "https://api.twitter.com/oauth/authorize"

cred <- OAuthFactory$new(consumerKey=api_key,consumerSecret=api_secret,requestURL=reqURL,accessURL=accessURL,authURL=authURL, needsVerifier=TRUE)
cred$handshake(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))

setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)

save(cred, file="credentials.RData")
