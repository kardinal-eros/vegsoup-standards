dropInfraspecific <- function (x, verbose = FALSE) {
	#x = "Daucus carota ssp. carota"
	x <- strsplit(x, " ", fixed = TRUE)[[1]]
	i <- grep("ssp.", x, fixed = TRUE)
	if (length(i) > 0 & length(i) == 1) {
		res <- x[1:(i - 1)]
		if (verbose) {
			message("got match")
		}
	} else {
		res <- x
	}
	paste(res, collapse = " ")
}