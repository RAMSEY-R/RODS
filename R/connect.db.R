# connect.db.R


require(DBI)

#TODO add exception wrapper
connect.db <- function (dsn,uid,pwd,gui=FALSE) {
	
	cat("Establishing connection to Database ... \n")
	if(gui){
		#tk gui
		tryCatch({
			convar <- dialog.login()
			user <- convar$uid
			pwd <-convar$pwd
		}, error = function(err) {
			print(err)
		}, finally = {
			rm(convar)
		})
	}else{
		#Command Line
		ora <- dbDriver("Oracle")
		
		#Prompt
		cat("Username: ")
		user <- readline()
		cat("Password: ")
		system("stty -echo")
		pwd <- readline()
		system("stty echo")
		cat("\n")
	}
	
	con <- dbConnect(ora,user=user,password=pwd,dbname=dsn)
	
	cat("Connected to database",dsn,"\n")
	
	rm(user,pwd)
	
	invisible(con)
}