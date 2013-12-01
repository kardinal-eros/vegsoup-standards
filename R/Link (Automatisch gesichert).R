require(stringr)
require(pbapply)

source("~/Documents/vegsoup-standards/R/DropInfraspecific.R")
source("~/Documents/vegsoup-standards/R/prepareString.R")

vs <- read.csv2("~/Documents/vegsoup-standards/austrian standard list 2008/austrian standard list 2008.csv",
	stringsAsFactors = FALSE)
tv <- read.csv2("~/Documents/vegsoup-standards/turboveg/c europe.csv",
	stringsAsFactors = FALSE)
	
x0 <- vs$taxon[1000:1020]
x <- prepareString(x0)

y <- tv$ABBREVIAT

l <- pbsapply(x, function (x) grepTaxon(x, y))

#	matrix of results
ll <- sapply(l, length)
m <- matrix("", nrow = length(x), ncol = max(ll) + 1)
#	string to be matched
m[, 1] <- x0
#	fill matrix
for (i in 1:length(l)) {
	if (ll[i] > 0) {
		m[i, (1:length(l[[i]])) + 1] <- y[l[[i]]]
	}
}

#	add checks
m <- cbind(compareGenera(m[,1], m[,2], verbose = T), m)

write.csv2(m, "foo.csv", row.names = FALSE)
