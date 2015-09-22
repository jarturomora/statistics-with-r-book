# Creating segmented bar charts

# Setting plot area
par(mfrow = c(2,1))

# Reading the data from the M&M file
mm.data <- read.csv("data/mnm-clean.csv", header = T)

# Creating a contingency table
mm.ct <- table(mm.data$color, mm.data$defect)

# Printing the contingency table
print("Contingency Table for a Segmented Bar Chart")
print(mm.ct)

# Creating a segmented bar chart for the columns (that's what the 2 is for)
mm.colors <- c("Blue", "Brown", "Green", "Orange", "Red", "Yellow")
barplot(prop.table(mm.ct, 2), main = "Distribution of M&M Colors by Defect", xlab = "Type of Defect", ylab = "Color Frequency Distribution", col = mm.colors)

# Creating a segmented bar chart for the rows (that's what the 1 is for)
barplot(t(prop.table(mm.ct, 1)), main = "Distribution of M&M Defects by Color", xlab = "Color", ylab = "Defect Frequency Distribution", col = mm.colors, legend = T, names.arg = mm.colors)