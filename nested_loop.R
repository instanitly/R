
# -------------------------------------------------
# Mindanao State University
# General Santos City
# Mathematics Department
# April 19, 2021
#
# Basic Programming in R
# Prepared by: Prof. Carlito Daarol
# for BS Math/BS IT/BS Econ students
# during the second pandemic semester
#
# This is a self-guided tutorial
# Do not run all lines at once. You will become an idiot if you do so
# thinking about which input generates a particular output

## The main task is to illustrate how a repetitive tasks is accomplished
## using double for loops


# -----------------------------------------------
# Example1: Count number of iterations
# -----------------------------------------------

count = 0
for (i in 1:5){
  for (j in 4:9){
    count = count +1
  }
}
paste0("The count variable was updated for " , count, " times. ")



# -----------------------------------------------
# Example2: Double for loop Count number of iterations
# -----------------------------------------------
count = 0
for (i in 20:26){
  for (j in 15:30){
    count = count +1
    print(paste0(count, ":   i= ",i, "  |  j= ", j , "  | hello babes"))
  }
}
paste0("The double loop displayed " , count, " lines of hello babes. ")
noquote(paste0("The double loop displayed " , count, " lines of hello babes. "))
# Remark:  for each value of i, there are 15 values of j




# -----------------------------------------------
# Example3: Double for loop Count number of iterations
# if somehow you dont like the output disPlay
# then you should monitor the width of the index and create blank spaces as needed
# you can do this by applying nested if else conditions which has the following syntax

# if (condition 1) {
#     statement 1
# } else if (statement 2) {
#     statement 2
# } else {
#     statement 3
# }
# -----------------------------------------------

count = 0
for (i in 20:26){
  for (j in 15:30){
    count = count +1

    if (count < 10) {
      print(paste0(count, ":     i= ",i, "  |  j= ", j , "  | hello babes"))

    } else if (count < 100) {
      print(paste0(count, ":    i= ",i, "  |  j= ", j , "  | hello babes"))

    } else {
      print(paste0(count, ":   i= ",i, "  |  j= ", j , "  | hello babes"))
    }
  }
}
paste0("The double loop displayed " , count, " lines of hello babes. ")
# See that? That's how meticulous programming is
# It is all in your mind what to do



# -----------------------------------------------
# Example 4: Back to the problem mentioned in the limitation of single for loops.
# This is an application of determining infinite sums
# We want to get the sum
# what is the sum of the first N integers? 1 + 2 + 3 + ... + N + ...
# What is the sum of terms 1/2 + 1/4 + 1/8 + 1/16 + 1/32 +....
# what is the sum of terms 1/2 + 1/3 + 1/4 + 1/5 + 1/6 + ...
# -----------------------------------------------

# where N is a numeric array
# N = 10000, 20000, 30000, 40000, 50000, 60000, 70000, 80000, 90000, 100000, 300000, 600000, 1000000, 2000000

# Solution

N <- c(10000, 20000, 30000, 40000, 50000, 60000, 70000, 80000, 90000, 100000, 300000, 600000, 1000000, 2000000)

# declare empty arrays as container of the sum of terms
sum1r <- NULL
sum2r <- NULL
sum3r <- NULL

for (j in 1:length(N)){

  # initialize sum accumulators
  sum1 = 0
  sum2 = 0
  sum3 = 0

  for (i in 1:N[j]){
    sum1 = sum1 + i            # this will handle question number 1
    sum2 = sum2 + (1/2)^i      # this will handle question number 2
    sum3 = sum3 + 1/i          # this will handle question number 3
  }

  # fill up the summation containers
  sum1r[j] <- sum1
  sum2r[j] <- sum2
  sum3r[j] <- sum3
}

# display results
options("scipen"=100)
result <- data.frame(cbind(sum1r,sum2r,sum3r))
rownames(result) <- paste0("at N = ",N)

# change column headers to more informative one
colnames(result) <- c("Sum of 1+2+3+...+N", "Sumof 1/2+1/4+1/8+...", "Sum of 1+1/2+1/3+...")
result

# interpretation
# at increasing number of terms
# the sum of the first series of terms increases very fast
# the sum of the second series of terms always equal to 1, regardless of the value of N
# the sum of the third series of terms increases slowly. The sum increases as N increases


# Conclusion
# the first series is an example of a divergent series as N --> infinity
# the second series is an example of a convergent series as N --> infinity since the sum is always the same
# the third series is an example of a divergent series as N --> infinity (though slowly)



