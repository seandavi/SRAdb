# SRAdb (deprecated)

SRAdb is deprecated and will be removed from Bioconductor. The SRAmetadb
SQLite database is no longer updated; the last build is from December 2023.

## Replacement

Use [OmicIDX](https://omicidx.cancerdatasci.org/) instead. It provides daily
updated metadata for NCBI SRA, GEO, BioSample and BioProject.

From R, the [omicidxr](https://omicidx.cancerdatasci.org/guides/r-omicidxr.html) package replaces SRAdb:

```r
pak::pak("seandavi/omicidxr")
library(omicidxr)
con <- omicidx_connect()
DBI::dbGetQuery(con, "SELECT * FROM sradb.study LIMIT 5")
sra_convert(con, "SRP001007", "run")
```

The `sradb` schema follows the SRAdb tables, so most SQL ports by prefixing
table names. The [migration guide](https://omicidx.cancerdatasci.org/guides/r-omicidxr.html) maps SRAdb functions to their omicidxr
equivalents (`sraConvert()` to `sra_convert()`, `getSRA()` to `sra_search()`,
`getSRAinfo()`/`listSRAfile()` to `sra_runs()`).
