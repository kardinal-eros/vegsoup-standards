matchSensuLato <- function (x) {
	stopifnot(is.list(x))
	#	find exact matches when s.lat. is stripped of
	sl <- isSensuLato(x) #sapply(names(x), isSensuLato)
	for (i in which(sl)) {
		#	stringdist in grepTaxon() should rank s.lat. matches in first position
		if (stripTaxon(names(x)[i]) %in% r[[i]][1]) {
			x[[i]] <- x[[i]][1]
		}
		else {
			#	message("we give up")
		}
	}
	return(x)
}

