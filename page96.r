###############################################
# Shape types of a histogram                  #
# Book: Statistics (The Easier Way) With R    #
# Author: Nicole Radziwill @nicoleradziwill   #
# Code from page 96 to 97                     #
# Comments by: Arturo Mora-Soto @jarturomora  #
#              Marked as #JAMS                #
###############################################

# This line sets up a plotting area that has 3 rows and 2 columns
par(mfrow=c(3,2))

label <- "Unimodal Symmetric"
# Randomly sample 100000 times from the normal distribution with mean
# of 0 and standard deviation of 1:
x <- c(rnorm(100000,0,1))
# Now plot the histogram in gray, with 100 bars, erasing all axis labels
hist(x,col="#cccccc",breaks=100,axes=FALSE,xlab="",main=label)

label <- "Bimodal Symmetric"
# Randomly sample 100000 times from the normal distribution with mean
# of 0 and standard deviation of 1, then again from the normal
# distribution with mean of 4 and standard deviation of 1 (so they have 
# distinctly different peaks). Mash all the data together to form x.
x <- c(rnorm(100000,0,1),rnorm(100000,4,1)) 
# Now plot the histogram in gray, with 100 bars, erasing all axis labels
hist(x,col="#cccccc",breaks=100,axes=FALSE,xlab="",main=label)

label <- "Unimodal, Skewed Right"
# Randomly sample 100000 times from the beta distribution (which is sort
# of normal looking, but is skewed according to its shape parameters).
# The shape parameters here are alpha=2 and beta=5, meaning it will be
# skewed to the right.
x <- rbeta(100000,2,5)
# Now plot the histogram in gray, with 100 bars, erasing all axis labels
hist(x,col="#cccccc",breaks=100,axes=FALSE,xlab="",main=label)

label="Bimodal Asymmetric"
# Randomly sample 60000 times from the normal distribution with mean
# of 0 and standard deviation of 1, then 100000 times from the normal
# distribution with mean of 4 and standard deviation of 1 (so they have
# distinctly different peaks, and so the first peak is not as high as
# the second peak). Mash all the data together to form x.
x <- c(rnorm(60000,0,1),rnorm(100000,4,1))
# Now plot the histogram in gray, with 100 bars, erasing all axis labels
hist(x,col="#cccccc",breaks=100,axes=FALSE,xlab="",main=label)

label <- "Unimodal, Skewed Left"
# Randomly sample 100000 times from the beta distribution (which is sort
# of normal looking, but is skewed according to its shape parameters).
# The shape parameters here are alpha=5 and beta=2, meaning it will be
# skewed to the left.
x <- rbeta(100000,5,2)
# Now plot the histogram in gray, with 100 bars, erasing all axis labels
hist(x,col="#cccccc",breaks=100,axes=FALSE,xlab="",main=label)

label <- "Uniform, Symmetric"
# Randomly sample 100 million times from the uniform distribution with
# minimum of 0, and maximum of 6. We had to sample it a lot in order to
# give the plotted distribution that nice smooth plateau-like form.
x <- runif(100000000,0,6)
# Now plot the histogram in gray, limiting the extent of the x-axis
# to between 0 and 6 so that only our values show, with 7 bars, erasing
# all axis labels
#JAMS This histogram will take a little bit more time to be displayed, so be patient (it depends on you computer)
hist(x,col="#cccccc",breaks=7,axes=FALSE,xlab="",main=label)