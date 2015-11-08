<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Travis-CI Build Status](https://travis-ci.org/jjchern/gaze.svg?branch=master)](https://travis-ci.org/jjchern/gaze)

About
=====

This R data package stores 2010 Census Gazetteer Files. So far it only includes

-   the counties file (`county10.rda`)
-   the zcta file (`zcta10.rda`)

Useful Links
============

-   [U.S. Gazetteer Files](https://www.census.gov/geo/maps-data/data/gazetteer.html)

Installation
============

``` r
# install.packages("devtools")
devtools::install_github("jjchern/gaze")
```

Usage
=====

``` r
library(dplyr)

gaze::county10
#> Source: local data frame [3,221 x 12]
#> 
#>     usps geoid ansicode            name  pop10   hu10      aland
#>    (chr) (int)    (int)           (chr)  (int)  (int)      (dbl)
#> 1     AL  1001   161526  Autauga County  54571  22135 1539582278
#> 2     AL  1003   161527  Baldwin County 182265 104061 4117521611
#> 3     AL  1005   161528  Barbour County  27457  11829 2291818968
#> 4     AL  1007   161529     Bibb County  22915   8981 1612480789
#> 5     AL  1009   161530   Blount County  57322  23887 1669961855
#> 6     AL  1011   161531  Bullock County  10914   4493 1613056905
#> 7     AL  1013   161532   Butler County  20947   9964 2011976894
#> 8     AL  1015   161533  Calhoun County 118572  53289 1569189995
#> 9     AL  1017   161534 Chambers County  34215  17004 1545009282
#> 10    AL  1019   161535 Cherokee County  25989  16267 1434075952
#> ..   ...   ...      ...             ...    ...    ...        ...
#> Variables not shown: awater (dbl), aland_sqmi (dbl), awater_sqmi (dbl),
#>   intptlat (dbl), intptlong (dbl)
gaze::zcta10
#> Source: local data frame [33,120 x 9]
#> 
#>    geoid pop10  hu10     aland  awater aland_sqmi awater_sqmi intptlat
#>    (int) (int) (int)     (int)   (int)      (dbl)       (dbl)    (dbl)
#> 1    601 18570  7744 166659789  799296     64.348       0.309 18.18055
#> 2    602 41520 18073  79288158 4446273     30.613       1.717 18.36227
#> 3    603 54689 25653  81880442  183425     31.614       0.071 18.45518
#> 4    606  6615  2877 109580061   12487     42.309       0.005 18.15835
#> 5    610 29016 12618  93021467 4172001     35.916       1.611 18.29096
#> 6    612 67010 30992 175106243 9809163     67.609       3.787 18.40224
#> 7    616 11017  4896  29870473  149147     11.533       0.058 18.42041
#> 8    617 24597 10594  39347158 3987969     15.192       1.540 18.44515
#> 9    622  7853  8714  75077028 1694917     28.987       0.654 17.99124
#> 10   623 43061 21426  98367847 1633540     37.980       0.631 18.08344
#> ..   ...   ...   ...       ...     ...        ...         ...      ...
#> Variables not shown: intptlong (dbl)

# display variable labels
gaze::county10 %>% select(usps, name, pop10, aland) %>% 
  meda::d(compact = FALSE) %>% select(var, label)
#> Source: local data frame [4 x 2]
#> 
#>     var                                                             label
#>   (chr)                                                             (chr)
#> 1  usps                   United States Postal Service State Abbreviation
#> 2  name                                                              Name
#> 3 pop10                                      2010 Census population count
#> 4 aland Land Area (square meters) - Created for statistical purposes only

# the 10 largest counties in the United States by population based on the 2010 Census
gaze::county10 %>% arrange(desc(pop10))
#> Source: local data frame [3,221 x 12]
#> 
#>     usps geoid ansicode               name   pop10    hu10       aland
#>    (chr) (int)    (int)              (chr)   (int)   (int)       (dbl)
#> 1     CA  6037   277283 Los Angeles County 9818605 3445076 10509869649
#> 2     IL 17031  1784766        Cook County 5194675 2180359  2448383588
#> 3     TX 48201  1383886      Harris County 4092459 1598698  4411986582
#> 4     AZ  4013    37026    Maricopa County 3817117 1639279 23828260196
#> 5     CA  6073   277301   San Diego County 3095313 1164786 10895120648
#> 6     CA  6059   277294      Orange County 3010232 1048907  2047561084
#> 7     NY 36047   974122       Kings County 2504700 1000293   183412016
#> 8     FL 12086   295755  Miami-Dade County 2496435  989435  4915061046
#> 9     TX 48113  1383842      Dallas County 2368139  943257  2256602704
#> 10    NY 36081   974139      Queens County 2230722  835127   281096933
#> ..   ...   ...      ...                ...     ...     ...         ...
#> Variables not shown: awater (dbl), aland_sqmi (dbl), awater_sqmi (dbl),
#>   intptlat (dbl), intptlong (dbl)

# the 10 largest counties in the United States by area based on the 2010 Census
gaze::county10 %>% arrange(desc(aland))
#> Source: local data frame [3,221 x 12]
#> 
#>     usps geoid ansicode                            name   pop10   hu10
#>    (chr) (int)    (int)                           (chr)   (int)  (int)
#> 1     AK  2290  1419987       Yukon-Koyukuk Census Area    5588   4038
#> 2     AK  2185  1419978             North Slope Borough    9430   2500
#> 3     AK  2050  1419966              Bethel Census Area   17013   5919
#> 4     AK  2188  1419979        Northwest Arctic Borough    7523   2707
#> 5     AK  2261  1419984      Valdez-Cordova Census Area    9636   6102
#> 6     AK  2240  1419983 Southeast Fairbanks Census Area    7029   3915
#> 7     AK  2170  1419976       Matanuska-Susitna Borough   88995  41329
#> 8     AK  2164  1419975      Lake and Peninsula Borough    1631   1502
#> 9     AK  2180  1419977                Nome Census Area    9492   4008
#> 10    CA  6071   277300           San Bernardino County 2035210 699637
#> ..   ...   ...      ...                             ...     ...    ...
#> Variables not shown: aland (dbl), awater (dbl), aland_sqmi (dbl),
#>   awater_sqmi (dbl), intptlat (dbl), intptlong (dbl)

# County names are not unique
# See https://en.wikipedia.org/wiki/List_of_the_most_common_U.S._county_names
gaze::county10 %>% 
  filter(name == "Washington County") %>% 
  print(n = 30)
#> Source: local data frame [30 x 12]
#> 
#>     usps geoid ansicode              name  pop10   hu10      aland
#>    (chr) (int)    (int)             (chr)  (int)  (int)      (dbl)
#> 1     AL  1129   161590 Washington County  17581   8407 2797722307
#> 2     AR  5143    69905 Washington County 203065  87808 2439681852
#> 3     CO  8121   198176 Washington County   4814   2434 6521670287
#> 4     FL 12133   295762 Washington County  24896  10796 1509453502
#> 5     GA 13303   348428 Washington County  21187   9047 1757182927
#> 6     ID 16087   399757 Washington County  10198   4529 3763204795
#> 7     IL 17189  1785150 Washington County  14716   6534 1457055371
#> 8     IN 18175   451665 Washington County  28262  12220 1330542331
#> 9     IA 19183   465280 Washington County  21704   9516 1473276393
#> 10    KS 20201   485061 Washington County   5799   2955 2317406254
#> 11    KY 21229   516961 Washington County  11717   5044  769916143
#> 12    ME 23029   581300 Washington County  32856  23001 6637257545
#> 13    MD 24043  1714220 Washington County 147430  60814 1185644157
#> 14    MN 27163   659526 Washington County 238136  92374  995285532
#> 15    MS 28151   695796 Washington County  51137  21708 1877071141
#> 16    MO 29221   758563 Washington County  25195  11017 1968164689
#> 17    NE 31177   835910 Washington County  20234   8301 1009986004
#> 18    NY 36115   974155 Washington County  63216  28844 2152756071
#> 19    NC 37187  1026331 Washington County  13228   6491  901664508
#> 20    OH 39167  1074095 Washington County  61778  28367 1636799113
#> 21    OK 40147  1101861 Washington County  50976  23451 1076020808
#> 22    OR 41067  1155137 Washington County 529710 212450 1875746999
#> 23    PA 42125  1209190 Washington County 207820  92977 2219591093
#> 24    RI 44009  1219782 Washington County 126979  62206  852713750
#> 25    TN 47179  1639797 Washington County 122979  57254  845539916
#> 26    TX 48477  1384024 Washington County  33718  15514 1564232347
#> 27    UT 49053  1448040 Washington County 138115  57734 6284236933
#> 28    VT 50023  1461768 Washington County  59534  29941 1779926134
#> 29    VA 51191  1498359 Washington County  54876  25601 1452917904
#> 30    WI 55131  1581125 Washington County 131887  54695 1115515204
#> Variables not shown: awater (dbl), aland_sqmi (dbl), awater_sqmi (dbl),
#>   intptlat (dbl), intptlong (dbl)

gaze::county10 %>% 
  filter(name == "Cook County") 
#> Source: local data frame [3 x 12]
#> 
#>    usps geoid ansicode        name   pop10    hu10      aland     awater
#>   (chr) (int)    (int)       (chr)   (int)   (int)      (dbl)      (dbl)
#> 1    GA 13075   343878 Cook County   17212    7287  588345665   15647080
#> 2    IL 17031  1784766 Cook County 5194675 2180359 2448383588 1785882224
#> 3    MN 27031   659461 Cook County    5176    5839 3761380730 4888013531
#> Variables not shown: aland_sqmi (dbl), awater_sqmi (dbl), intptlat (dbl),
#>   intptlong (dbl)
```
