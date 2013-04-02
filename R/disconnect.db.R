# disconnect.db.R
# Description:
# Closes the connection to the Database
# 
# Author: Eric
###############################################################################


disconnect.db <- function(con){
	cat("Disconnecting ... \n")
	dbDisconnect(con)
	cat("Connection to database closed.\n")
}
