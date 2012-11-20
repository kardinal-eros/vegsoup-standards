df <- read.csv2("austrian standard list 2008.csv", stringsAsFactors = FALSE)
res <- df$abbr[duplicated(df$abbr)]

print(res)