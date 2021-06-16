# Load the packages
source(here::here("R/package-loading.R"))

# Check column names
colnames(NHANES)

# Look at contents
str(NHANES)
glimpse(NHANES)

# See summary
summary(NHANES)

# Look over the dataset documentation
?NHANES

glimpse(NHANES)

select(NHANES, Age)

select(NHANES, Age, BMI)

select(NHANES, -Age)

# All columns starting with "BP"

select(NHANES, starts_with("BP"))

# All columns ending with "Day"

select(NHANES, ends_with("Day"))

# All columns containing "Age"

select(NHANES, contains("Age"))

?select_helpers

# Save the selected columns as a new data frame

nhanes_small <- select(NHANES, Age, Gender, Height,
                       Weight, BMI, Diabetes, DiabetesAge,
                       PhysActiveDays, PhysActive, TotChol,
                       BPSysAve, BPDiaAve, SmokeNow, Poverty)
#View the new data frame

nhanes_small

str(nhanes_small)

#Renaming to snake case = more tidy:

nhanes_small <- rename_with(nhanes_small, snakecase::to_snake_case)

nhanes_small

#renaming specific columes

rename(nhanes_small, sex = gender)

nhanes_small

nhanes_small <- rename(nhanes_small, sex = gender)

nhanes_small

## the pipe operator

# without the pipe operator

colnames(nhanes_small)

# with the pipe operator Ctrl + Shift + M

nhanes_small %>% colnames()

# Using the pipe operator with more functions

nhanes_small %>%
    select(phys_active) %>%
    rename(physically_active = phys_active)









