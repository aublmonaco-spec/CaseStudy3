#Case Study 03: Data Cleaning and Transformation for Reproducible Research"
#' 
#' 1.  **Identifying common data errors**, such as missing values, incorrect data types, and inconsistent entries.
#' 2.  **Applying `tidyverse` functions** to correct these errors efficiently and reproducibly.
#' 3.  **Saving the cleaned dataset** to disk.

library(tidyverse)
library(readr)
library(knitr)

messy_data <- tibble(
      ID = 1:7,
      ObservationDate = c("2023-01-15", "Jan 20, 2023", "01/25/2025", "2023-02-05", "missing", "2023-02-15", "03/01/2023"),
      Temperature_C = c("15.2", "18.0", "14.5", "invalid", "17.3", "20.1", NA),
      Humidity_Percent = c(70, -72, NA, 65, 780, 80, 71),
      Site = c("North", "nirth", "South", "East", "west", "NORTH", "Souther"))
head(messy_data)
#This function shows all of the data, since there are only 7 observations and 5 variables. In a larger data set, this function would only show the beginning lines. Negative and NA values are highlighted.
str(messy_data)
#This function tells me that there are 7 rows and 5 columns of data, and shows that there are 7 observations within each column.
summary(messy_data)
#This function shows me a statistical summary of the messy_data, such as values like minimum and mean.It can't provide values for columns with character values.

messy_data <- messy_data %>%
  mutate(Temperature_C = as.numeric(Temperature_C)) %>%
  mutate(ObservationDate = parse_date_time(ObservationDate, orders = c("dmy", "ymd", "mdy"))) %>%
  mutate(Site = case_when(Site %in% c("nirth", "NORTH") ~ "North",
                         Site == "west" ~ "West",
                         Site == "Souther" ~ "South",
                         TRUE ~ Site
                         )) %>%
  mutate(Humidity_Percent = if_else(Humidity_Percent >= 0 & Humidity_Percent <= 100, Humidity_Percent, NA_real_))

#temperature: for temperature, using "as.numeric" converted this column to a numeric format
#observationdate: I used parse_date_time from lubridate and specified all of the possible date combinations with orders = c(formats)
#site: I used the "case_when()" function and specified the the site column, which allowed me to choose values in the column and rename them; for "North", I used c() to group all of the mispelled "Norths" together
#humidity_percent: I used an "if_else()" statement to choose humidity percent values between 0 and 100. Specifying the humidity_percent (x) after the if_else() statement tells it that I want the humidity_percent value to show if the condition is true, and using NA_Real_ (y) has "NA" show up if the condition is false
#my method for site wouldn't be the most efficient for larger data sets.

summary(messy_data)
str(messy_data)
view(messy_data)

dir.create(path = "data_processed", showWarnings = TRUE, recursive = TRUE, mode = "0777")
write.csv(messy_data, "data_processed/cleaned_field_data.csv", row.names = FALSE)
