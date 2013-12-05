compareGenera <- function (x, y, stop, verbose = FALSE) {
	if (is.list(x) & missing(y)) {
		y <- sapply(x, "[[", 1)
		x <- names(x)		
	}
	x0 <- x == ""
	y0 <- y == ""
	
	if (verbose) {
		cat("empty strings:\n")
		print(table(x = x0))
		print(table(y = y0))
	}
	# for strsplit(x, " ") 
	x[x0] <- " "
	y[y0] <- " "
	x <- sapply(strsplit(x, " ", fixed = TRUE), "[[", 1)
	y <- sapply(strsplit(y, " ", fixed = TRUE), "[[", 1)
	
	if (missing(stop)) {
		xl <- sapply(x, nchar)
		yl <- sapply(y, nchar)
	}
	else {
		stopifnot(is.numeric(stop))
		xl <- yl <- stop
	}
	r <- substring(x, 1, xl) == substring(y, 1, yl)
	return(r)
}
