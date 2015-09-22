# Creating Bar Plots
# Using data from openning a M&M bag we will create two bar plots

# Setting plot area margins
par(mar = c(2,2,2,2))
# Setting the plot area space
par(mfrow = c(4,1))

print("Vector approach to create a bar plot")
mm.counts <- c(12,6,8,10,6,7)
names(mm.counts) <- c("blue","brown","green","orange","red","yellow")
mm.colors <- c("blue","brown","green","orange","red","yellow")
print("Vector of M&M colors in a bag")
print(mm.counts)
barplot(mm.counts, main = "My M&M Color Distribution", xlab = "M&M Colors", ylab = "Number of M&M in Bag", col = mm.colors)

print("Data frame approach to create a bar plot")
mm.df <- read.csv("data/mnm-clean.csv", header = TRUE)
print("Data retrieved from the mnm-clean.csv file")
print(head(mm.df))
# To create the bar plot we take the data of the column we want to plot
count.colors <- table(mm.df$color)
print("DataFrame color column of M&M in a bag")
print(count.colors)
print("Contingency Table from the M&M Data Frame")
print(table(mm.df$color, mm.df$defect))
barplot(count.colors, main = "My M&M Color Distribution", xlab = "M&M Colors", ylab = "Number of M&M in Bag", col = mm.colors)
barplot(table(mm.df$defect), main = "My M&M Defect Distribution", xlab = "M&M Defect", ylab = "Number of M&M in Bag", horiz = T)
barplot(table(mm.df$student), main = "M&M Count by Student", xlab = "Student Name", ylab = "Number of M&M in Bag")