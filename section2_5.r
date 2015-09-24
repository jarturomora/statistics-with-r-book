# Section 2.5 Comparative Box Plots

# Generating students scores. In the book this data is loaded from a text file, I decide to generate the data.
allscores <- data.frame(
	year = c(rep(2010, 300), rep(2011, 300), rep(2012, 300)),
	score = sample(round(runif(n = 900, min = 30, max = 85), digits = 2), replace = T,)
)

# Comfiguring plot area
par(mfcol = c(2,1))

# Now we create a comparative box plot set by plotting the socores but separating them by year
boxplot(score~year, data = allscores, horizontal = T)

# Now we will create a nicer boxes comparition
# We want to show the plots decending by year, so we order the allscores data frame.
allscores$year <- ordered(allscores$year, levels = c("2012", "2011", "2010"))
# Creating a nicer boxes comparition
boxplot(
	score~year,
	data = allscores,
	main = "Statistics Pre-Test Score Distribution",
	xlab = "Years",
	ylab = "Pre-Test Score",
	ylim = c(0, 100),
	col = c("green", "white", "red"),
	horizontal = T
)

# Now we plot some curves to corroborate the squidness

# Open a new plot window (uncomments according to your OS)
windows() # under Windows
# x11() # under Unix /Linux
# quartz() # under OSX
par(mfrow = c(3,1))

# Year 2010
x = subset(allscores, year == "2010")
hist(x$score, main = "Pre-Test Score for 2010", col = "red")
abline(v = median(x$score), lwd = 2)
abline(v = mean(x$score), lwd = 2, col = "blue")
# Year 2011
x = subset(allscores, year == "2011")
hist(x$score, main = "Pre-Test Score for 2011", col = "white")
abline(v = median(x$score), lwd = 2)
abline(v = mean(x$score), lwd = 2, col = "blue")
# Year 2012
x = subset(allscores, year == "2012")
hist(x$score, main = "Pre-Test Score for 2012", col = "green")
abline(v = median(x$score), lwd = 2)
abline(v = mean(x$score), lwd = 2, col = "blue")