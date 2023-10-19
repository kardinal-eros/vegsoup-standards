library(stringr)

#	repository of data source
#	https://www.zobodat.at/publikation_volumes.php?id=69999

#	clean up environment
rm(list = ls())

#	read data set as edited csv version of orginal xls file
x <- read.csv2("~/Documents/vegsoup-standards/red data books/red list vascular plants schratt-ehrendorfer 2022.csv")

decode.dot <- function (i) {
	stopifnot(is.data.frame(i))
	x0 <- i[ c("taxon", "rl", "a", "b", "r") ]
	x0[ 1, ] <- gsub("†", "+", x0) # recode dagger
	

	x1 <- i[ c("rl.al", "rl.bm", "rl.nv", "rl.sv", "rl.pa") ]
	x1[ 1, x1 == "●" ] <- x0$rl # recode dot
	x1[ 1, x1 == "●*" ] <- x0$rl # recode dot
	
	x2 <- i[ c("o.v", "o.nt", "o.ot", "o.s", "o.k", "o.st", "o.o", "o.n", "o.w", "o.b") ]
	x2[ 1, ] <- gsub("●", "#", x2)  # recode dot
	x2[ 1, ] <- gsub("†", "+", x2) # recode dagger	
	
	x3 <- i[ c("responsibility", "distribution", "lifeform") ]
	
	r <- cbind(x0, x1, x2, x3)
	return(r)
}

for (i in 1:nrow(x)) {
	#	i = 10
	xi <- x[i, , drop = FALSE]
	x[ i, ] <- decode.dot(xi)
}

head(x)

#	test
unique(unlist(x[ c("a", "b", "r") ]))
unique(unlist(x[ c("rl.al", "rl.bm", "rl.nv", "rl.sv", "rl.pa") ]))
unique(unlist(x[ c("o.v", "o.nt", "o.ot", "o.s", "o.k", "o.st", "o.o", "o.n", "o.w", "o.b") ]))
unique(unlist(x[ c("responsibility", "distribution", "lifeform") ]))

#	save as csv file
write.csv2(x, "~/Documents/vegsoup-standards/red data books/~red list vascular plants schratt-ehrendorfer 2022.csv", quote = TRUE, row.names = FALSE)