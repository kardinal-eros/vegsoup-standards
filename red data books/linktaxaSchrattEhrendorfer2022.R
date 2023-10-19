library(linktaxa)

#	match taxa
x <- read.csv2("~/Documents/vegsoup-standards/austrian standard list 2008/austrian standard list 2008.csv",
	colClasses = "character")
	
y <- read.csv2("~/Documents/vegsoup-standards/red data books/~red list vascular plants Schratt-Ehrendorfer 2022.csv")

#	NOT RUN:
if (FALSE) {
	#	seek matches ... edit ...
	y <- linktaxa(x$taxon, y$taxon, order = FALSE,
		file = "~/Documents/vegsoup-standards/red data books/taxon2standard.csv",
		overwrite = FALSE)
		
}
