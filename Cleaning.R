# Required packages
# Load the necessary libraries
library(tidymodels)
library(readxl)
library(tidyverse)
library(here)
library(performance)
library(skimr)
library(janitor)

# Read the dataset into R
ch4 <- read_xlsx(here("Data Upload", "DNA methylation data.xlsm"), sheet = 1,
                 name_repair = janitor::make_clean_names)


Data <- janitor::clean_names(ch4)

# Explore the first few rows
head(ch4)

summary(ch4)

#All points are between 100 and 0


#Provided histograms, missing data info, data types and number of unique datasets  
skim(ch4)

#CpG  GRIA2 1 2 missing data points, complete rate = 0.968
#CpG GRIA2 2 2 missing data points, complete rate = 0.968
#ASPA 1 3 missing data points, complete rate = 0.952

#No cases more than 5% effected, will remove missing data 
CleanedData <- Data %>% drop_na(cp_g_gria2_1,cp_g_gria2_2,aspa_1)


