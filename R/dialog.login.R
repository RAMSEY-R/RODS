# dialog.login.R


requires(tcltk)

dialog.login <- function() {
	
	cat("Please use the dialog window to login.\n")
	tt <- tktoplevel()
	tkwm.title(tt,"Login")
	
	#Username
	user <- tclVar("")
	entry.user <- tkentry(tt,width="20",textvariable="user")
	label.user <- tklabel(tt,text="user")
	tkgrid(label.user,entry.user)
	
	#Password
	password <- tclVar("")
	entry.password <- tkentry(tt,width="20",textvariable=password,show="*")
	label.password <-tklabel(tt,text="password")
	tkgrid(label.password,entry.password)
	
	#Login Button
	OnLogin <- function(){
		tkdestroy(tt)
		user <<- tclvalue(user)
		password <<- tclvalue(password)
	}
	button.login <- tkbutton(tt,text="  Login  ",command=OnLogin)
	tkbind(entry.password,"<Return>",OnLogin)
	tkgrid(button.login,columnspan=2)
	
	tkfocus(tt)
	tkwait.window(tt)
	
	out <- list(uid=user,pwd=password)
	invisible(out)
}