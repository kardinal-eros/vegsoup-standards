#	x: a list
castList <- function (x, order = TRUE, ...) { # to penalty
	stopifnot(is.list(x))
	l <- sapply(x, length)
	r <- matrix("", nrow = length(x), ncol = max(l))
	for (i in 1:length(x)) {
		if (l[i] > 0) {
			r[ i, 1:l[i] ] <- x[[i]]
		}
	}
	r <- as.data.frame(r,
		stringsAsFactors = FALSE)
	names(r)[1] <- "matched.taxon"
	if (ncol(r) > 1) {
		names(r)[2:max(l)] <- paste0("guess", 1:(max(l) - 1))
	}
	
	r <- data.frame(
		penalty = sapply(penalty(x, ...), sum),
		taxon = names(x),
		r,
		stringsAsFactors = FALSE)
	if (order) {
		r <- r[order(r$penalty, decreasing = TRUE), ]
	}	
	return(r)
}