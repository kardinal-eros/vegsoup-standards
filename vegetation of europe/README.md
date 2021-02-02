Vegetation of Europe and EuroVegChecklist
=========================================

EuroVegChecklist
----------------

Link the *EuroVeg Checklist* with class assignments (Mucina et al. 2016, Electronic Appendix S1) to the *Austrian Standard List* ([for further details see here)](https://github.com/kardinal-eros/vegsoup-standards/tree/master/austrian%20standard%20list%202008) applied in the [vegsoup-data](https://github.com/kardinal-eros/vegsoup-data) repository.

+ `evc1 species.csv` EuroSpeciesList 1. List of diagnostic species of classes of the plant communities dominated by vascular plants (EVC1). Nomenclature Euro+Med PlantBase (http://ww2.bgbm.org/EuroPlusMed/). Reorganised data structure from long format into pseudo-wide format.
[evc1 species original.csv](https://onlinelibrary.wiley.com/action/downloadSupplement?doi=10.1111%2Favsc.12257&file=avsc12257-sup-0007-AppendixS6-ESL1.csv).

Database join is documented in `MergeEVC1Species.R`.

*References*

Mucina et al. 2016. Vegetation of Europe: Hierarchical floristic classification system of vascular plant, bryophyte, lichen, and algal communities. Applied Vegetation Science 19 (Suppl. 1): 3–264.

<!--

EuroVegSpeciesList 1 (ESL1): list of diagnostic species of the classes of vascular plant vegetation

For ESL1, Mucina (1997a) served as the source of the starting pool of species and their links to the particular EVC1 classes. This pool was then extended by compilation of the literature sources mentioned above, especially syntaxonomic monographs and revisions containing extensive synthetic phytosociological tables. Expert opinion from the author team of this paper and beyond was used to make judgements about problematic cases. Some species were assigned to more than one class. The sources of the species nomenclature (and taxonomic concepts) used in the ESL1 are featured in Appendix S1.
-->
<!--
Had to replace not encoded string "�" with blank for some taxa.

Some taxon assignment are ambigous (R. nemorosus, R. polyanthemus subsp. nemorosus)

taxon assignment

handling of included taxa

Najas marina s.lat.	Najas marina
Najas marina ssp. intermedia	Najas marina
Najas marina ssp. marina	Najas marina

Ononis spinosa s.lat.	empty
Ononis spinosa ssp. austriaca	Ononis spinosa subsp. austriaca
Ononis spinosa ssp. spinosa	Ononis spinosa subsp. spinosa

Pimpinella saxifraga s.lat.	
Pimpinella saxifraga ssp. nigra	Pimpinella nigra
Pimpinella saxifraga ssp. saxifraga	Pimpinella saxifraga
-->

Vegetation of Europe Classes and Alliances
------------------------------------------

+ `evc1 classes.csv` 

[Original source](https://onlinelibrary.wiley.com/action/downloadSupplement?doi=10.1111%2Favsc.12257&file=avsc12257-sup-0007-AppendixS6-ESL1.csv)

+ `evc alliances.csv`

[Original source](https://www.synbiosys.alterra.nl/evc/Docs/EuropeanVegetationClassification.csv)
