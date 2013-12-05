replaceTaxonRepository <- function (x, y, dir) {
	if (missing(x) | missing(y)) stop
#	x <- "aven flex"
#	y <- "aven flex flex"
#	xx <- paste("\"", x, "\"", sep = "")
#	yy <- paste("\"", y, "\"", sep = "")
	xx <- as.character(x)
	yy <- as.character(y)
	
	dirs <- list.files("~/Documents/vegsoup-data", full.names = TRUE)
	
	if (missing(dir)) {
		#	cat("apply changes to all folders")
	} else {
		#	cat("apply changes to all folders")
		dirs <- dir
	}

	for (i in dirs) {
		#	i = dirs[1]
		f <- paste(i, "/species.csv", sep = "")
		if (file.exists(f)) {
			ii <- read.csv2(f, colClasses = "character")
			if (length(grep("history", names(ii))) < 1) {
				stop(i, " has no history column")	
			}
			if (length(grep("abbr", names(ii))) < 1) {
				stop(i, " has no abbr column")	
			}
			if (!is.na(match(xx, ii$abbr))) {
				ii$history[ii$abbr %in% xx] <-
					paste(ii$history[ii$abbr %in% xx],
						"| Changed", xx, "To", yy, Sys.time())
				ii$abbr[ii$abbr %in% xx] <- yy
				cat("\n", x, "found in ", i)
				write.csv2(ii, paste(i, "/species.csv", sep = ""), row.names = FALSE)
			} else {
				#	cat("\n", x, "not found in ", i)
			}
		}
	}
}
