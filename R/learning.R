10

# R basics ----------------------------------------------------------------
weight_kilos <- 100
weight_kilos <- 10
weight_kilos
colnames(airquality)
str(airquality)
summary(airquality)
2 + 2
2 + 2

# Packages ----------------------------------------------------------------
library(tidyverse)
r3::check_git_config()

library(NHANES)


# Looking at data --------------------------------------------------------
library(tidyverse)
library(NHANES)
glimpse(NHANES)
select(NHANES, age)
select(NHANES, Age, Weight, BMI)
colnames(NHANES)
select(NHANES, -HeadCirc)
select(NHANES, starts_with("BP"))
select(NHANES, ends_with("day"))
select(NHANES, contains("Age"))

nhanes_small <- select(
  NHANES,
  Age,
  Gender,
  BMI,
  Diabetes,
  PhysActive,
  BPSysAve,
  BPDiaAve,
  Education
)
nhanes_small

# Fixing variable names ---------------------------------------------------

nhanes_small <- rename_with(
    nhanes_small,
    snakecase::to_snake_case
)

# Piping ------------------------------------------------------------------
colnames(nhanes_small)
nhanes_small %>%
    colnames()

nhanes_small %>%
    select(phys_active) %>%
    rename (
        Physically_active = phys_active
    )
