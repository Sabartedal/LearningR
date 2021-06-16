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

nhanes_small %>%
    select(tot_chol, bp_sys_ave, poverty)

nhanes_small %>%
    rename(diabetes_diagnosis_age = diabetes_age)

select(nhanes_small, bmi, contains("age"))

nhanes_small %>%
    select(bmi, contains("age"))

physical_activity <- select(nhanes_small, phys_active_days, phys_active)
rename(physical_activity, days_phys_active = phys_active_days)

nhanes_small %>%

physical_activity <- nhanes_small %>%
    select(phys_active_days, phys_active) %>%
    rename(days_phys_active = phys_active_days)

physical_activity

## Filtering

# Filter for all females

nhanes_small %>%
    filter(sex == "female")

# Filter all male

nhanes_small %>%
    filter(sex != "female")

# Participants with BMI = 25

nhanes_small %>%
    filter(bmi == 25)

# Participants with BMI over and = to 25

nhanes_small %>%
    filter(bmi >= 25)

# Participants with BMI greater than 25

nhanes_small %>%
    filter(bmi > 25 & sex == "female")

# BMI greater than 25 OR sex is female

nhanes_small %>%
    filter(bmi > 25 | sex == "female")

## Arranging data

# Arranging by age in ascending order

nhanes_small %>%
    arrange(age)

# Arranging by sex in ascending order

nhanes_small %>%
    arrange(sex)

# Arranging by age in desending order

nhanes_small %>%
    arrange(desc(age))

# Arranging by sex then age in ascending order

nhanes_small %>%
    arrange(sex, age)

# Arranging by sex then age in descending order

nhanes_small %>%
    arrange(desc(sex), age)

## Transform or add columns

nhanes_small %>%
    mutate(height = height / 100)

# Add a new column with logged height values

nhanes_small %>%
    mutate(loogged_height = log(height))

# Transform height values to meter and add log colum
nhanes_small %>%
    mutate(height = height / 100,
           logged_height = log(height))

# New column based on how active åarticipants are

nhanes_small %>%
    mutate(highly_active = if_else(phys_active_days >= 5,
                                   "Yes", "No" ))

nhanes_update <- nhanes_small %>%
    mutate(height = height / 100,
    logged_height = log(height),
    highly_active = if_else(phys_active_days >= 5,
                            "Yes", "No" ))
## Summary statistics by group

nhanes_small %>%
    summarise(max_bmi = max(bmi))

## Remove NAs

nhanes_small %>%
    summarise(max_bmi = max(bmi, na.rm = TRUE))

# calculating 2 summary statictics

nhanes_small %>%
    summarise(max_bmi = max(bmi, na.rm = TRUE),
              min_bmi = min(bmi, na.rm = TRUE))
