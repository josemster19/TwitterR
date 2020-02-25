searchTerm <- "Ronaldo"


# searchTwitter needs a session authorized, so maybe we need to do:
setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)


searchResults <- searchTwitter(searchTerm, n = 1000)  # Gather Tweets
tweetFrame <- twListToDF(searchResults)  # Convert to a nice dF

userInfo <- lookupUsers(tweetFrame$screenName)  # Batch lookup of user info
userFrame <- twListToDF(userInfo)  # Convert to a nice dF

locatedUsers <- !is.na(userFrame$location)  # Keep only users with location info
locatedUsers <- nchar(userFrame$location) != 0

locationUsers <- userFrame$location[locatedUsers]

locations <- geocode(locationUsers[1:50])  # Use amazing API to guess

# approximate lat/lon from textual location data.
with(locations, plot(lon, lat))

worldMap <- map_data("world")  # Easiest way to grab a world map shapefile

zp1 <- ggplot(worldMap)
zp1 <- zp1 + geom_path(aes(x = long, y = lat, group = group),  # Draw map
                       colour = gray(2/3), lwd = 1/3)
zp1 <- zp1 + geom_point(data = locations,  # Add points indicating users
                        aes(x = lon, y = lat),
                        colour = "RED", alpha = 1/2, size = 1)
zp1 <- zp1 + coord_equal()  # Better projections are left for a future post
zp1 <- zp1 + theme_minimal()  # Drop background annotations
print(zp1)