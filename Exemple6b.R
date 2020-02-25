library("igraph")
start<-getUser("lluisgesa")
friends.object<-lookupUsers(start$getFriendIDs())
followers.object<-lookupUsers(start$getFollowerIDs())


n<-20
friends <- sapply(friends.object[1:n],name)
followers <- sapply(followers.object[1:n],name)

relations <- merge(data.frame(User='lluisgesa', Follower=friends), data.frame(User=followers, Follower='lluisgesa'), all=T)

g <- graph.data.frame(relations, directed = T)

V(g)$label <- V(g)$name

tkplot(g)
