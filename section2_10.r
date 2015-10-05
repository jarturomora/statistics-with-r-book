# Code for section 2.10 Contingency Tables

# Loagin data from the M&M file
data <- read.csv("data/mnm-clean.csv")

# First 10 rows of the M&M data
print("** First Ten Rows of M&M Data **")
print(head(data, 10))

# Creating a contingency table with the table() function with color on the rows and defects on the columns
print("** Contingency Table Using the table() Function Colors / Defect **")
print(table(data$color, data$defect))

# Now we will create the most simple contingency table that could be created using the CrossTable() function
library("gmodels")
print("** Contingency Table Created Using the CrossTable() Function (simplest form) **")
my.table <- CrossTable(data$color, data$defect, prop.t = F, prop.r = F, prop.c = F, prop.chisq = F, chisq = F)
print("** Extra Information That Can Be Gathered When You Assign A CrossTable() To An Object **")
my.text <- "
	Frequencies: my.table$t\n
	Row proportions (each row adds 100%): my.table$prop.row\n
	Column proportions (each column adds 100%): my.table$prop.col\n
	Table proportions: my.table$tbls
"
writeLines(my.text)
print("** Contingency Table Created Using the CrossTable() Function (full form) **")
CrossTable(data$color, data$defect, prop.t = T, prop.r = T, prop.c = T, prop.chisq = T, chisq = T)

# Now we will work with marginal distributions
# Marginal distribution of M&M's colors
count.colors <- table(data$color)
# Marginal distribution of M&M's defects
count.defects <- table(data$defect)
# Show two barplot with the marginal distributions
par(mfrow = c(2,1))
my.colors <- c("blue", "brown", "green", "orange", "red", "yellow")
my.defects <- c("Cracked", "Letter", "Multiple", "No Defect")
barplot(count.colors, main = "Marginal Distribution of Colors", col = my.colors, names = my.colors)
barplot(count.defects, main = "Marginal Distribution of Defects", col = rainbow(20), names = my.defects)

# Conditional distributions
source("new.window.r")
defects.for.greens <- table(data[data$color == "G",]$defect)
color.for.cracked <- table(data[data$defect == "C",]$color)
new.window("bill")
par(mfrow = c(2,1))
barplot(defects.for.greens, main = "Conditional Distribution of Defects (Green M&M's)", names = my.defects, col = rainbow(20))
barplot(color.for.cracked, main = "Conditional Distribution of Colors (Cracked)", names = my.colors, col = my.colors)