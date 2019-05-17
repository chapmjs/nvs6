# nvs6 factors dataset import and explore
# 20190517

library(dplyr)
library(stringr)

# file from email, uploaded to server. How to make this available to other users?

# master1_raw <- read.csv("~/R/nvs6/data/Master1_Table.txt", header=FALSE) # no headers
master1headers_raw <- read.csv("~/R/nvs6/data/master1_withHeaders.txt")

# variable names to lower case
names(master1headers_raw) <- tolower(names(master1headers_raw))
names(master1headers_raw)

# copy dataset to new name
master1 <- master1headers_raw

# explore dataset
str(master1)
str(master1)
levels(master1$Label_Name)
glimpse(master1)
names(master1) 

# remove id field
master1 <- master1 %>% select (-id)

# discover duplicate fields
setequal(master1$soc2010ttl,master1$Occupation)  # = FALSE


# convert Numeric fields to numeric data type
# numeric fields = medwage


# convert currency fields from string to numeric data type

# Number of Bachelor's degrees awards offered by state
master1 %>% 
  filter(str_detect(level_name, "Bachelor's")) %>%
  group_by (stabbr) %>%
  summarize(n = n()) %>%
  arrange (desc(n))
  

# List of institutions offering highest number of bachelor's degrees in VA
master1 %>%
  filter(stabbr == "VA",str_detect(level_name, "Bachelor's")) %>%
  select(instnm,cip2010ttl,level_name) %>%
  group_by(instnm) %>%
  summarize(n = n()) %>%
  arrange(desc(n))
  