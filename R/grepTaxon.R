grepTaxon <- function (x, y) {
	require(stringr)
	require(pbapply)
	require(stringdist)
	
	#	save for final validation
	x0 <- x
	
	#	first clean string	
	x <- prepareString(x)
	
	#	if taxon is Genus sp. it has to mach precisely
	if (length(agrep(" sp.", x, max.distance = 0)) == 1) {
		r <- agrep(x, y, max.distance = 0)	
	}
	else {
		#	first try
		t1 <- agrep(x, y, max.distance = 0.05)
		if (length(t1) == 0) {
			#	second try
			#	drop intraspecific taxon (ssp.)
			x <- dropInfraspecific(x)
			#	should return lower distance if ssp. is missing in y
			t2 <- agrep(x, y, max.distance = 0.1)
			if (length(t2) == 0) {
			#	relax distance to return at least something	
				r <- agrep(x, y, max.distance = 0.3)	
			}	
			else {
				r <- t2					
			}
		}
		else {
			r <- t1
		}		
	}
	
	#	
	if (length(r) > 1) {
		r <- r[order(stringdist(x0, y[r]))]
	}
	return(r)
}