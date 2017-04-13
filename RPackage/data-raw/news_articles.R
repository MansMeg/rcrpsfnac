## Script to generate speeches dataset
devtools::install_local("RPackage/")
library(dplyr)

# speeches_raw ----
print(Sys.time())

# Read in raw files to tbl_df
load("RPackage/data-raw/raw_data/small_fnac_corpus_raw.Rdata")

# Create corpus
small_fnac_corpus <- data_frame(doc_id = 1:length(wordsOfArticles))
small_fnac_corpus$text <- unlist(lapply(wordsOfArticles, paste, collapse = " "))

# Store data
devtools::use_data(small_fnac_corpus, overwrite = TRUE, pkg = "RPackage/")

print(Sys.time())
# data("speeches", package = "rcrpsriksdag")
