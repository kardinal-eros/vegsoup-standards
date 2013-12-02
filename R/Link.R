
source("~/Documents/vegsoup-standards/R/compareGenera.R")
source("~/Documents/vegsoup-standards/R/DropInfraspecific.R")
source("~/Documents/vegsoup-standards/R/prepareString.R")
source("~/Documents/vegsoup-standards/R/grepTaxon.R")

vs <- read.csv2("~/Documents/vegsoup-standards/austrian standard list 2008/austrian standard list 2008.csv",
	stringsAsFactors = FALSE)
tv <- read.csv2("~/Documents/vegsoup-standards/turboveg/c europe.csv",
	stringsAsFactors = FALSE)
	
x0 <- vs$taxon[2000:2020]
x <- x0

y <- tv$ABBREVIAT

l <- pbsapply(x, function (x) grepTaxon(x, y))

#	matrix of matches
ll <- sapply(l, length)
m <- matrix("", nrow = length(x), ncol = max(ll))
#	fill matrix
for (i in 1:length(l)) {
	if (ll[i] > 0) {
		m[ i, 1:ll[i] ] <- y[ l[[i]] ]
	}
}

m <- as.data.frame(m,
	stringsAsFactors = FALSE)
names(m)[1] <- "matched.taxon"
if (ncol(m) > 1) {
	names(m)[2:max(ll)] <- paste0("guess", 1:(max(ll) - 1))
}

#	add checks
genus <- compareGenera(x0, m[, 1], verbose = T)
matches <- ll
taxon = x0
match <- x0 == m[, 1]
sl <- sapply(x0, slat)

duplicated <- duplicated(m$matched.taxon)

df <- data.frame(genus, match, duplicated, matches, taxon, m,
	stringsAsFactors = FALSE)

#	shift non matching taxa one column
if (any(!df$match)) {
	df <- data.frame(df, tmp = "",
	stringsAsFactors = FALSE)
	names(df)[ncol(df)] <- paste0("guess", max(ll))
	df[!df$match, 7:ncol(df)] <- df[!df$match, 6:(ncol(df) -1)]
	df[!df$match, 6] <- ""
	# recompute because of column shift
	df$duplicated[df$matched.taxon != ""] <-
		duplicated(df$matched.taxon[df$matched.taxon != ""]) 
}

#df <- df[order(genus, match), ]
#df <- df[order(matches), ]

write.csv2(df, "foo.csv", row.names = FALSE)

library(Taxonstand)

TPL("Luzula spicata ssp. conglomerata")

