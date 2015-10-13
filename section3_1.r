# Code for Section 3.1

# Plotting choices from asking people to select a number between 1 and 4.
# Just a simple exercise to show that people are bad generating random numbers.

choices <- c(2, 5, 13, 6)
barplot(choices, ylab = "Frequency", names.arg = c(1, 2, 3, 4), col = rainbow(4))