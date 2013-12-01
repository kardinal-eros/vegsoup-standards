grepTaxon <- function (x, y) {
	#	if taxon is Genus sp. it has to mach precisely
	g <- length(agrep(" sp.", x, max.distance = 0)) == 1
	
	if (g) {
		r <- agrep(x, y, max.distance = 0)	
	}
	else {
		#	first try
		t1 <- agrep(x, y, max.distance = 0.05)
		if (length(t1) == 0) {
			#	drop intraspecific taxon ssp.
			x <- dropInfraspecific(x)
			#	show return lower distance if ssp. is missing in y
			t2 <- agrep(x, y, max.distance = 0.1)
			if (length(t2) == 0) {
			#	relax distance to return at least something	
				r <- agrep(x, y, max.distance = 0.3)	
			}
			#	
			else {
				r <- t2					
			}
		}
		else {
			r <- t1
		}
		
	}
	return(r)
}

	