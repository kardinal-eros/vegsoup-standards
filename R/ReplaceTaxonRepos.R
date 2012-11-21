replaceTaxon <- function (x, y, dir) {
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
		tmp.i <- read.csv2(paste(i, "/species.csv", sep = ""),
			colClasses ="character")
		if (length(grep("history", names(tmp.i))) < 1) {
			stop(i, " has no history column")	
		}
		if (!is.na(match(xx, tmp.i$abbr))) {
			tmp.i$history[tmp.i$abbr %in% xx] <-
				paste(tmp.i$history[tmp.i$abbr %in% xx], "| Changed", xx, "To", yy, Sys.time())
			tmp.i$abbr[tmp.i$abbr %in% xx] <-
				yy
			cat("\n", x, "found in ", i)
			write.csv2(tmp.i, paste(i, "/species.csv", sep = ""), row.names = FALSE)
		} else {
			#	cat("\n", x, "not found in ", i)
		}
	}
}

#
#	replaceTaxon("aven flex", "aven flex flex")

rpl <- read.delim("~/Documents/vegsoup-data/amadeus dta/recode 2012-11-19.txt",
	colClasses = "character", header = FALSE)
	
for (i in 1:nrow(rpl)) {
	# i = 1
	x <- rpl[i, 1]
	y <- rpl[i, 2]
	replaceTaxon(x, y, dir = "~/Documents/vegsoup-data/amadeus dta")
}
