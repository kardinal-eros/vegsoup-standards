isZeroPenalty <- function (x) {
	if (is.list(x)) {
		r <- vector("logical", length(x))
		for (i in seq_along(x)) {
			r[i] <- names(x)[i] %in% x[[i]]
		}		
	} else {
		r <- names(x) %in% x[[1]]
	}
	return(r)
}


#isZeroPenalty <- function (x) {
#	r <- names(x) %in% x[[1]]
#	return(r)
#}