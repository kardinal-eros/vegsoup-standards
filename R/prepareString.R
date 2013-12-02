prepareString <- function (x, y) {
	if	(missing(y)) {
	y <- c(
		"cf. ", "cf.", # better not "cf"
		"aff. ", "aff.", "aff",
		"s.lat. ", "s.lat.", "s.lat",
		"s.l. ", "s.l.", "sl.", "sl",
		"s.str. ", "s.str.",
		"sstr ", "sstr" # better not "sstr"
		)	
	}
	if (missing(x)) {
		cat("", y)
	} else {
		for (i in y) {
			x <- sub(paste0(" ", i), "", x, fixed = TRUE)		
		}
		x <- str_trim(x, side = "right")
		return(x)
	}
}

slat <- function (x) {
	xx <- x
	y <- c(
		"s.lat. ", "s.lat.", "s.lat",
		"s.l. ", "s.l.", "sl.", "sl"
		)
	x <- sapply(paste0(" ", y), function (x) grep(x, xx, fixed = TRUE))	
	r <- any(sapply(x, length)>0)
	return(r)		
	
}