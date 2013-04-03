# disconnect.db.R
# Description:
# Closes the connection to the Database



disconnect.db <- function(con){
	cat("Disconnecting ... \n")
	dbDisconnect(con)
	cat("Connection to database closed.\n")
}
