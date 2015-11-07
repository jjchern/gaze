# Download Gaz_counties_national.txt -----------------------------------------
# Download date: 2015-11-05

src = "http://www2.census.gov/geo/docs/maps-data/data/gazetteer/Gaz_counties_national.zip"
lcl_zip = "data-raw/Gaz_counties_national.zip"

if (!file.exists(lcl_zip)) download.file(src, lcl_zip)
unzip(lcl_zip, exdir = "data-raw")

# Ingest data -------------------------------------------------------------

readLines("data-raw/Gaz_counties_national.txt") %>%
  stringr::str_trim() %>%
  writeLines("data-raw/Gaz_counties_national.txt")

county10 = readr::read_tsv("data-raw/Gaz_counties_national.txt")

# Minor tweaks: change variables names to lower cases, add tbl_df ---------

library(dplyr)
library(magrittr)

names(county10) = tolower(names(county10))
county10 %<>%
  mutate(aland_sqmi = as.numeric(aland_sqmi),
         awater_sqmi = as.numeric(awater_sqmi),
         intptlat = as.numeric(intptlat),
         intptlong = as.numeric(intptlong))

# Add variable labels
# Source: https://www.census.gov/geo/maps-data/data/gazetteer2010.html

labelled::var_label(county10) =
  list(
    usps = "United States Postal Service State Abbreviation",
    geoid = "Geographic Identifier - fully concatenated geographic code (State FIPS and County FIPS)",
    ansicode = "American National Standards Institute code",
    name = "Name",
    pop10 = "2010 Census population count",
    hu10 = "2010 Census housing unit count",
    aland = "Land Area (square meters) - Created for statistical purposes only",
    awater = "Water Area (square meters) - Created for statistical purposes only",
    aland_sqmi = "Land Area (square miles) - Created for statistical purposes only",
    awater_sqmi ="Water Area (square miles) - Created for statistical purposes only",
    intptlat = "Latitude (decimal degrees) First character is blank or '-' denoting North or South latitude respectively",
    intptlong = "Longitude (decimal degrees) First character is blank or '-' denoting East or West longitude respectively"
  )

meda::d(county10)
meda::cb(county10)

# Save the data frame -----------------------------------------------------

devtools::use_data(county10, overwrite = TRUE)

# Delete the raw zip file --------------------------------------------------

unlink(lcl_zip)
