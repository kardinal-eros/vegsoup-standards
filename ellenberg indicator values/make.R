library(stringr)

#	https://www.sci.muni.cz/botany/juice/ell_MC05.txt

x <- readLines("~/Documents/vegsoup-standards/ellenberg indicator values/ellenberg indicator values.txt")
id <- str_trim(substring(x, 1, 5))
taxon <- str_trim(substring(x, 6, 45))
values <- str_trim(substring(x, 46, 57)) #	order is L,T,K,F,R,N

l <- str_trim(substring(values, 1, 2))
t <- str_trim(substring(values, 3, 4))
k <- str_trim(substring(values, 5, 6))
f <- str_trim(substring(values, 7, 8))
r <- str_trim(substring(values, 9, 10))
n <- str_trim(substring(values, 11, 12))

r <- data.frame(id, taxon, l, t, k, f, r, n)

write.csv(r, "~/Documents/vegsoup-standards/ellenberg indicator values/ellenberg indicator values.csv")