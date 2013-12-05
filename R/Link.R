rm(list = ls())
source("~/Documents/vegsoup-standards/R/compareGenera.R")
source("~/Documents/vegsoup-standards/R/grepTaxon.R")

source("~/Documents/vegsoup-standards/R/isSensuLato.R")
source("~/Documents/vegsoup-standards/R/isSensuStricto.R")
source("~/Documents/vegsoup-standards/R/condenseSensuStricto.R")
source("~/Documents/vegsoup-standards/R/isHybrid.R")
source("~/Documents/vegsoup-standards/R/DropInfraspecific.R")

source("~/Documents/vegsoup-standards/R/stripSensuLato.R")
source("~/Documents/vegsoup-standards/R/stripSensuStricto.R")
source("~/Documents/vegsoup-standards/R/expandSensuStricto.R")
source("~/Documents/vegsoup-standards/R/matchSensuLato.R")
source("~/Documents/vegsoup-standards/R/stripTaxon.R")

source("~/Documents/vegsoup-standards/R/penalty.R")
source("~/Documents/vegsoup-standards/R/isZeroPenalty.R")
source("~/Documents/vegsoup-standards/R/queue.R")


source("~/Documents/vegsoup-standards/R/subHybrid.R")

source("~/Documents/vegsoup-standards/R/castList.R")



vs <- read.csv2("~/Documents/vegsoup-standards/austrian standard list 2008/austrian standard list 2008.csv",
	stringsAsFactors = FALSE)
	
library(vegsoup)
load("~/Documents/vegsoup-data/aineck dta/an.rda")

vs <- Taxonomy(an)
tv <- read.csv2("~/Documents/vegsoup-standards/turboveg/c europe.csv",
	stringsAsFactors = FALSE)
	
x0 <- vs$taxon#[1:500]
x <- x0

y <- tv$ABBREVIAT

require(pbapply)

r <- pbsapply(x, function (x) grepTaxon(x, y), simplify = FALSE)
#r <- matchSensuLato(r)
penalty(r)
r <- queue(r)
df <- castList(r)

#o <- order(sapply(penalty(r), sum))
write.csv2(df, "foo.csv", row.names = FALSE)

