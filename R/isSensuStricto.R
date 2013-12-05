isSensuStricto <- function (x) {
	#	x = "Luzula multiflora s.str."
	y <- c(
		"s.str. ", "s.str.", "s.str",
		"sstr ", "sstr"
		)
	if (is.list(x)) {
		r <- vector("list", length = length(x))
		names(r) <- names(x)
		for (i in seq_along(x)) {
			ii <- sapply(y, function (z) grep(z, names(x)[i], fixed = TRUE))	
			ii <- any(sapply(ii, length) > 0)
			r[[i]] <- ii
		}		
		r <- unlist(r)
	}
	else {
		r <- sapply(y, function (z) grep(z, x, fixed = TRUE))	
		r <- any(sapply(r, length) > 0)		
	}
	return(r)
}