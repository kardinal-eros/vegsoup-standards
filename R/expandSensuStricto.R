expandSensuStricto <- function (x) {
	#	x = "Luzula multiflora s.str."
	if (is.list(x)) {
		ii <- which(isSensuStricto(x))
		rl <- strsplit(names(x), " ", fixed = TRUE)
		r <- names(x)
		
		for (i in ii) {
			ri <- rl[[ i ]]
			j <- which(sapply(ri, isSensuStricto))
			r1 <- paste(ri[-j], collapse = " ")
			#	assume specific epitheton is the word before s.str.
			r2 <- paste("ssp.", ri[j - 1], collapse = " ")
			ri <- paste(r1, r2)
			r[i] <- ri
		}
	}
	else {
		if (isSensuStricto(x)) {
			r <- strsplit(x, " ", fixed = TRUE)[[1]]
			i <- which(sapply(r, isSensuStricto))
			r1 <- paste(r[-i], collapse = " ")
			#	assume specific epitheton is the word before s.str.
			r2 <- paste("ssp.", r[i - 1], collapse = " ")
			r <- paste(r1, r2)
		}
	}
	return(r)
}

#	isSensuStricto(x = "foo bar s.str.")
#	expandSensuStricto(x = "foo bar s.str")