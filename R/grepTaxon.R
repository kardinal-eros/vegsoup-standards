grepTaxon <- function (x, y, clean = TRUE, exact = TRUE) {
	#	x = "Primula elatior s.str." 
	require(stringr)
	require(pbapply)
	require(stringdist)
	
	#	save for final validation
	x0 <- x
	
	#	clean string
	if (clean) {
		x <- stripTaxon(x)
	}
	
	#	if taxon is Genus sp. it has to match precisely
	if (length(agrep(" sp.", x, max.distance = 0)) == 1) {
		r <- agrep(x, y, max.distance = 0)	
	} else {
		#	first try
		t1 <- agrep(x, y, max.distance = 0.05, ignore.case = TRUE)
		if (length(t1) == 0) {
			#	second try
			#	drop intraspecific taxon (ssp.)
			xx <- dropInfraspecific(x)
			#	should return lower distance if ssp. is missing in y
			t2 <- agrep(xx, y, max.distance = 0.1, ignore.case = TRUE)
			if (length(t2) == 0) {
				xx <- condenseSensuStricto(x)
				t3 <- agrep(xx, y, max.distance = 0.1, ignore.case = TRUE)
				if (length(t3) == 0) {
					#	relax distance to return at least something similar	
					r <- agrep(x, y, max.distance = 0.3, ignore.case = TRUE)	
				} else {
					r <- t3					
				}	
			} else {
				r <- t2	
			}
		} else {
			r <- t1
		}		
	}
	
	#	retrieve strings by index
	r <- sapply(r, function (x) y[x])
	
	#	order matches (stripped if clean = TRUE)
	if (length(r) > 1) {
		r <- r[order(stringdist(x, r))] # was: x0
	}
	
	#	exact matches should have string distance 0, first position
	#	drop all other matches
	if (exact) {
		if (x0 == r[1]) {
			r <- r[1]
		}		
	}
	#	if definetly no match, 
	if (length(r) == 0) {
		r <- ""
	}
	return(r)
}