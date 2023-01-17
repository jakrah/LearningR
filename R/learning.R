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
nhanes_small %>%
    select (bp_sys_ave, education)
nhanes_small %>%
    rename(bp_sys = bp_sys_ave,
           bp_dia = bp_dia_ave
           )
nhanes_small %>%
select(bmi, contains("age"))

nhanes_small %>%
    select(starts_with ("bp")
           rename (bp_systolic = bp_sys_ave))

# Filtering rows ----------------------------------------------------------

nhanes_small %>%
    filter(phys_active != "No")

nhanes_small %>%
    filter(bmi >= 25,
           phys_active == "No")

nhanes_small %>%
filter(bmi == 25 |
           phys_active == "No")

# Arranging rows ----------------------------------------------------------

nhanes_small %>%
    arrange(desc(age), bmi)

# Mutating columns --------------------------------------------------------

nhanes_small %>%
    mutate(age = age * 12 )

nhanes_small %>%
    mutate(age_month = age * 12 )

nhanes_update <- nhanes_small %>%
    mutate(age_month = age * 12,
           logged_bmi = log(bmi),
           age_weeks = age_month * 4,
           old = if_else(age >= 30,
                         "old",
                         "young"))

# Exercise: Piping, filtering, and mutating -------------------------------

nhanes_small %>%
    filter(bmi >= 20 & 50,
           diabetes == "YES")

mean_arterial_pressure <-
    mutate(
        (2 * bd_dia_ave) + bp_sys_ave)/3))

nhanes_small %>%
    summarise(max_bmi = max(bmi, na.rm = TRUE))
nhanes_small %>%
    summarise(max_bmi = max(bmi, na.rm = TRUE),
              min_bmi = min(bmi, na.rm = TRUE))

# Summarising -------------------------------------------------------------

nhanes_small %>%
    summarize (
        max_bmi = max (bmi))

nhanes_small %>%
    filter (!is.na(diabetes))  %>%
group_by (diabetes) %>%
    summarize (
        max_bmi = max (bmi, na.rm = TRUE),
        min_bmi = min (bmi, na.rm = TRUE)
        ) %>% ungroup ()


write_csv(
    nhanes_small,
    here::here ("data/nhanes_small.csv"))
)

