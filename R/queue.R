queue <- function (x, ...) { # for penalty
	stopifnot(is.list(x))
	r <- penalty(x)
	r <- sapply(r, ">", 0)
	r <- sapply(r, "[[", 1)
	#r <- sapply(sapply(penalty(x), ">", 0), any)
	
	for(i in which(r)) {
		x[[i]] <- c("", x[[i]])
	}
	return(x)
}