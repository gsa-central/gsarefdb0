library(shiny)
library(shinythemes)
library(DT)
library(hms)
library(reshape2)
library(readr)
library(readxl)

## read refdata into R
file = "data/GSA Reference DB_1.xlsx"

## openxlsx::read.xlsx(file,1, startRow=5)
GTdata <- readxl::read_excel(file, sheet = 1, range = "A5:L355")
RBdata <- readxl::read_excel(file, sheet = 2,  range = "A5:H66")
GeGdata <- readxl::read_excel(file, sheet = 3, range = "A5:H66")
ncGdata <- readxl::read_excel(file, sheet = 4, range = "A5:H35")


## analysis
source("R/2019_Mora_Popularity_versus_Performance.R")


