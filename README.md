# parcoordtutorial
##Tutorial on the parallel coordinates visualization method.

###What is parallel coordinate?
Parallel coordinates was invented by Alfred Inselberg in the 1970s as a way to visualize high-dimensional data. A parallel coordinate plot maps each row in the data table as a line, or profile. Each attribute of a row is represented by a point on the line. 

The values in a parallel coordinate plot are always normalized into percentages. This means that for each point along the X-axis (attributes), the minimum value in the corresponding column is set to 0% and the maximum value in that column is set to 100% along the Y-axis. 

###How can parallel coordinate helpful?
Parallel coordinates can help define patterns and coorlilation that can explained by different variables. 

###Example:
```R
library(MASS)
data("mtcars")
parcoord( mtcars[,1:4], col=rainbow(length(mtcars[,1])), var.label=TRUE)
```
Here is a parallel coordinates plot for cars based on their MPG, cylinder, displacement and horsepower 
<img src="plots/carpar.png">
We can clearly see that the custer of low mpg cars tend to have 8 cylinders and higher horsepower than those of 4 cylinder models.

###How to make this plot clearer?
The problem with the parallel coordinates above is that the screen is too cluttered with many lines, making hard to identify the trend. In order to avoid this problem, we can use the fredparcoord package which plots only the lines having the highest estimated multivariate density.
###Example:
```R
library(freqparcoord)
data("mtcars")
freqparcoord(mtcars,m=5,dispcols=1:4,k=7)
```
**x:** the data
**m:** the m most frequest rows of x which will plotted from each group
**dispcols:** the number of displayed columns
**k:** the grouping of k nearest neighbors to use for density estimation
<img src="plots/car_freq.png">

The trend is in plot is very distinguishable, high mpg models have less cylinders indicated by the downward sloping lines from mpg to cyl. It is interesting to see here that the number of cylinders have does not have much of an effect on horsepower, something we could not clearly see from the previous parallel coordinates.  



