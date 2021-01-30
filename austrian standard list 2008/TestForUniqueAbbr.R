#	run from shell
#	R -f TestForUniqueAbbr.R 

x <- read.csv2("~/Documents/vegsoup-standards/austrian standard list 2008/austrian standard list 2008.csv", stringsAsFactors = FALSE)

test <- df$abbr[ duplicated(x$abbr) ]

print(test)

test <- x$taxon[ duplicated(x$taxon) ]

print(test)