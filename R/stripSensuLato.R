stripSensuLato <- function (x, y) {
	if	(missing(y)) {
	y <- c(
		"s.lat. ", "s.lat.", "s.lat",
		"s.l. ", "s.l.", "sl.", "sl"
		)	
	}
	if (missing(x)) {
		cat("", y)
	}
	else {
		for (i in y) {
			x <- sub(paste0(" ", i), "", x, fixed = TRUE)		
		}
		x <- str_trim(x, side = "right")
		return(x)
	}
}