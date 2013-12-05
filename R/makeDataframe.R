duplicated <- duplicated(m$matched.taxon)

#df <- df[order(genus, match), ]
#df <- df[order(matches), ]

write.csv2(df, "foo.csv", row.names = FALSE)