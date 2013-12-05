source('~/Documents/vegsoup-standards/R/replaceTaxonRepository.R')

#	folder wise replacement

#	the folder
path <- "~/Documents/vegsoup-data/weißkirchen dta"
#	the day
day <- "2013-05-29"
#	file with instucions
file <- paste(path, "/recode ", day, ".txt", sep = "")	
#	recode2013-05-29.txt

rpl <- as.matrix(read.delim(file, colClasses = "character", header = FALSE))

#	check spaces!
rpl

