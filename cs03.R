#' ---
#' title: "Case Study 03: Data Cleaning and Transformation for Reproducible Research"
#' ---
#' 
#' ## Objective
#' 
#' The objective of this case study is to **develop an R script** that performs crucial data cleaning and transformation tasks on a messy dataset. This exercise will focus on:
#' 
#' 1.  **Identifying common data errors**, such as missing values, incorrect data types, and inconsistent entries.
#' 2.  **Applying `tidyverse` functions** to correct these errors efficiently and reproducibly.
#' 3.  **Saving the cleaned dataset** to disk.
#' 
#' This case study is vital for building robust **reproducible research workflows** and ensures that your analysis is based on high-quality, reliable data.
#' 
#' ## Background
#' 
#' We need to constantly work with real-world data, which is rarely pristine. Data often contains errors due to collection methods, manual entry, or data integration. Before any meaningful analysis or visualization can occur, data must be **cleaned, transformed, and merged appropriately**. This process of data wrangling is a core skill for any data scientist, enabling you to **convert data from varied formats/structures to the desired format for analysis and visualization**.
#' 
#' For this exercise, you'll simulate working with a small, messy dataset your colleague "collected in the field". This dataset represents common issues you'll encounter and will require the use of `tidyverse` functions for effective cleaning.
#' 
#' ## Task
#' 
#' Download the starter script and perform the following tasks:
#' 
#' ### Step 1: Set up your R environment and create the messy dataset
#' 
## ----results='hide', message=FALSE--------------------------------------------
# Install tidyverse if not already installed (uncomment and run if needed)
# install.packages("tidyverse")

# Load tidyverse for data manipulation
library(tidyverse)
library(knitr)

#' 
#' 2.  **Create the messy dataset**:
#' We will create a simulated data frame directly in R to represent common data errors.
## -----------------------------------------------------------------------------
# Create a messy simulated dataset
messy_data <- tibble(
      ID = 1:7,
      ObservationDate = c("2023-01-15", "Jan 20, 2023", "01/25/2025", "2023-02-05", "missing", "2023-02-15", "03/01/2023"),
      Temperature_C = c("15.2", "18.0", "14.5", "invalid", "17.3", "20.1", NA),
      Humidity_Percent = c(70, -72, NA, 65, 780, 80, 71),
      Site = c("North", "nirth", "South", "East", "west", "NORTH", "Souther")
    )

#' 
#' 3.  **Inspect the dataset**:
#' Use `head()`, `str()`, and `summary()` to get an initial understanding of the data's structure and identify potential issues. **Add comments on lines beginning with `#`** to explain your observations.
head(messy_data)
#' 
#' 
#' ### Step 2: Handle Characters in Numeric Columns
#' 
#' Often, numeric columns may contain non-numeric characters (e.g., "invalid", "missing") or be stored as character strings. These need to be converted to actual numeric types.
#' 
#' *   **Hint**: The `readr` package (part of `tidyverse`) provides `parse_number()` which is robust at extracting numbers from strings. You can use `mutate()` (from `dplyr`) to apply this transformation.

#' 
#' ### Step 3: Correct Date Column Issues
#' 
#' Dates can come in many formats. For consistent analysis, convert them to a standard date format YMD like `2023-01-15`.
#' 
#' *   **Hint**: The `lubridate` package (part of `tidyverse`) offers extremely useful functions like `ymd()`, `mdy()`, `dmy()` to parse various date formats. Check out the use of `mutate` with `case_when` to develop a set of rules for converting the dates.
#' 

#' 
#' ### Step 4: Standardize Categorical Data (Inconsistent Entries)
#' 
#' Categorical variables (like `Site`) often have inconsistent casing or spelling. Standardize these to ensure unique categories are correctly identified and are only one of the following options: `c("North","South", "East", or "West")`.
#' 
#' *   **Hint**: The `stringr` package (part of `tidyverse`) has `str_to_lower()` for converting text to lowercase. You can use `mutate()` to apply this. `dplyr::recode()` or `case_when` is also useful for more complex standardization.
#' 

#' 
#' ### Step 5: Address Out-of-Range Humidity Values
#' 
#' Physical measurements often have a valid range. Here, humidity percentage should be between 0 and 100. Your ability to know what is or is not a valid value will depend on your understanding of the source dataset and what is being measured. In some cases you may be able to 'fix' the values if they were entered incorrectly (and you are sure of the error).  However, in some cases the best path forward is to remove the questionable values.  In this step, identify values outside this range [0-100] and replace them with `NA`.
#' 
#' *   **Hint**: The `dplyr` package offers `if_else()` or `case_when()` for conditional logic within `mutate()`. These are very useful for replacing values that fail a specific condition.
#' 

#' 
#' ### Step 6: Final Inspection and Save the Cleaned Dataset
#' 
#' 1.  **Perform a final review**: Use `summary()` and `str()` (or maybe `View()`) one last time to ensure all cleaning steps were successful.
#' 2.  **Create a dedicated folder for processed data**:
#'     Ensure you have a "data_processed" directory. You can do this programmatically using `dir.create()`.
#' 3. In the example output above, I added new columns (e.g. `Temperature_C_v2` so the change was visible). In your version, simply replace the variables.
#' 
#' 

#' 
#' Your final table should look like this:
#' 

#' 

#' 
#' 3. **Save the transformed dataset**:
#' Use `write_csv()` (from `readr`, part of `tidyverse`) to save your dataframe to the "data_processed" folder as a CSV file named `cleaned_field_data.csv`.
#' 

#' 
#' 
#' 
#' ### Step 7: Review your output
#' 
#' 1.  **Save your script**:
#'     Ensure your R script file is saved.
#' 2.  **Run your script**:
#'     Click **‘Source’ in RStudio** to execute your script from beginning to end.
#' 3.  **Verify generated files**:
#'     *   Check the "data_processed" folder for your `cleaned_field_data.csv` file.
#'     *   Open the CSV file in a text editor or spreadsheet program to confirm the data types are correct, missing values are handled, dates are consistent, and categorical entries are standardized.
#' 
#' ### Submit!
#' 
#' For the assignment, upload the following files with your last name in the file name (`lastname_firstname_cs01.r`):
#' 
#' 1. Your edited .r/.R file (or even .rmd or .qmd if working with rmarkdown/quarto). This is just a text file with the extension .R to indicate that it's has R code in it.
#' 2. A .txt or .pdf version of your .R file (for UBlearns grading) 
#' 3. Your .csv file saved with the extension .txt
#' 
#' Please remove the bulk of the comments in the template script and keep only the comments needed to explain what you are doing.
#' 
#' ## Hints and Considerations
#' 
#' *   **Comments**: Remember to **add comments (lines starting with `#`)** throughout your script to explain each step. This is crucial for **reproducible research**.
#' *   **Order of Operations**: The order in which you perform cleaning steps can matter. For example, converting to numeric might generate new `NA`s that you then need to handle.
#' *   **Data Exploration**: Before and after each cleaning step, use functions like `table()`, `unique()`, `summary()`, and `str()` to understand your data's state.
#' *   **`tidyverse`**: The `tidyverse` offers a consistent grammar for data manipulation. The pipe operator `|>` or `%>%` allows you to chain multiple operations together, making your code readable and efficient.
#' *   **RStudio Projects**: Using **RStudio Projects** is recommended to manage your working directory and ensure all paths are relative and reproducible.
