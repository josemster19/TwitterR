library("igraph")
require("twitteR")

idscan = "lluisgesa"
n = 20

escaneados <- c()


start<-getUser(idscan)
friends.object<-lookupUsers(start$getFriendIDs())
friendsIds <- sapply(friends.object[1:n],id)
friends <- sapply(friends.object[1:n],name)
siguiente_nivel <-c()

followers.object<-lookupUsers(start$getFollowerIDs())
followersIds <- sapply(followers.object[1:n],id)
followers <- sapply(followers.object[1:n],name)

count = 0
mutualFriends <- c()
mutualFriendsIds <- c()
for(val in friends){
  if(is.element(val,followers)){
    mutualFriends[count] = val
    mutualFriendsIds[count] = friendsIds[match(val,friends)]
    count = count +1
  }
}
escaneados <- c(escaneados, start$id)
for(val in mutualFriendsIds){
  if(!is.element(val,escaneados)){
    siguiente_nivel <-c(siguiente_nivel,val)
  }
}


