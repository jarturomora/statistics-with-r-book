# This function opens a new plot window.
# Parameters:
#	os : The operating system used.
#		"bill" <- for Microsoft Windows
#		"steve" <- for Apple OsX
#		"linus" <- For linux
new.window <- function(os) {
	switch(os,
		bill = {
			windows()
		},
		steve = {
			quartz()
		},
		linus = {
			x11()
		}
	)
}