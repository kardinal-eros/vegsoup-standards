#	run from shell
#	R -f TestForUniqueAbbr.R 

df <- read.csv2("~/Documents/vegsoup-standards/taxonomy/standard.csv", stringsAsFactors = FALSE)
res <- df$abbr[duplicated(df$abbr)]

print(res)