##################################
# 0 - Data Merging and Cleaning
##################################


# Import 2011 Census Data
family_2011 <- read.csv("Data/family_2011_census.csv")
commuting_2011 <- read.csv("Data/commuting_2011_census.csv")

# Import 2016 Census Data
family_2016 <- read.csv("Data/family_2016_census.csv")

# Equivalents
#      2011                   --->    2016
# Electoral.Division.CSO.Code --->   CSOED
# SA_Name                     --->   OSIED