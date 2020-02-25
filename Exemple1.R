D <- data.frame(x=c(1,2,3,1), y=c(7,19,2,2))
D

#Sort on X
indexes <- order(D$x)
D[indexes,]

#Print out sorted dataset, sorted in reverse by y
D[rev(order(D$y)),]
