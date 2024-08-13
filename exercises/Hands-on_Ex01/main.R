# pacman is a package manager for R which can be used to download
# and load packages as required
pacman::p_load(sf, tidyverse)

# sf is a package which can be used to import, manage and process
# geospacial data

mpsz <- st_read(dsn = "data/geospatial", layer = "MP14_SUBZONE_WEB_PL")
