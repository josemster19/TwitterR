# tm -> text mining
library(tm)

reviews <- read.csv ("Reviews.csv", stringsAsFactors=FALSE)

str(reviews)

review_text <- paste(reviews$text, collapse=" ")

review_source <- VectorSource(review_text)

corpus <- Corpus(review_source)

corpus <- tm_map(corpus, removePunctuation)

corpus <- tm_map(corpus, stripWhitespace)

corpus <- tm_map(corpus, content_transformer(tolower))

dtm <- DocumentTermMatrix(corpus)

dtm2 <- as.matrix(dtm)

frequency <- colSums(dtm2)

frequency <- sort(frequency, decreasing=TRUE)

library(wordcloud)

words <- names(frequency)

wordcloud(words[1:100], frequency[1:100])