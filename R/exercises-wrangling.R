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

