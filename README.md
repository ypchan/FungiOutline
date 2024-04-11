# FungiOutline
 A R package written by Yanpeng Chen for processing taxonomic framework of Fungi.

## Install
```
library(devtools)
devtools::install_github("ypchan/FungiOutline")
```
## Get the taxonomic framework
```
data(outline)
```

## how many phylum
```
outlne %>% distinct(Phylum) %>% count()
```
