HBO_Merge <- function(Data) {

    # Merging the HBO titles and credits by move/show id

    library(tidyverse)
    library(dplyr)

    HBO <-
        left_join(
            HBO_Credits,
            HBO_Titles,
            by = "id"

        ) %>% arrange(release_year)

     # Dropping unwanted columns from HBO data:

    HBO <- HBO %>%
        select(!c(person_id, description, seasons, age_certification, starts_with("imbd")))

    # Dropping if the person's role is director
    HBO$role <- HBO$role %>%
      select_if(contains("ACTOR")) %>%
        arrange(release_year)
}