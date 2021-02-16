#	2020-01-30
#	kardinal.eros@gmail.com
#	link nomenclature of EuroVegChecklist to *austrian standard list 2008.csv*

#	prepare workspace
rm(list = ls())
library(stringr)

#	cast orginal data source
x <- read.csv("~/Documents/vegsoup-standards/vegetation of europe/evc1 species original.csv",
	stringsAsFactors = FALSE)
names(x) <- tolower(names(x))

r <- aggregate(x$code, by = list(x$name), FUN = function (x) paste(x, collapse = "+"))
names(r) <- c("taxon", "evc.class.code")

r$taxon <- gsub("*", "", r$taxon, fixed = TRUE)
r$taxon <- str_trim(r$taxon, side = "both")

#	not run
if (FALSE) {
	write.csv(r, "~/Documents/vegsoup-standards/vegetation of europe/~evc1 species.csv",
		row.names = FALSE, quote = FALSE)
}

#	table with class assignments to be referenced to standard list
x <- read.csv("~/Documents/vegsoup-standards/vegetation of europe/evc1 species.csv",
	colClasses = "character")
#	test duplicates	
test <- any(x$taxon[ duplicated(x$taxon) ])
if (test) {	message("duplicated taxa found") }

#	test  whether class codes are in increasing order
i <- sapply(x$evc.class.code, function (x) strsplit(x, "+", fixed = TRUE))
test <- sapply(i, order)
test <- test[ sapply(test, length) > 1 ]
test <- any(sapply(test, is.unsorted))
if (test) {	message("some class codes appear unsorted") }

#	table to join taxa from x to y	
y <- read.csv("~/Documents/vegsoup-standards/vegetation of europe/taxon2standard.csv",
	colClasses = "character")
y$evc.taxon[ y$evc.taxon != "" ][ duplicated(y$evc.taxon[ y$evc.taxon != "" ]) ]

#	standard list to incorparate EuroVegChecklist class assignments
z <- read.csv2("~/Documents/vegsoup-standards/austrian standard list 2008/austrian standard list 2008.csv",
	colClasses = "character")
z <- z[ , -grep("evc.taxon", names(z)) ]
z <- z[ , -grep("evc.class.code", names(z)) ]
	
#	perform table join
#	merge source with link table
xy <- merge(x = x, y = y, by.x = "taxon", by.y = "evc.taxon", all.x = FALSE, all.y = TRUE, sort = FALSE)
names(xy)[ names(xy) == "taxon.y" ] <- "evc.taxon"

#	check merge result
#	x[ grep("Anthyllis vulneraria", x$taxon), ]
#	xy[ grep("Anthyllis vulneraria", xy$taxon), ]
#	dim(xy)
#	head(xy)
#	nrow(xy) == nrow(y)
#	table(duplicated(xy$matched.taxon[ xy$matched.taxon != "" ]))
#	table(duplicated(xy$taxon))

#	intersect standard and source with links
zxy <- merge(x = z, y = xy, by.x = "taxon", by.y = "evc.taxon", all.y = FALSE, all.x = FALSE, sort = FALSE)
names(zxy)[ names(zxy) == "taxon.y" ] <- "evc.taxon"
head(zxy)

#	feed values into standard
i <- match(zxy$taxon, z$taxon)
test <- any(is.na(i))
if (test) {	message("NA values introduced") }

z$evc.taxon <- NA
z$evc.class.code <- NA

z$evc.taxon[ i ] <- zxy$evc.taxon
z$evc.class.code[ i ] <- zxy$evc.class.code

#	groome NA values
table(is.na(z$evc.class.code))
table(is.na(z$evc.taxon))
z$evc.taxon[ is.na(z$evc.taxon) ] <- ""
z$evc.class.code[ is.na(z$evc.class.code) ] <- ""

#	save extended standard
#	not run
if (FALSE) {
	write.csv2(z, "~/Documents/vegsoup-standards/vegetation of europe/~austrian standard list 2008 evc1.csv",
		row.names = FALSE)
}