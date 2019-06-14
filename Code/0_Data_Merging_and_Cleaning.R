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
# SA_Name                     --->   SA_PUB2011

# Extract variables needed
family_2011_sub <- family_2011[,c(1:42)]
family_2016_sub <- family_2016[,c(1:21, 30:49)]

# Merge
family <- merge(family_2011_sub, family_2016_sub, 
                by.x = c("Electoral.Division.CSO.Code", "GEOGID", "County", "NUTS_III"),
                by.y = c("CSOED","GEOGID", "COUNTYNAME", "NUTS3NAME"))

# Remove extra info
family <- family[,-c(43, 45:49, 51, 53, 55:56)]

# Rename 2016 columns
colnames(family)[50:67] <- c("Families_2_persons", "Families_3_persons","Families_4_person",
                             "Families_5_persons","Families_6+_persons", "Families_Total",
                             "Persons_2_persons","Persons_3_persons",
                             "Persons_4_persons","Persons_5_persons","Persons_6+_persons",
                             "Persons_total","Children_2_persons","Children_3_persons",
                             "Children_4_persons","Children_5_persons","Children_6+_persons",
                             "Children_Total")