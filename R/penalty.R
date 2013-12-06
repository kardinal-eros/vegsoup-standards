penalty <- function (x, strip = TRUE) {
	stopifnot(is.list(x))
	require(stringdist)
	#	loop over list[i]
	r <- vector("list", length = length(x))
	for (i in seq_along(x)) {
		#	i = 81
		if (strip) {
			#	clean string for multiplicatiuon sign
			ii <- subHybrid(names(x[i]))
			
			if (!isZeroPenalty(x[i])) {
					if (isRelaxedPenalty(x[i], "ssp2sstr")) {
						message("ssp2sstr")
						ii <- condenseSensuStricto(ii)
				} else {
					if (isRelaxedPenalty(x[i], "sstr2ssp")) {
						message("sstr2ssp")
						ii <- expandSensuStricto(ii)
				} else {
					if (isRelaxedPenalty(x[i], "slat2null")) {
						message("slat2null")
						ii <- stripSensuLato(ii)
				} else {
					if (isRelaxedPenalty(x[i], "str2null")) {
						message("str2null")
						ii <- stripSensuStricto(ii)
				} else {
					if (isRelaxedPenalty(x[i], "null2str")) {
						message("null2str")
						ii <- addSensuStricto(ii)
				} else {
					if (isRelaxedPenalty(x[i], "var2ssp")) {
						message("var2ssp")
						#	ii <- 
				} else {
					if (isRelaxedPenalty(x[i], "ssp2var")) {
						message("ssp2var")
						#	ii <- 
				} else {					
					#	and give up
					ii <- dropInfraspecific(ii)
				}								
									}					
								}
							}
						}					
					}
				}	
			}
			ii <- stringdist(ii, unlist(x[i]))			
		} else {
			ii <- stringdist(names(x[i]), unlist(x[i]))
		}
		
#		if (length(ii) == 0) {
#			ii <- 100
#		}				
		if (any(ii > 0)) {
			if (any(ii == 0)) {
				r[[i]] <- rank(ii) - 1
			}
			#else {
			#	r[[i]] <- c(ii[ii == 0], rank(ii[ii != 0]))
			#}
		} else {
			r[[i]] <- ii
		}
	}
	
	r[sapply(r, length) == 0] <- 1
	
	names(r) <- names(x)
	r[!compareGenera(x)] <- sapply(r[!compareGenera(x)], "+", 1, simplify = FALSE)
	return(r)
}