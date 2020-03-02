library("igraph")
require("twitteR")

escaneados <<-c()

relations <<-data.frame()

searchFriends<- function(idscan, n, prof, maxprof){
  print(idscan)
  if (prof < maxprof){
    print("Entramos en el primer If")
    start<-getUser(idscan)
    friends.object<-lookupUsers(start$getFriendIDs())
    friendsIds <- sapply(friends.object[1:n],id)
    friends <- sapply(friends.object[1:n],name)
    print("Tengo los amigos")
    siguiente_nivel <-c()
    followers.object<-lookupUsers(start$getFollowerIDs())
    followersIds <- sapply(followers.object[1:n],id)
    followers <- sapply(followers.object[1:n],name)
    print("Tengo los followers")
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
    if(length(mutualFriends) > 0){
      print("Tengo los amigos mutuos")
      print(mutualFriends)
      escaneados <<- c(escaneados, start$id)
      print("Añadido a escaneados")
      for(val in mutualFriendsIds){
        if(!is.element(val,escaneados)){
          print(val)
          siguiente_nivel <-c(siguiente_nivel,val)
        }
      }
      print("Estos van al siguiente nivel")
      print(siguiente_nivel)
      
      x <- merge(data.frame(User=start$getName(), Follower = mutualFriends),data.frame(User=mutualFriends, Follower = start$getName()), all = T)
      print(x)
      if(is.null(relations$User) | is.null(relations$Follower)){
        relations <<- data.frame(x)
      }else{
        relations <<- merge(x, relations, all = T)
      }
      
      
      for(val in siguiente_nivel){
        searchFriends(idscan = val , n = n ,prof = prof + 1, maxprof = maxprof)
      }
      
    }

  }
}

searchFriends(idscan = "lluisgesa", n = 20, prof = 0, maxprof = 3)

if(is.null(relations$User) | is.null(relations$Follower)){
  print("El usuario no tiene amigos :( o por lo menos en el rango n seleccionado")
}else{
  g <- graph.data.frame(relations, directed = T)
  V(g)$label <- V(g)$name
  tkplot(g)
}


