label <- "Unimodal Symetric"
allscores <- data.frame(
	year = c(rep(2010, 30000), rep(2011, 30000), rep(2012, 40000)),
	score = c(rnorm(100000, 0, 0.0000002))
)
my.box(allscores$score, data = allscores, main = label)
my.labels <- round(fivenum(allscores$score), digits = 2)
text(x = my.labels, y = c(1.15, 1.25, 1.25, 1.25, 1.15), labels = my.labels, col = "red")