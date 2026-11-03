## SRAdb is deprecated in favor of OmicIDX. These helpers keep the wording of
## the startup message and the per-function warnings in one place.

.omicidxrGuideUrl <- "https://omicidx.cancerdatasci.org/guides/r-omicidxr.html"

.sradbDeprecationText <- function() {
  paste0(
    "SRAdb is deprecated and will be removed from Bioconductor. ",
    "Its SQLite database is no longer updated (last built December 2023). ",
    "Use OmicIDX instead; from R, the omicidxr package replaces ",
    "SRAdb: ", .omicidxrGuideUrl,
    " (see help(\"SRAdb-deprecated\"))."
  )
}

## Signal a deprecatedWarning for the exported function `old`, reported
## against the user's call. Calls from other SRAdb functions (e.g.
## getSRAinfo() -> listSRAfile()) stay quiet, so each user call warns once.
.deprecatedSRAdb <- function(old) {
  if (identical(topenv(parent.frame(2)), topenv()))
    return(invisible())
  warning(warningCondition(
    paste0("'", old, "' is deprecated. ", .sradbDeprecationText()),
    old = old, package = "SRAdb",
    class = "deprecatedWarning",
    call = sys.call(-1)
  ))
}

.onAttach <- function(libname, pkgname) {
  packageStartupMessage(.sradbDeprecationText())
}
