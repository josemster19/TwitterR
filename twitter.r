require(twitteR)

api_key <- "1OLNKXR09y8qZnYiLs1RzzCSn"

api_secret <- "wc0CQ8FPNFb3ECL2KPYagcSErrxYlNmZksrk1ztaH0anB9Qh3F"

access_token <- "2979743511-qzTuauOe2UNNDMjhPKFIxQwSBPQXGcDmXAh2maL"

access_token_secret <- "wNDm1DBPJlJ7Fl8TVnPyoEtIqVyyp09Saq8aJN0xrly3W"

setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)

searchResults <- searchTwitter("#21dias", n=26)

print(searchResults)

