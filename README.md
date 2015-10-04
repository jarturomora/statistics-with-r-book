# Statistics (The Easier Way) With R
# Code Examples

This repository contains the R code examples from the book *Statistics (The Easier Way) With R* authored by [Nicole Radziwill](http://nicoleradziwill.com/).

These code examples are sligthly customized by me in order to ease their understaing (at least for me).

## Files Description

### Code for Book Section

* **section2_1.r -** This file contains the code corresponding to Section 2.1 Bar Chars.
* **section2_2.r -** This file contanis the code corresponding to Section 2.2 Histograms, specifically the code to create several examples of histograms.
* **section2_3.r -** This file contains the code corresponding to Section 2.3 Segmented Bar Charts.
* **section2_4.r -** This files contains the code corresponding to Section 2.4 Box Plot.
* **section2_5.r -** This file contains the code corresponding to Section 2.5 Box Plot as is.
* **section2_5_normal_data.r -** In order to have a better understaing of the meaning of box plot this code plots different box plot diagramns using random generate data (similar to the code examples of Section 2.2) in order to contrast histograms Vs. box plot and understand how the skewness of data distribution affects the shape of a box plot. For runnind this code you will need also 'section2_2.r' and uncomment the appropriate windows systems from line 62 to 64, in my case this code was created using Microsoft Windows 10.
* **section2_6.r -** This file contains the code corresponding to Section 2.6 Pie and Waffle Charts.
* **section2_7.r -** This file contains the code corresponding to Section 2.7 Pareto Charts; starting with this code and so on I will use the function 'new.window()' that is defined on the file new.window.r.
* **section2_8.r -** This file contains the code corresponding to Section 2.8 QQ Plots and Test for Normality. I added some extra code to ilustrate different skewness.
* **section2_9.r -** This file contains the code corresponding to Section 2.9 Scatterplots, Covariance, and Correlation.

### Some Extra Code from Philosophical Sessions Between [El Viejo](https://github.com/elviejo79) and me

* **understaing-boxplots.r -** This code plots a box plot with labels for the minimu value, the maximum value, the first quartile, the third quartile, and the median (using the fivenum function) to reflect during my study sessions with [El Viejo](https://github.com/elviejo79) about the interpretation of the box plot and the meaning of its fences, the box and the outliers.
* **new.window.r -** This file contains a function "new.window()" to create new windows to plot graphs depending on the operating system you are using.