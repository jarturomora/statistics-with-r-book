# Section 2.5 Comparative Box Plots
# In this file we create normal distributed data similar to the
# data generated in Section 2.2. We want to understand the
# meaning of the box plot.

# Along this code the object "allscores" will store the score data for a group of students.

# This line sets up a plotting area that has 3 rows and 2 columns
par(mfrow=c(3,2))

# Now we will plot several box plot with similar "shapes" as in Section 2.2 (section2_2.r file)

label <- "Unimodal Symetric"
allscores <- data.frame(
	year = c(rep(2010, 30000), rep(2011, 30000), rep(2012, 40000)),
	score = c(rnorm(100000, 0, 1))
)
boxplot(allscores$score, data = allscores, horizontal = T, main = label)



# Finally we open the histograms from Section 2.2 on a new window.
# Open a new plot window (uncomments according to your OS)
windows() # under Windows
# x11() # under Unix /Linux
# quartz() # under OSX
source("section2_2.r")