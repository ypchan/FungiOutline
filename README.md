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

## Count
```
# how many phylum
outline %>% distinct(Phylum) %>% print(n=100)

# how many family
outline %>% distinct(Current_family) %>% print(n=5000)

# how many genus
outline %>% distinct(Current_family) %>% print(n=5000)

```