# ===========================================================
# New Topic: Vector Operations versus Loops in R
# ===========================================================


# Vector Operations Using Arrays
# An alternative process instead of looping is to use vector operations
# as discussed in your calculus class
# instead of looping each value we consider vector operations like vector dot product


#  Example 1: Computation of the correlation coefficient between two variables
#              Using vector operations


datax <- c(0.9913345,1.0027839,0.9968691,1.0161024,1.0065136,1.0297600,0.9659482,1.0185862,
           1.0097508,1.0202250,1.0238810,0.9801332,1.0099076,0.9817378,0.9963364,1.0219328,
           1.0059981,0.9722559,0.9926882,1.0267477,0.9945208,1.0177237,0.9808133,1.0143415,
           1.0074551,1.0002456,0.9937849,1.0453198,0.9826864,1.0082201)

datay <- c(0.9964580,1.0181583,0.9895960,1.0176893,1.0009406,1.0226642,0.9558703,1.0111873,1.0158226,1.0187873,
           1.0230155,0.9670798,1.0056325,0.9734213,1.0020038,1.0126897,1.0032060,0.9783406,0.9948068,1.0246172,
           0.9939589,1.0168364,0.9806948,1.0168963,1.0137382,0.9938570,0.9844847,1.0487818,0.9784052,1.0037628 )


xlen <- length(datax)
# the following results can be obtained directly
(sumx = sum(datax))
(sumy = sum(datay))
(sumxy = sum(datax%*%datay))
(sumxsquare = sum(datax^2))
(sumysquare = sum(datay^2))
(squaresumx  = sumx^2)
(squaresumy  = sumy^2)


# solve the numerator
nume <- xlen * sumxy - sumx * sumy

# solve the denominator
num2a <- xlen * sumxsquare - squaresumx
num2b <- xlen * sumysquare - squaresumy
deno <- sqrt(num2a*num2b)

Pearsonr <- nume/deno
Pearsonr

# Question: What is the point of using for loops?
# Answer: There are situations where vector operation is not applicable



# -------------------------------------------------------------------------------------------
# Example 2: Finding limit of a function Using 2 Sided Limits
# what is the limit of the function f(x) = 2(x^2-x)/(x-1) as x approaches 1 from the right?
# What is the limit of the function f(x) = 2(x^-x)/(x-1) as x approaches 1 from the left?


# Note: The existence of a limit of a function exists provided we can measure the value
# of the function at several points and measure how small is the difference


# The critical point here is x = 1 since at that value, f(x) becomes undefined because the denominator becomes 0
# We will investigate the behavior of the function at values closer to 1 from both the
# left and right side of 1
# -------------------------------------------------------------------------------------------


#STEP1:  we assume values of x from 3 to 1.001 at an increment of -0.001
x_fromright  <- seq(from = 3, to = 1.0001,by = -0.0001)


# then we compute the corresponding value of the function f(x)
fx_atxfromright =    2*(x_fromright^2 - x_fromright)/(x_fromright-1)



#STEP2:  we assume values of x from -1 to 0.99 at an increment of 0.001
x_fromleft  <- seq(from = -1, to = 0.9999, by = 0.0001)


# then we compute the corresponding value of the function f(x)
fx_atxfromleft =    2*(x_fromleft^2-x_fromleft)/(x_fromleft-1)


# to compare results, we must arrange the values using a dataframe (table)
result <- data.frame(cbind(x_fromleft," ",fx_atxfromleft,x_fromright,"  ", fx_atxfromright))

colnames(result) <- c("x approaces 1 from left  "," ", "  Value of f", "  x approaches 1 from right", " ","  Value of f at x right")


# extract last 10 rows and evaluate the pattern
x<- nrow(result)-10
y <- nrow(result)

(last15rows <- result[x:y,])

# at the bottom of the dataframe you will see that as x approaches 1 from the left, f(x) approaches 1.99979999
# and as x approaches 1 from the right, f(x) approaches 2.00019999
# and we can therefore conclude that the limit f(x) as x approaches 1 is equal to 2.
# since the two sided limits are the same
# -------------------------------------------------------------------------------------------




# -------------------------------------------------------------------------------------------
# Example 3: Finding limit of another  function
# what is the limit of the function f(x) = |2(x^2-x)|/(x-1) as x approaches 1 from the right?
# What is the limit of the function f(x) = |2(x^-x)|/(x-1) as x approaches 1 from the left?

