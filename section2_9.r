# Code for Section 2.9 Scatterplots, Covariance, and Correlation

# My windows opening function
source("new.window.r")

# Setting plot area
par(mfrow = c(2, 1))

# Loading the data from the kshd-2013.txt file available at Nicoles's GitHub repo https://github.com/NicoleRadziwill/Data-for-R-Examples/blob/master/kshd-2013.txt
shd.wx <- read.table("data/kshd-2013.txt", header = T)

# Plotting the scatteredplot
plot(shd.wx$TEMP, shd.wx$DEWP, main = "Dewpoint Vs. Temperature", xlab = "Temperature (deg F)", ylab = "Dewpoint (deg F)")

# Now we will calculate the Covariance and the Correlation Coefficient manually
i <- 1:10
xi <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
yi <- c(0.2, 2.1, 2.9, 3.8, 5.3, 6, 6.9, 8.1, 9.3, 9.9)
xbar <- mean(xi)
ybar <- mean(yi)
xi.minus.xbar <- xi - xbar
yi.minus.ybar <- yi - ybar
xdiff.x.ydiff <- xi.minus.xbar * yi.minus.ybar
plot(xi, yi) # This is the scatteredplot from xi and yi
# Printing all the calculations for the covariance
calc.df <- cbind(i, xi, xbar, xi.minus.xbar, yi, ybar, yi.minus.ybar, xdiff.x.ydiff)
print("-----------------------------------------------------------")
print("Data for Covariance and Correlation Coefficient Calculation")
print("-----------------------------------------------------------")
print(calc.df)
# Calculate the covariance
print("Covariance Calculation")
print("**********************")
my.covariance <- sum(xdiff.x.ydiff)/9
print(paste("My manually calculated covariance is: ", my.covariance, sep = ""))
print(paste("The covariance calculated by R using the cov() function is: ", cov(xi, yi), sep = ""))
# Calculate the correlation coefficient
print("Correlation Coefficient Calculation")
print("***********************************")
print(paste("My manually correlation coefficient calculation: ", my.covariance/(sd(xi) * sd(yi)), sep = ""))
print(paste("The correlation coefficient calculated by R using the cor() function: ", cor(xi, yi), sep = ""))

# Now we will work with the data from the kshd-2013.txt file adding a new column for the seasson of the year based on the equinoxes and solstices.
seasson <- rep(NA, 365)
seasson[1:79] <- "winter"
seasson[80:171] <- "spring"
seasson[172:263] <- "summer"
seasson[264:354] <- "fall"
seasson[355:365] <- "winter"
# Using the cbind() function "Column Bind" we attached the seasson vector to the weather data
shd.wx <- cbind(shd.wx, seasson)
print("---------------------------------------------------------")
print("Weather Data from Nicole's Howtown With the Seasson Added")
print("---------------------------------------------------------")
print(head(shd.wx, 10))
# Creating a new and nicer scatteredplot for the weather data with a different symbol for each seasson using the pch (Plot CHaracter) parameter in the plot() function.
new.window("bill")
plot(
	shd.wx$TEMP, shd.wx$DEWP,
	pch = as.integer(shd.wx$seasson),
	col = as.integer(shd.wx$seasson),
	xlab = "Average Daily Temperature in 2013",
	ylab = "Dewpoint",
	main = "Dewpoint Vs. Temperature (SHD 2013)"
)
# We add a nice legend to the plot
legend(
	"bottomright",
	inset = c(0.02, 0.02),
	legend = c("fall", "spring", "summer", "winter"),
	pch = c(1:4),
	col = palette()[1:4]
)