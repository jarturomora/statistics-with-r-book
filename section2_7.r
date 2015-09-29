# Code for Section 2.7 Pareto Charts

# Setting the plot area
par(mfrow = c(2,1))

# Data for the pareto chart
data <- c(12, 29, 18, 3, 34, 4)
names(data) <- c("Weather", "Overslept", "Alarm Failure", "Time Change", "Traffic", "Other")
df.data <- data.frame(data)

# Create the pareto chart using the "qcc" package
library(qcc)

# I assigned the pareto chart to an object and then print it in order to show on the summary data on the console as well ass the pareto chat in the plot area.
# Pareto chart usign the data vector.
my.pareto <- pareto.chart(data)
print("Pareto Chart using a vector (labels in categories)")
print(my.pareto)
# Pareto chart using the df.data data frame
my.pareto <- pareto.chart(df.data$data)
print("Pareto Chart using a data frame (letters in categories)")
print(my.pareto)
# Finally a plot "a la Nicole" with nice labels and an horizontal line at 80% to distinguish the vital few from the trivial many.
source("new.window.r") # A custom function to open windows depending on you operating system.
new.window("bill")
# par(mfrow = c(1,1))
my.pareto <- pareto.chart(
	data,
	main = "Most Frequent Reasons People Arrive Late at Work",
	xlab = "Reasons",
	ylab = "Frequency",
	cex.names = 0.6,
	las = 1,
	col = topo.colors(6)
)
print("Pareto Chart 'a la Nicole'")
print(my.pareto)
# Putting a line at the 80% of the cummulative percentage of the data
abline(h=(sum(data)*0.8), col = "red", lwd = 4)