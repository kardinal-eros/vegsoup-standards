dropInfraspecific <- function (x, y) {
	#	x = "Gentiana bavarica var. subacaulis"
	if (missing(y)) {
		y <- c(
			"var.", "ssp."
		)
	}
	x <- strsplit(x, " ", fixed = TRUE)[[1]]
	
	i <- sapply(y, function (z) grep(z, x, fixed = TRUE))
	if (any(sapply(i, length) > 1)) {
		message("abigous matches for", y, "in", paste(x, collapse = ""))
	}
	else {
		ii <- sapply(i, length) > 0		
	}
	
	if (any(ii)) {
		if (sum(ii) > 1) {
			message("both ssp. and var. in taxon name!")
			r <- x
		}
		else {
			r <- x[1:(unlist(i[ii]) - 1)]
		}
	}
	else {
		r <- x
	}
	r <- paste(r, collapse = " ")
	return(r)
}

#	dropInfraspecific(x = "Malaxis paludosa")
#	dropInfraspecific(x = "Luzula spicata ssp. conglomerata")
#	dropInfraspecific(x = "Abietinella abietina var. abietina")
