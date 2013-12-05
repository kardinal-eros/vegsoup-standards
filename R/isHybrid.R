isHybrid <- function (x) {
	r1 <- grep("\u00D7", x, fixed = TRUE)
	r2 <- grep(" x ", x, fixed = TRUE)
	r <- vector("logical", length = length(x))
	if (length(r1) > 0 | length(r2) > 0) {
		if (length(r1) > 0)
			r[r1] <- TRUE
		if (length(r2) > 0)
			r[r2] <- TRUE
	}
	else {		
		r <- FALSE
	}
	return(r)
}

#	isHybrid(x = "Mentha arvensis")
#	isHybrid(x = "Mentha × dumetorum") # MULTIPLICATION SIGN (U+00D7) \u00D7
#	isHybrid(x = c("Mentha x dumetorum", "Mentha × dumetorum"))