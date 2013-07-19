#do timeline of R Releases
#most of the code attributed to Ramnath Vaidyanathan
#see this for his much more impressive timeline
#http://ramnathv.github.io/sachin100s/

#manually went through R release mailing list to get dates
#assembled in a Google Docs spreadsheet
#here is the link from the published csv
#https://docs.google.com/a/timelyportfolio.com/spreadsheet/ccc?key=0AieeEIaS0AOsdHpPbmRaZkJtSW44M2pFQnRMaEJLcEE#gid=0

releaseDates <- read.csv(
  "https://docs.google.com/spreadsheet/pub?key=0AieeEIaS0AOsdHpPbmRaZkJtSW44M2pFQnRMaEJLcEE&output=csv"
)
