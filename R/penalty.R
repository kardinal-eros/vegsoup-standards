penalty <- function (x, strip = TRUE) {
	stopifnot(is.list(x))
	require(stringdist)
	#	loop over list[i]
	r <- vector("list", length = length(x))
	for (i in seq_along(x)) {
		#	i = 11
		if (strip) {
			#	always
			#	ii <- stripSensuLato(names(x[i]))
			#	the string
			ii <- subHybrid(names(x[i]))
			
			if (!isZeroPenalty(x[i])) {
				if (isRelaxedPenalty(x[i], "ssp2sstr")) {
					message("ssp2sstr")
					ii <- condenseSensuStricto(ii)
					#message(ii)
				} else {
					if (isRelaxedPenalty(x[i], "sstr2ssp")) {
						message("sstr2ssp")
						ii <- expandSensuStricto(ii)
						#message(ii)	
					} else {
						if (isRelaxedPenalty(x[i], "slat2null")) {
							#message("slat2null")
							ii <- stripSensuLato(ii)
							#message(ii)	
						} else {
							if (isRelaxedPenalty(x[i], "str2null")) {
							message("slat2null")
							ii <- stripSensuStricto(ii)
							#message(ii)
						}
						}					
					}
				}	
				#message("zero penalty")				
				ii <- dropInfraspecific(ii)			
			}
			ii <- stringdist(ii, unlist(x[i]))			
		} else {
			ii <- stringdist(names(x[i]), unlist(x[i]))
		}
			
		if (any(ii > 0)) {
			r[[i]] <- c(ii[ii == 0], rank(ii[ii != 0]))
		} else {
			r[[i]] <- ii
		}
	}
	
	names(r) <- names(x)
	r[!compareGenera(x)] <- sapply(r[!compareGenera(x)], "+", 1, simplify = FALSE)
	return(r)
}