library(tidyverse)
library(dplyr)

#1)a) Use the R function nrow to confirm that the iris data frame has 150 rows. Then use and show R code that 
#features a map function to confirm that the iris data frame has 150 rows.
nrow(iris)



#b) Each column of the iris data frame has a unique number of values or objects. For example, the column 
#Sepal.Length has 150 values but 35 of them are unique. Use and show R code that features a map function to 
#find the number of unique values or objects for each column of the iris data frame.

map_dbl(iris, nrow(iris)) #not too sure about this

#2)Use and show R code that features a nested loop that will produce the  5 by 3 matrix shown below.
  
z <- matrix( nrow = 3, ncol = 5)
for (m in 0:5) {
  for (n in 0:5) {
    z[m, n] <- -1*(m - n)
  }
}
print(z)

#3)Use and show R code that will produce a tibble that features 10 randomly generated values that are normally 
#distributed, with means of -10, 0, 10 and 100 respectfully.  Run your code again, producing a second tibble, 
#that confirms random values, hence the second table will not have the same values.


tribble( ~mean,
         -10, 
         0, 
         10, 
         100
) -> meeeean

meeeean

map(meeeean, rnorm, n=10)%>%
  str()



X <- list(12, 14, 15, 18, 19, 22,10,18,18)
Mean <- list(16, 16, 16, 16, 16,16,16,16,16)
sd <- list(2, 2, 2, 2, 2,2,2,2,2)

#4a) In statistics, a z score indicates the standard deviation distance between the mean and a specific value of 
#the data set. What formula is used to find a z score? Use and show R coding that features a map function to 
#iteratively find z scores across the lists given above.


pmap_dbl(list(X,Mean,sd), function(first, second, third) (first - second)/third)

#4b) The test statistic for a population mean is given by the formula ((X - mean)/s/sqrt(n)) Use and show R coding 
#that features a map function to iteratively find test statistics for population means across the lists given above.

pmap_dbl(list(X,Mean,sd), function(first, second, third) (first - second)/sqrt(third))


V = c(10,15,17,22,32,38,42)

#5a) Another purr package function is the keep( ) function. Research, explore, and use the keep( ) function to 
#extract all number from the vector V given above that are less than 20

keep(V, V<20)

#b) Another purr package function is the discard( ) function. Research, explore, and use the discard( ) function 
#to eliminate all numbers from the vector V given above that are less than 20

discard(V, V<20)

#Another purr package function is the safely( ) function. Research, explore, and apply the 
#safely( ) function  to the given vector below as illustrated.
U = list(10,15,"mary",22,32,"james",42)


map(U, safely(~ .x + 15))

#In four or five sentences, explain the specific output for this problem and how the definition and the 
#application of the safely( ) function is used.

#The map code added 15 to all numerical values.  It produced a simple error with the characters Mary and James
#because they are non-numeric,  