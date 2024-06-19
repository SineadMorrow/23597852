Data_Merge <- function(Data) {

    library(tidyverse)
    library(dplyr)

    # Subset the summer data:
    # Subset Summer data
    subset_summer <- data.frame(
        Year = Data$Summer$Year,
        City = Data$Summer$City,
        Sport = Data$Summer$Sport,
        Discipline = Data$Summer$Discipline,
        Country = Data$Summer$Country,
        Gender = Data$Summer$Gender,
        Event = Data$Summer$Event,
        Medal = Data$Summer$Medal
    )

    # Identify and convert event type
    subset_summer <- subset_summer %>%
        mutate(Event_Type = duplicated(subset_summer) | duplicated(subset_summer, fromLast = TRUE)) %>%
        mutate(Event_Type = as.integer(Event_Type)) %>%
        distinct()

    # Subset Winter data
    subset_winter <- data.frame(
        Year = Data$Winter$Year,
        City = Data$Winter$City,
        Sport = Data$Winter$Sport,
        Discipline = Data$Winter$Discipline,
        Country = Data$Winter$Country,
        Gender =Data$Winter$Gender,
        Event = Data$Winter$Event,
        Medal = Data$Winter$Medal
    )

    # Identify and convert event type
    subset_winter <- subset_winter %>%
        mutate(Event_Type = duplicated(subset_winter) | duplicated(subset_winter, fromLast = TRUE)) %>%
        mutate(Event_Type = as.integer(Event_Type)) %>%
        distinct()

    # Add season indicators
    subset_winter$season <- rep("winter", nrow(subset_winter))
    subset_summer$season <- rep("summer", nrow(subset_summer))

    # Merge Summer and Winter subsets
    merged_olympics <- bind_rows(subset_winter, subset_summer) %>%
        arrange(Year)

    # Process GDP data
    GDP <- Data$GDP %>%
        drop_na() %>%
        select(-Country) %>%
        rename(Country = Code)

    # Join Olympics data with GDP
    olympics_df <- left_join(merged_olympics, GDP, by = "Country") %>%
        arrange(Year) %>%
        drop_na()

    return(olympics_df)
}

