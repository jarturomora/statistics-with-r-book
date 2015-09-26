# I made this code to have a better understanding about the meaning of a box plot, the outliers and the fences.
# I got a nice help from this page: http://www.itl.nist.gov/div898/handbook/prc/section1/prc16.htm

label <- "Unimodal Symetric"
allscores <- data.frame(
	year = c(rep(2010, 30000), rep(2011, 30000), rep(2012, 40000)),
	score = c(rnorm(100000, 0, 1))
)
boxplot(allscores$score, data = allscores, main = label, horizontal = T)
my.labels <- round(fivenum(allscores$score), digits = 2)
text(x = my.labels, y = c(1.15, 1.25, 1.25, 1.25, 1.15), labels = my.labels, col = "red")