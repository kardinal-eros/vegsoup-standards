condenseSensuStricto <- function (x, y = "s.str.") {
	r <- paste(dropInfraspecific(x), "s.str.")
	return(r)
}
#	condenseSensuStricto(x = "Quercus pubescens ssp. pubescens")