# Code for Section 2.8 QQ Plots and Tests for Normality

# Import the new.window() function that you can find on my Github repo for this book at https://github.com/jarturomora/statistics-with-r-book
source("new.window.r")

# This function calculates the p-value of a dataset.
# @param data : De data whose normality wants to be checked.
# @return : TRUE if the data is normal, FALSE if it is not.
is.normal <- function(data){
	# Checkin normality with Shapiro Test.
	pValue <- shapiro.test(data)
	# The result of the shapiro.test function is a list, so we can access its elements to make fancy validation for normality.
	result <- TRUE
	if(pValue$p.value < 0.5) {
		result <- FALSE
	}
	return(result)
}

# Setting up plot area
par(mfrow = c(2,1))

# Creating an histogram to have a first idea of data distribution.
# Since the data for this Section is not at the Github account of Nicole Radziwil,
# I used another file named "compare-scores.csv" available at https://github.com/NicoleRadziwill/Data/blob/master/compare-scores.csv
# This file contains similar data, I just create a subset to work along this section.
data <- read.csv("data/compare-scores.csv", header = T)
test.scores <- subset(data, when = "FA11")
hist(test.scores$score, breaks = 10, xlim = c(0,100), ylim = c(0,25), col = "blue")

# Now we create the QQ Plot
qqnorm(test.scores$score)
qqline(test.scores$score)

# Checkin normality with Shapiro Test.
if (is.normal(test.scores$score)) print ("The exam scores are normally distributed") else print("The exam scores are not normally distributed.")

# Open a new window to plot normal data example
new.window("bill")

# Create ideal normal data
normal <- rnorm(500, 46.85, 11.31)
par(mfrow = c(2, 1))
hist(normal, breaks = 12, xlim = c(0, 100), ylim = c(0, 100), main = "N(46.85, 11.31)", col = "white")
qqnorm(normal)
qqline(normal)