queue <- function (x, ...) { # for penalty
	#	x <- tmp <- r
	#	x <- tmp
	stopifnot(is.list(x))
	#	order by penaltiy
	p <- penalty(x)
	for (i in seq_along(x)) {#which(!isZeroPenalty(x))
		if (length(p[[ i ]]) > 1) {
			x[[i]] <- x[[ i ]][ p[[ i ]] + 1]
		}
	}
	p <- penalty(x)
	r <- sapply(p, ">", 0)
	r <- sapply(r, all)
	
	#r <- sapply(sapply(penalty(x), ">", 0), any)
	
	for(i in which(r)) {
		x[[i]] <- c("", x[[i]])
	}
	return(x)
}