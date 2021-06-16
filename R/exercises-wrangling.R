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
nhanes_small


