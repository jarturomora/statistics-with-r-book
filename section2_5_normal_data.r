# Section 2.5 Comparative Box Plots
# In this file we create normal distributed data similar to the
# data generated in Section 2.2. We want to understand the
# meaning of the box plot.

# Along this code the object "allscores" will store the score data for a group of students.

library(functional)
my.box <- Curry(boxplot, horizontal = T)

# This line sets up a plotting area that has 3 rows and 2 columns
par(mfrow=c(3,2))

# Now we will plot several box plot with similar "shapes" as in Section 2.2 (section2_2.r file)

label <- "Unimodal Symetric"
allscores <- data.frame(
	year = c(rep(2010, 30000), rep(2011, 30000), rep(2012, 40000)),
	score = c(rnorm(100000, 0, 1))
)
my.box(allscores$score, data = allscores, main = label)
my.labels <- round(fivenum(allscores$score), digits = 2)
text(x = my.labels, y = c(1.15, 1.25, 1.25, 1.25, 1.15), labels = my.labels, col = "red")

label <- "Bimodal Symmetric"
allscores <- data.frame(
	year = c(rep(2010, 60000), rep(2011, 60000), rep(2012, 80000)),
	score = c(rnorm(100000,0,1),rnorm(100000,4,1))
)
my.box(allscores$score, data = allscores, main = label)

label <- "Unimodal, Skewed Right"
allscores <- data.frame(
	year = c(rep(2010, 30000), rep(2011, 30000), rep(2012, 40000)),
	score = c(rbeta(100000,2,5))
)
my.box(allscores$score, data = allscores, main = label)

label="Bimodal Asymmetric"
allscores <- data.frame(
	year = c(rep(2010, 50000), rep(2011, 50000), rep(2012, 60000)),
	score = c(rnorm(60000,4,1),rnorm(100000,0,1))
)
my.box(allscores$score, data = allscores, main = label)

label <- "Unimodal, Skewed Left"
allscores <- data.frame(
	year = c(rep(2010, 30000), rep(2011, 30000), rep(2012, 40000)),
	score = c(rbeta(100000,5,2))
)
my.box(allscores$score, data = allscores, main = label)

label <- "Uniform, Symmetric"
allscores <- data.frame(
	year = c(rep(2010, 3000000), rep(2011, 3000000), rep(2012, 4000000)),
	score = c(runif(10000000,0,6))
)
my.box(allscores$score, data = allscores, main = label)

# Finally we open the histograms from Section 2.2 on a new window.
# Open a new plot window (uncomments according to your OS)
windows() # under Windows
# x11() # under Unix /Linux
# quartz() # under OSX
source("section2_2.r")