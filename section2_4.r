# Section 2.4 Box Plots

# Generating 40 normally distributed values of temperature with a mean of 76 degress and a standard deviation of 9 degress.
temps <- rnorm(40, 76, 9)

# Generating some general statistics from the temps dataset
print("Header Values")
print(head(temps))
print("Summary Stats")
print(summary(temps))
print("Five Number Summary")
print("Min Value - 1st Quartile - Median - 3rd Quartile - Max Value")
print(fivenum(temps))

# Contrasting a box plot Vs. a histogram

# Setting the plot area
par(mfrow = c(3,1))
# Creating the box plot
boxplot(temps, main = "Box Plot of Summet High Temps", ylim = c(50, 110), xlab = "Temperature (deg F)", horizontal = T, col = "blue")
# Creating the histogram
hist(temps,  main = "Histogram Plot of Summet High Temps", xlim = c(50, 110), xlab = "Temperature (deg F)", col = "#cc66cc")
# Adding a vertical line at the mean
abline(v = mean(temps), lwd = 5, col = "red")
# Adding a vertical line  at the meadian
abline(v = median(temps), lwd = 3, col = "blue")

# Drawing a box plot with comprenhensive labeling

# Generating random data to plot
dfx <- data.frame(
	group = c(rep('A', 8), rep('B', 15), rep('C',6)),
	sex = sample(c("M", "F"), size = 29, replace = T),
	age = runif(n = 29, min = 18, max = 54)
)
# Define labels for the plot
my.labels <- round(fivenum(dfx$age), digits = 2)
# Creating the box plot for the Age variable of the dfx data frame
boxplot(dfx$age, horizontal = T, ylim = c(10, 60), col = "lightgray", add = F, main = "Distribution of Ages")
# Finally we add the labels we define previously to put the five numbers over the box plot.
text(x = my.labels, y = c(1.15, 1.25, 1.25, 1.25, 1.15), labels = my.labels)
