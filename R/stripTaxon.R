stripTaxon <- function (x, y) {
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
		x <- subHybrid(x)
		return(x)
	}
}