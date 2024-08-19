library(utils)
library(base)

# pacman is a package manager for R which can be used to download
# and load packages as required
pacman::p_load(sf, tidyverse)

# sf is a package which can be used to import, manage and process
# geospacial data
data_source_name_geospatial <- "data/geospatial"

# Reads the from the folder "data/geospatial" and uses all data
# with the same file name of "MP14_SUBZONE_WEB_PL"
# NOTE: does not specify the file type but only the file name
# without extension
master_plan_subzone_boundary <- st_read(
    dsn = data_source_name_geospatial,
    layer = "MP14_SUBZONE_WEB_PL"
)
cat("\n")

cycling_path <- st_read(
    dsn = data_source_name_geospatial,
    layer = "CyclingPathGazette"
)
cat("\n")

# st_read can also be sued to read files in kml format
preschool <- st_read("data/geospatial/PreSchoolsLocation.kml")

# st_geometry can be used to retrieve the geometry list-column
st_geometry(master_plan_subzone_boundary)
cat("\n")

# glimpse can be used to learn about the attributes of the data frame
glimpse(master_plan_subzone_boundary)
cat("\n")

# head can be used to get the top few rows of the data frame
# n can be used to specify the number of rows
# NOTE: namespace can be specified to prevent collisions
utils::head(master_plan_subzone_boundary, n = 5)

# plot can be used on geospatial data frames to display
# the information in a graphical format
plot(master_plan_subzone_boundary)

# By specifiying certain attributes of the data frame, the plot
# can be altered to display certain information, such as geometry
plot(st_geometry(master_plan_subzone_boundary))

# Attributes can also be specified via their key
plot(master_plan_subzone_boundary["PLN_AREA_N"])
