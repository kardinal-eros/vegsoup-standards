source('~/Documents/vegsoup-standards/R/replaceTaxonRepository.R')

#	full data set replacement
path <- list.files("~/Documents/vegsoup-data", full.names = T)
rpl <- matrix(c("dryo vill", "dryo vill vill"), ncol = 2)

for (j in path) {
	for (i in 1:nrow(rpl)) {
		# i = 1
		x <- rpl[i, 1]
		y <- rpl[i, 2]
		replaceTaxonRepository(x, y, dir = path)
	}
}
