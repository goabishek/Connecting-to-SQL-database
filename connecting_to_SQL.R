###############################
#set working directory
################################
setwd("/Users/abishek/My Documents/R_files")

##########################
#import library
##########################
library(odbc)
library(DBI)

###########################
#Connect database
############################
con <- dbConnect(odbc(), Driver = "SQL Server", Server = "server_name", 
                 Database = "db_name", UID = "", PWD = "password")

################################
#Fetch Data
###############################

#Query method
rs <- dbSendQuery(con, "SELECT * FROM table_name")
df <- dbFetch(rs)
dbClearResult(rs)

#For full table
df <- dbReadTable(con, "table_name")

######################
#Write Data
######################
write.csv(df, file = "df.csv", row.names = FALSE)