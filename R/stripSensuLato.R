stripSensuLato <- function (x, y) {
	if	(missing(y)) {
	y <- c(
		"s.lat. ", "s.lat.", "s.lat",
		"s. lat. ", "s. lat.", "s. lat",
		"s.l. ", "s.l.",
		"s. l. ", "s. l.",
		"sl.", "sl"
		)	
	}
	if (missing(x)) {
		print(y)
	}
	else {
		for (i in y) {
			x <- gsub(paste0(" ", i), "", x, fixed = TRUE)		
		}
		x <- str_trim(x, side = "right")
		return(x)
	}
}

#stripSensuLato()