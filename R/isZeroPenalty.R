isZeroPenalty <- function (x) {
	r <- names(x) == x[[1]][1]
	return(r)	
}

#	ssp. aginst s.str
isRelaxedPenalty <- function (x, tool = c("ssp2sstr", "sstr2ssp", "slat2null", "str2null")) {
	r <- NULL
	#	message(y)
	if (tool == "ssp2sstr") {
		r <- condenseSensuStricto(names(x)) %in% x[[1]][1]
	}
	if (tool == "sstr2spp") {
		r <- expandSensuStricto(names(x)) %in% x[[1]][1]
	}
	if (tool == "slat2null") {
		r <- stripSensuLato(names(x)) %in% x[[1]][1]
	}
	if (tool == "str2null") {
		r <- stripSensuStricto(names(x)) %in% x[[1]][1]
	}
	if (is.null(r)) {
		r <- FALSE
	}
	return(r)
}

#isZeroPenalty(r[9])
#isRelaxedPenalty(x, "spp2sstr")
#isRelaxedPenalty(x, "sstr2spp")