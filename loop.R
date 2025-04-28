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
## using a single for loop and with other logical flow controls
## like the if condition, the ifelse condition which can help you
## build your logic when you perform a repetitive task


## This module includes the following
## various examples of how to formulate or solve common problems
## using Single for loop

## Some logical flow controls are also illustrated within the loop
## if ... else ..controls
## single condition within if controls
## multiple conditions within if controls
# ---------------------------------------------



# ------------------------------------------------------------------
# Single for loop
# Objective is to repeat the process for several times
# The number of output depends on the starting value and the ending value
# You must highlight thw whole for loop block to run the next examples
# Various logic of the single for loop are given
# So it is up really on your side to understand each style of looping
# using the R programming language
# -------------------------------------------------------------------


# The examples are given with an increasing degree of complication
# Of course the degree of complication depends on how easy or hard the problem is
# kaya basa(4x)  and think what the logic is telling you.



# Example 1: This example will print the line I hate you for 3 times
for (i in 1:3) {
  print("I hate you")
}



# Example 2: This example will print the line I hate you for 4 times
for (i in 4:7) {
  print("I hate you")
}



# Examole 3: This example will print the line I hate you for 100 times
lim = 1000
for (i in 1:lim) {
  print("I hate you")
}
# Imagine yourself writing down the sentence "I hate you." for 1000 times.



# Example 4: This example will print the line I hate you for 1000 times
lim = 1000
for (i in 1:lim) {
  print(paste0(i,". ","I hate you"))
}
# new R command illustrated to connect the index and the sentence



# Example 5: This example will print the line I hate you for 1000 times
lim = 1000
for (i in 1:lim) {
  print(noquote(paste0(i,". ","I hate you")))
}
# i want clean output



# Example 6: This example will count the number of times the task is repeated
counter = 0
lim = 1000

for (i in 351:lim) {
  counter = counter + 1   # increment the counter for each i
}
print(noquote(paste0("The value of counter variable is ", counter, ".")))




# Example 7: This example will display and count the number of lines
startval  = 1000
endval = 3000
counter = 0
txtline = "I like you now."

for (i in startval:endval) {
  counter = counter + 1
  print(noquote(paste0(counter,". ",txtline)))
}
print(noquote(paste0("There are ", counter, " lines generated.")))




# Example 8: This example will display and count the number of lines

startval  = 1000
endval = 3000
counter = 0
txtline = "I like you now."

for (i in startval:endval) {
  counter = counter + 1
  print(noquote(paste0(counter,". ",txtline)))
}
print(noquote(paste0("There are ", counter, " lines generated.")))




# Example 9: This example will display and count the number of lines
# until a pre defined limit is reached
# This means you can terminate the looping process


startval  = 1000
endval = 3000
counter = 0
txtline = "I like you now."
stop = 64


for (i in startval:endval) {
  counter = counter + 1
  print(noquote(paste0(counter,". ",txtline)))

  if (counter == stop) break  ## break means stop or exit the loop

}
print(noquote(paste0("There are ", counter, " lines generated.")))



# Example 10: This example will display and count the number of lines
# until a pre defined limit is reached
# This means you can terminate the looping process
# with the added condition that we display only the line if the
# value of the index is even

# Recall:  A number is even if it is divisible by 2, meaning if the remainder is 0
# when that number is divided by 2

startval  = 1000
endval = 3000
counter = 0
txtline = "I like you now."
stop = 64


for (Age in startval:endval){

  # test if Age is an even number
  if((Age %% 2) == 0) {
    counter = counter + 1
    print(noquote(paste0(counter,". ",txtline)))
    if (counter == stop) break  ## break means stop or exit the loop
  }
}
print(noquote(paste0("There are ", counter, " lines generated.")))
# The output is similar to the previous block.



# Example 11: This example will display and count the number of lines
# until a pre defined limit is reached
# This means you can terminate the looping process
# with the added condition that we display only the line if the
# value of the index is even

# Recall:  A number is even if it is divisible by 2, meaning if the remainder is 0
# when that number is divided by 2

startval  = 1000
endval = 3000
counter = 0
txtline = "I like you now."
stop = 64

for (Age in startval:endval){

  if((Age %% 2) == 0) {
    counter = counter + 1
    print(noquote(paste0(counter,") ",Age,". ",txtline)))
    if (counter == stop) break  ## break means stop or exit the loop
  }
}
print(noquote(paste0("There are ", counter, " lines generated.")))
# Did you see the sequence of even numbers.





# Example 12: Using arrays and count occurrence of values
# We will use the alphabet in small and capital letters


(small <- letters)
(CAPS <- LETTERS)
sentence <- "The Quick Brown fox jumps Over the Lazy dog"

startval  = 1
endval = nchar(sentence)   # get the number of characters


# setup counters
count_CAP_vowels = 0
count_CAP_consonants = 0

count_small_vowels = 0
count_small_consonants = 0

Capitals = 0
smalls = 0
spaces = 0

CAPvowels <- c("A","E","I","O","U")
smallvowels <- c("a","e","i","o","u")



