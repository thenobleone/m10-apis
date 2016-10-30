### Exercise 5 ###
library(jsonlite)
library(dplyr)

# Write a function that allows you to specify a movie, then does the following:
GetReview <- function (movie) {
  
  # Replace all of the spaces in your movie title with plus signs (+)
  movie.title <- gsub(' ', '+', movie)
  
  # Construct a search query using YOUR api key
  # The base URL is https://api.nytimes.com/svc/movies/v2/reviews/search.json?
  # See the interactive console for more detail:https://developer.nytimes.com/movie_reviews_v2.json#/Console/GET/reviews/search.json
  base.url <- 'https://api.nytimes.com/svc/movies/v2/reviews/search.json?'
  movie.api.key <- '&api-key=ca0f4f2a236842a9b0562c75facecb5b'
  request <- paste0(base.url, 'query=', movie.title, movie.api.key)
  
  # Request data using your search query
  results <- fromJSON(request)
  
  # What type of variable does this return?
  #typeof(results)
  
  # Flatten the data stored in the `$results` key of the data returned to you
  flat.results <- flatten(results$results)
  
  # From the most recent review, store the headline, short summary, and link to full article each in their own variables
  first.review <- flat.results[1,]
  headline <- first.review$headline
  summary <- first.review$summary_short
  link <- first.review$link.url
  
  # Return an list of the three pieces of information from above
  info <- list(headline = headline, summary = summary, link = link)
  
  return(info)
  
  }
# Test that your function works with a movie of your choice
AlmostFamouseInfo <- GetReview('Almost Famous')
