# FungiOutline
 A R package written by Yanpeng Chen for processing taxonomic framework of Fungi.

## Install
```
library(devtools)
devtools::install_github("ypchan/FungiOutline")
```
## Get the taxonomic framework
```
library(FungiOutline)
data(outline)
```

## Count
```
# how many phylum, including incertae_sedis
outline %>% distinct(Phylum) %>% print(n=100)

# how many family, including incertae_sedis
outline %>% distinct(Current_family) %>% print(n=5000)

# how many genus, including incertae_sedis
outline %>% distinct(Current_family) %>% print(n=5000)

```
## Corretions
If you find something wrong, or not consistent the latest taxonomic scheme, please contact yanpengch@qq.com or directly open a new issue under this package.
