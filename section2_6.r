# Code for Section 2.6 Pie Charts and Waffle Charts.

# Creating data from an M&M bag to plot a pie chart.
mm.counts <- c(12, 6, 8, 10, 6, 7)
names(mm.counts) <- c("blue", "brown", "green", "orange", "red", "yellow")
print("This is data from openning a M&M bag and creating a vector")
print(mm.counts)
print(paste("We have", sum(mm.counts), "M&M's in the bag."))

# Loading data from a case that is stored in a CSV file.
mm.data <- read.csv("data/mnm-clean.csv")

# Since to create a pie chart that we need is the frequency of each case, we count how many M&M's per color we have using the table function.
mm.case <- table(mm.data$color)
print("Data from openning 23 bags of M&M's and loaded from a CSV file")
# Changing mm.case names, we take the names previously defined for mm.counts.
names(mm.case) <- names(mm.counts)
print(mm.case)

# Time to create the pie chart, first we will define the labels.
# Pie Chart using mm.counts object

# Defining the percentage of each color that will correspond to a slide in the pie chart
percents <- round(mm.counts/sum(mm.counts)*100)

# Defining labels for the pie chart
my.labels <- paste(names(mm.counts), " ", percents, "%", sep="")

# Finally we plot the pie chart
pie(mm.case, labels = my.labels, main = "My M&M Color Distribution", col = names(mm.counts), density = 30, xlab = "M&M Color")

# Just for fun now we will plot a waffle chart, to do that you will need the "waffle" package.

library(waffle)
# Open a new plot window (uncomments according to your OS)
windows() # under Windows
# x11() # under Unix /Linux
# quartz() # under OSX

# Since I am plotting this graph from an R script, I have to assign the plot to and object and then print it in order to show it in the plot window; this is a known issue of the "ggplot2" package that is used by the "waffle" package.
my.waffle <- waffle(mm.case/10, rows = 7, colors = names(mm.counts), title = "M&M Colors", xlab = "1 square = 10 M&Ms")
print(my.waffle)