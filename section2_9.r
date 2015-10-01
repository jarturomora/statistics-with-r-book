# Code for Section 2.9 Scatterplots, Covariance, and Correlation

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
print(calc.df)
# Finally we calculate the covariance
my.covariance <- sum(xdiff.x.ydiff)/9
print(paste("My manually calculated covariance is: ", my.covariance, sep = ""))
print(paste("The covariance calculated by R using the cov() function is: ", cov(xi, yi), sep = ""))