# Note: The existence of a limit of a function exists provided we can measure the value
# of the function at several points and measure how small is the difference


# The critical point here is x = 1 since at that value, f(x) becomes undefined since the denominator becomes 0
# We will investigate the behavior of the function at values closer to 1 from both the
# left and right side of 1
# -------------------------------------------------------------------------------------------


#STEP1:  we assume values of x from 3 to 1.001 at an increment of -0.001
x_fromright  <- seq(from = 3, to = 1.0001,by = -0.0001)

# then we compute the corresponding value of the function f(x)
fx_atxfromright =    abs(2*(x_fromright^2 - x_fromright))/(x_fromright-1)




#STEP2:  we assume values of x from -1 to 0.99 at an increment of 0.001
x_fromleft  <- seq(from = -1, to = 0.9999, by = 0.0001)

# then we compute the corresponding value of the function f(x)
fx_atxfromleft =    abs(2*(x_fromleft^2-x_fromleft))/(x_fromleft-1)



# to compare results, we must arrange the values using a dataframe (table)
result <- data.frame(cbind(x_fromleft," ",fx_atxfromleft,x_fromright,"  ", fx_atxfromright))

colnames(result) <- c("x approaces 1 from left  "," ", "  Value of f", "  x approaches 1 from right", " ","  Value of f at x right")


# extract last 10 rows
x<- nrow(result)-10
y <- nrow(result)

(last15rows <- result[x:y,])

# at the bottom of the dataframe you will that as x approaches 1 from the left, f(x) approaches -1.99979999
# and as x approaches 1 from the right, f(x) approaches 2.00019999
# and we can therefore conclude that the limit f(x) as x approaches 1 does not exist
# as the two sided limits are not the same.



# -------------------------------------------------------------------------------------------
# Example 4: Back to computing correlations again
# This time we are dealing with many variables in different datasets
# We will be considering the built-in dataset in R which is mtcars


# load the dataset and get some informations
head(mtcars)       # display first 6 rows
tail(mtcars)       # display last 6 rows
dim(mtcars)
dim(mtcars)
names(mtcars)
summary(mtcars)
str(mtcars)        # all variables are numeric

# define subsets
Set1 <- mtcars[,1:5]
Set2 <- mtcars[,6:10]
cor(Set1,Set2)          # the problem with this output is that most people
# dont like to see correlations in that form
# and the result is not complete


# the only solution is to use for loops to solve for the correlation coefficients


# since we will be computing many correlation coefficients it is wise to
# define a generic correlation function whose task
# is to compute the correlation coefficient between any two input datasets


pairwiseCor <- function(depvar,indepvar){

  # depvar, indepvar and pairwiseCor are temporary variables.
  # you can choose any name that you want


  # establish counter to count how many pairs are possible
  counter =0
  for(i in 1:length(depvar)){
    for (j in 1:length(indepvar)){
      counter = counter +1
    }
  }

  # define holder of correlation results
  df <- data.frame(VarX =rep(0,counter), VarY=rep(0,counter),
                   AbsCor=rep(0,counter), Cor=rep(0,counter), PValue=rep(0,counter),
                   Assessment=rep(0,counter))


  # fill in the dataframe with details
  k=0
  for(i in 1:length(depvar)){
    for (j in 1:length(indepvar)){
      k=k+1
      df[k,1] <- names(depvar)[i]                                            # pick the first variable
      df[k,2] <- names(indepvar)[j]                                          # pickup the second variable
      df[k,3] <- round(abs(cor(depvar[,i],indepvar[,j])),2)                  # compute the absolute value of the correlation
      df[k,4] <- round(cor(depvar[,i],indepvar[,j]),2)                       # compute the correlation coefficient (pos or negative result)
      tt      <- cor.test(depvar[,i],indepvar[,j],method="spearman")         # defines the tt object to store other info like pvalue
      df[k,5] <- round(tt$p.value,2)                                         # pickup the p=value for test of significance
      df[k,6] <- ifelse((df[k,5] < 0.05), "<0.05 (sig)", "> 0.05 (not sig")  # determines if coefficient is significant or not
    }
  }
  return(df)                                                                 # returns the entire result as a dataframe
}


# And here is how to call the correlation function.
# We are going to pass the input sets Set1 and Set2
# Highlight correlation function blockk  and run it first
pairwiseCor(Set1,Set2)

# we can also process pairwise correlation for the following
Set1 = mtcars
Set2 = mtcars
pairwiseCor(Set1,Set2)
