library(stringdist)
x <- read.csv("~/Documents/vegsoup-standards/austrian syntaxa/austrian syntaxa 2.csv", sep = "\t")


j <- rev(c("class", "order", "alliance", "suballiance", "association"))
r <- data.frame(rank = apply(x[j], 1, function (ii) { j[ii] } ), x)
r$name <- as.character(x$name)
#r$rank <- ordered(r$rank, levels = j, labels = j)
r$rank <- as.character(r$rank)
r$rank <- sapply(r$rank, function (x) substring(x, 1, 4))

add <- function (x) {
	i <- grep(x, r$rank)
	r <- r[sort(c(1:nrow(r), i)), ]
	r[duplicated(r$name), ] <- ""
	return(r)
}

r <- add("clas")
r <- add("orde")
r <- add("alli")

write.table(r[, c(1,2,3)],
	"~/Documents/vegsoup-standards/austrian syntaxa/austrian syntaxa 2.txt",
	row.names = FALSE, quote = FALSE)
