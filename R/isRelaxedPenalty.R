#	ssp. aginst s.str
isRelaxedPenalty <- function (x, tool = c("ssp2sstr", "sstr2ssp", "slat2null", "str2null", "null2str")) {
	r <- NULL
	#	message(y)
	if (tool == "ssp2sstr") {
		r <- condenseSensuStricto(names(x)) %in% x[[1]]
	}
	if (tool == "sstr2spp") {
		r <- expandSensuStricto(names(x)) %in% x[[1]]
	}
	if (tool == "slat2null") {
		r <- stripSensuLato(names(x)) %in% x[[1]]
	}
	if (tool == "str2null") {
		r <- stripSensuStricto(names(x)) %in% x[[1]]
	}
	if (tool == "null2str") {
		r <- addSensuStricto(names(x)) %in% x[[1]]
	}
	if (tool == "var2ssp") {
		#r <- addSensuStricto(names(x)) %in% x[[1]]
	}
	if (tool == "ssp2var") {
		#r <- addSensuStricto(names(x)) %in% x[[1]]
	}	
	if (is.null(r)) {
		r <- FALSE
	}
	return(any(r))
}