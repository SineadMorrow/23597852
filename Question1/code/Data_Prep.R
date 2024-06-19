Data_Prep <- function(Datroot) {

    library(tidyverse)

    # Construct full file paths
    Baby_Names_path <- file.path(Datroot, "Baby_Names_By_US_State.rds")
    charts_path <- file.path(Datroot, "charts.rds")
    HBO_Titles_path <- file.path(Datroot,"HBO_titles.rds")
    HBO_Credits_path <- file.path(Datroot, "HBO_credits.rds")

    # Check if the files exist
    if (file.exists(Baby_Names_path) && file.exists(charts_path) && file.exists(HBO_Titles_path) && file.exists(HBO_Credits_path)) {
        # read in the summer data:
        Baby_Names <- read_rds(Baby_Names_path)

        # read in the winter data
        charts <- read_rds(charts_path)

        # read in the GDP data
        HBO_Titles <- read_rds(HBO_Titles_path)

        # read in the GDP data
        HBO_Credits <- read_rds(HBO_Credits_path)

        return(list(Baby_Names = Baby_Names, charts = charts, HBO_Titles = HBO_Titles, HBO_Credits = HBO_Credits))
    } else {
        stop("One or more RDS files do not exist in the specified directory.")
    }
}

