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

# Now we will work with the data from the kshd-2013.txt file adding a new column for the season of the year based on the equinoxes and solstices.
season <- rep(NA, 365)
season[1:79] <- "winter"
season[80:171] <- "spring"
season[172:263] <- "summer"
season[264:354] <- "fall"
season[355:365] <- "winter"
# Using the cbind() function "Column Bind" we attached the season vector to the weather data
shd.wx <- cbind(shd.wx, season)
print("--------------------------------------------------------")
print("Weather Data from Nicole's Howtown With the Season Added")
print("--------------------------------------------------------")
print(head(shd.wx, 10))
# Creating a new and nicer scatteredplot for the weather data with a different symbol for each season using the pch (Plot CHaracter) parameter in the plot() function.
new.window("bill")
plot(
	shd.wx$TEMP, shd.wx$DEWP,
	pch = as.integer(shd.wx$season),
	col = as.integer(shd.wx$season),
	xlab = "Average Daily Temperature in 2013",
	ylab = "Dewpoint",
	main = "Dewpoint Vs. Temperature (SHD 2013)"
)
# We add a nice legend to the plot but at this time we don't have an accurate assignation of colors.
legend(
	"bottomright",
	title = "Non sure colors :-/",
	inset = c(0.02, 0.02),
	legend = c("fall", "spring", "summer", "winter"),
	pch = c(1:4),
	col = palette()[1:4]
)
# Now we will definne accurate colors for each season of the year.
season.color <- rep(NA, 365)
season.color[1:79] <- "gray"
season.color[80:171] <- "red"
season.color[172:263] <- "orange"
season.color[264:354] <- "orange"
season.color[355:365] <- "gray"
# Now we add the colors column to our dataset
shd.wx <- cbind(shd.wx, season.color)
# Now we create a new plot with accurate labeling, legend and colors
new.window("bill")
plot(
	shd.wx$TEMP, shd.wx$DEWP,
	col = as.character(shd.wx$season.color),
	pch = 15,
	xlab = "Average Daily Temperature",
	ylab = "Dewpoint",
	main = "Dewpoint Vs Temperature (SHD 2013)"
)
legend(
	"bottomright",
	title = "Rigth Colors :-)",
	inset = c(0.02, 0.02),
	legend = c("fall", "spring", "summer", "winter"),
	pch = 15,
	col = c("orange", "green", "red", "gray")
)
# Catalog of the different plot points that can be used
new.window("bill")
plot.new()
par(usr = c(-1, 21, 0, 1))
for (n in 0:20) {
	points(n, 0.5, pch = n, cex = 2)
	text(n, 0.45, n)
}
box()

# The Scatterplot Matrix
new.window("bill")
plot.new()
# Creating a group of scatteredplots for all the rows of shd.dx and only the first ten columns.
pairs(shd.wx[, 1:10])