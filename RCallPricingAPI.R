
library(httr)

url <- "http://localhost:61382/FirstService.asmx/MakePrice"
body <- list(Von="DE52",Nach="FR69",Strecke="700",Type="R")
RESTResult <- POST(url, body = body, encode = "form")
RESTResultParsed <- content(RESTResult,type="text")

s1 = unlist(strsplit(RESTResultParsed, split='/\">', fixed=TRUE))
s2 = unlist(strsplit(s1, split='</', fixed=TRUE))
as.numeric(gsub(",", ".", gsub("\\.", "", s2[2])))
ceiling(as.numeric(gsub(",", ".", gsub("\\.", "", s2[2]))))



#Details:

RESTResult <- POST(url, body = body, encode = "form", verbose())


Funktionierende Strecke: DE52-FR69-700