for (i in startval:endval){

  # extract one letter at a time from the sentence
  # "The Quick Brown fox jumps Over the Lazy dog"
  dat <- substring(sentence,i,i)     # for i=1, dat ="T"; for i=2, dat = "h" ...


  # check first if a blank space or not was extracted
  if (dat == " "){
    spaces = spaces + 1

  } else {   # meaning it is not a blank space

    # determine if small letter or capital letter
    CAPtrue <- ifelse(dat %in% CAPS,TRUE,FALSE)

    if (CAPtrue == TRUE){

      # increase counter for occurence of capital letter
      Capitals = Capitals + 1

      # determine if vowel or not
      CAPvowelsTF <- ifelse(dat %in% CAPvowels,TRUE,FALSE)

      if (CAPvowelsTF == TRUE) {
        count_CAP_vowels = count_CAP_vowels + 1

      } else {
        count_CAP_consonants = count_CAP_consonants + 1
      }

    } else {    # meaning dat = small letter

      smalls = smalls + 1

      # determine if vowel or not
      smallvowelsTF <- ifelse(dat %in% smallvowels,TRUE,FALSE)

      if (smallvowelsTF == TRUE) {
        count_small_vowels = count_small_vowels + 1

      } else {
        count_small_consonants = count_small_consonants + 1
      }
    }
  }
}

# display counters
spaces
count_small_vowels
count_small_consonants
count_CAP_vowels
count_CAP_consonants
sentence


# compare total counts
spaces + count_small_vowels +count_small_consonants +count_CAP_vowels +count_CAP_consonants
nchar(sentence)




# Example 13: How to compute the sum of a sequence of numbers
# what is the sum of the first 10000 integers?
# What is the sum of terms 1/2 + 1/4 + 1/8 + 1/16 + 1/32 +....
# what is the sum of terms 1/2 + 1/3 + 1/4 + 1/5 + 1/6 + ...

# solution
# You have to declare a variable and then you have to accumulate the value of that variable

N = 10000
sum1 = 0
sum2 = 0
sum3 = 0


for (i in 1:N){
  sum1 = sum1 + i            # this will handle question number 1
  sum2 = sum2 + (1/2)^i      # this will handle question number 2
  sum3 = sum3 + 1/i          # this will handle question number 3
}
# show results
sum1
sum2
sum3




# Example 14: How to compute the sum of a sequence of numbers
# what is the sum of the first N integers?
# What is the sum of terms 1/2 + 1/4 + 1/8 + 1/16 + 1/32 +....
# what is the sum of terms 1/2 + 1/3 + 1/4 + 1/5 + 1/6 + ...


# where N is a numeric array?
N <- c(10000, 20000, 30000, 40000, 50000, 60000, 70000, 80000, 90000, 100000)
# The solution of this problem cannot be solved anymore using a single loop
# That is why we have to elevate our logic using a double for loop
# We will go back to this problem later



# Example 15: Computation of the correlation coefficient between two variables

# Consider the following two numeric vectors. We would like to plot them together and also
# compute what it is the correlation coefficient


datax <- c(0.9913345,1.0027839,0.9968691,1.0161024,1.0065136,1.0297600,0.9659482,1.0185862,
           1.0097508,1.0202250,1.0238810,0.9801332,1.0099076,0.9817378,0.9963364,1.0219328,
           1.0059981,0.9722559,0.9926882,1.0267477,0.9945208,1.0177237,0.9808133,1.0143415,
           1.0074551,1.0002456,0.9937849,1.0453198,0.9826864,1.0082201)

datay <- c(0.9964580,1.0181583,0.9895960,1.0176893,1.0009406,1.0226642,0.9558703,1.0111873,1.0158226,1.0187873,
           1.0230155,0.9670798,1.0056325,0.9734213,1.0020038,1.0126897,1.0032060,0.9783406,0.9948068,1.0246172,
           0.9939589,1.0168364,0.9806948,1.0168963,1.0137382,0.9938570,0.9844847,1.0487818,0.9784052,1.0037628 )

plot(datax,datay)
# From the plot you can conclude that there is a positive upward
# linear relationship between the two vectors
# Positive linear rekationship since small values of X matches with small values of Y
# and large values of X matches with large values of Y

# load some graphic files
# you have to rename the path direction in your laptop

# Please see the formula for the correlation
# coefficient as found in the Word file

# we are going to solve for 7 quantities
# sumx = sum of all x values
# sumy = sum of all y values
# sumxy = sum of the product of x and y
# sumxsquare = sum of the square of each x value
# sumysquare = sum of the square of each y value
# squaresumx  = square of the sum of x values
# squaresumy  = square of the sum of y values
# the numerator
# the denominator
# and the finally the correlation coefficient r


# This is the single loop solution

# initialize the summation variables
sumx = 0
sumy = 0
sumxy = 0
sumxsquare = 0
sumysquare = 0
squaresumx  = 0
squaresumy  = 0

xlen = length(datax)

for (i in 1:xlen){
  sumx <- sumx + datax[i]
  sumy <- sumy + datay[i]
  sumxy <- sumxy + datax[i]*datay[i]
  sumxsquare <- sumxsquare + datax[i]*datax[i]
  sumysquare <- sumysquare + datay[i]*datay[i]
}

# the next two should be outside of the loop
# sumx and sumy must be computed first
squaresumx <- sumx^2
squaresumy <- sumy^2


# solve the numerator
nume <- xlen * sumxy - sumx * sumy

# solve the denominator
num2a <- xlen * sumxsquare - squaresumx
num2b <- xlen * sumysquare - squaresumy
deno <- sqrt(num2a*num2b)
Pearsonr <- nume/deno

# Display values
sumx
sumy
sumxy
sumxsquare
sumysquare
squaresumx
squaresumy

# display numerator,denominator and Pearsons r
nume
deno
Pearsonr

# the degree of relationship is defined as 100*r^2
(Degree_relnship <- 100*Pearsonr^2)

