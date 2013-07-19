#do timeline of R Releases
#most of the code attributed to Ramnath Vaidyanathan
#see this for his much more impressive timeline
#http://ramnathv.github.io/sachin100s/

#manually went through R release mailing list to get dates
#assembled in a Google Docs spreadsheet
#here is the link from the published csv
#https://docs.google.com/a/timelyportfolio.com/spreadsheet/ccc?key=0AieeEIaS0AOsdHpPbmRaZkJtSW44M2pFQnRMaEJLcEE#gid=0

releaseDates <- read.csv(
  "https://docs.google.com/spreadsheet/pub?key=0AieeEIaS0AOsdHpPbmRaZkJtSW44M2pFQnRMaEJLcEE&output=csv",
  stringsAsFactors = FALSE
)
#delete last row since we will use R to fill timeline main
releaseDates <- releaseDates[-nrow(releaseDates),]

releaseList <- alply(releaseDates, 1, function(x){
  list(
    startDate = x$Start.Date,
    headline = x$Headline,
    text = getURLContent(x$Media, ssl.verifypeer = FALSE, useragent = "R"),
    asset = list(media = x$Media)
  )
})


# Create Timeline
m = Timeline$new()
m$main(
  headline =  
    paste0(
      "R Release History ",
      format(as.Date(tail(releaseDates,1)[,1],"%m/%d/%Y"),"%Y"), "-",
      format(as.Date(releaseDates[1,1],"%m/%d/%Y"),"%Y")
    ),
  type = 'default',
  text = "R is amazing.  Here is how it got that way.  Thanks to all the prolific contributors.
  Thanks Ramnath Vaidyanathan for <a href ='http://rcharts.io/site)'>rCharts</a> especially
  his <a href='http://ramnathv.github.io/sachin100s/'>timeline</a> which provided the code to generate all of this in R.",
  startDate =  format(as.Date(tail(releaseDates,1)[,1],"%m/%d/%Y"),"%Y,%m,%d"),
  asset = list(media = 'http://r-project.org')
)
m$config(
  font = "Merriweather-Newscycle"
)
names(releaseList) <- NULL
m$event(releaseList)
m$save('index.html')


# Modify JS Path to use Local Assets
x <- paste(readLines('index.html', warn = F), collapse = '\n')
x <- gsub('C:/Program Files/R/R-3.0.1/library/rCharts/libraries/timeline', 'compiled', x)
writeLines(x, con = 'index.html')