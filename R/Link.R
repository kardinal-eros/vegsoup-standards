library(stringr)

vs <- read.csv2("~/Documents/vegsoup-standards/austrian standard list 2008/austrian standard list 2008.csv",
	stringsAsFactors = FALSE)
tv <- read.csv2("~/Documents/vegsoup-standards/turboveg/c europe.csv",
	stringsAsFactors = FALSE)
	
x0 <- x1 <- vs$taxon[1000:1200]
x2 <- tv$ABBREVIAT

x1 <- sub("cf. ", "", x1, fixed = TRUE)
x1 <- sub("cf.", "", x1, fixed = TRUE)
x1 <- sub("cf ", "", x1, fixed = TRUE)

x1 <- sub("aff. ", "", x1, fixed = TRUE)
x1 <- sub("aff.", "", x1, fixed = TRUE)
x1 <- sub("aff ", "", x1, fixed = TRUE)

x1 <- sub("s.l. ", "", x1, fixed = TRUE)
x1 <- sub("s.l.", "", x1, fixed = TRUE)
x1 <- sub("s.l ", "", x1, fixed = TRUE)

x1 <- sub("s.lat. ", "", x1, fixed = TRUE)
x1 <- sub("s.lat.", "", x1, fixed = TRUE)
x1 <- sub("s.lat ", "", x1, fixed = TRUE)

x1 <- sub("s.str. ", "", x1, fixed = TRUE)
x1 <- sub("s.str.", "", x1, fixed = TRUE)

x1 <- str_trim(x1, side = "right")


ll <- list(length = length(x1))

lx1 <- length(x1)
pb <- txtProgressBar(min = 1, max = lx1, style = 3)
for (i in 1:lx1) {
	setTxtProgressBar(pb, i)
	sp <- length(agrep(" sp.", x1[i], max.distance = 0)) == 1
	if (sp) {
		ll[[i]]<- agrep(x1[i], x2, max.distance = 0)	
	} else {
		ii <- agrep(x1[i], x2, max.distance = 0.05)
		if (length(ii) == 0) {
			ll[[i]] <- agrep(x1[i], x2, max.distance = 0.3)	
		} else {
			ll[[i]] <- ii	
		}
		
	}
}
close(pb)

m <- matrix("", nrow = length(x1), ncol = max(sapply(ll, length)) + 1)
m[,1] <- x0

for (i in 1:length(ll)) {
	if (length(ll[[i]]) > 0) {
		m[i, (1:length(ll[[i]])) + 1] <- x2[ll[[i]]]
	}
}

write.csv2(m, "foo.csv")
