#	2023-10-18
#	kardinal.eros@gmail.com
#	link nomenclature of *red list vascular plants Schratt-Ehrendorfer 2022.csv* to *austrian standard list 2008.csv*

#	prepare workspace
rm(list = ls())
library(stringr)

#	read data source
x <- read.csv("~/Documents/vegsoup-standards/red data books/red list vascular plants Schratt-Ehrendorfer 2022 decoded.csv",
	stringsAsFactors = FALSE)
names(x) <- tolower(names(x))

#	r$taxon <- gsub("*", "", x$taxon, fixed = TRUE)
r$taxon <- str_trim(r$taxon, side = "both")

#	not run
if (FALSE) {
	write.csv(r, "~/Documents/vegsoup-standards/vegetation of europe/~evc1 species.csv",
		row.names = FALSE, quote = FALSE)
}

#	standard list to incorparate red dat book assignments
z <- read.csv2("~/Documents/vegsoup-standards/austrian standard list 2008/austrian standard list 2008.csv",
	colClasses = "character")
	
#	perform table join
#	merge source with link table
xy <- merge(x = x, y = y, by.x = "taxon", by.y = "taxon", all.x = FALSE, all.y = TRUE, sort = FALSE)
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