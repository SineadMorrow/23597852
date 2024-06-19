
Data_Prep <- function(Datroot){

 library(tidyverse)

    # Construct full file paths
    summer_path <- file.path(Datroot, "summer.rds")
    winter_path <- file.path(Datroot, "winter.rds")
    gdp_path <- file.path(Datroot, "GDP.rds")

    # Check if the files exist
    if (file.exists(summer_path) && file.exists(winter_path) && file.exists(gdp_path)) {
        # read in the summer data:
        Summer <- read_rds(summer_path)

        # read in the winter data
        Winter <- read_rds(winter_path)

        # read in the GDP data
        GDP <- read_rds(gdp_path)

return(list(Summer = Summer, Winter = Winter, GDP = GDP))

    } else {
        stop("One or more RDS files do not exist in the specified directory.")
    }
}