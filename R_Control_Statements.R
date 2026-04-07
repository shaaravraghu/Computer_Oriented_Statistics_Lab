# IF, ELSE IF, ELSE
if (b > a) {
  print("b is greater than a")
} else if (a == b) {
  print("a and b are equal")
} else {
  print("a is greater than b")
}

# NESTED IF
if (x > 10) {
  print("Above ten")
  if (x > 20) {
    print("and also above 20!")
  } else {
    print("but not above 20.")
  }
} else {
  print("below 10.")
}

# WHILE LOOPS
i <- 1
while (i < 6) {
  print(i)
  i <- i + 1
}

# break -> terminate loop
# next -> terminate iteration (same as continue statement)

# FOR LOOPS
for (x in 1:10) {
  print(x)
}
for (x in fruits) {
  print(x)
}

# NESTED LOOPS 
for (x in adj) {
  for (y in fruits) {
    print(paste(x, y))
  }
}

# REPEAT LOOPS
repeat{
  if(){
    break
  }
}


# Functions and call
my_function <- function() { # create a function with the name my_function
  print("Hello World!")
}
my_function() # call the function named my_function

# Parameters (no less/ no more can be added while calling with sequence maintained)
my_function <- function(fname) {
  paste(fname, "Griffin")
}
my_function("Peter")
my_function("Lois")
my_function("Stewie")

# Default Parameters
my_function <- function(country = "Norway") {
  paste("I am from", country)
}
my_function("Sweden")
my_function("India")
my_function() # will get the default value, which is Norway
my_function("USA")

# Return Values
my_function <- function(x) {
  return (5 * x)
}
print(my_function(3))
print(my_function(5))
print(my_function(9))

# Nested Functions (Call a function within another function)
Nested_function <- function(x, y) {
  a <- x + y
  return(a)
}
Nested_function(Nested_function(2,2), Nested_function(3,3))

# Nested Functions (Write a function within a function)
Outer_func <- function(x) {
  Inner_func <- function(y) {
    a <- x + y
    return(a)
  }
  return (Inner_func)
}
output <- Outer_func(3) # To call the Outer_func
output(5)
# You cannot directly call the function because the Inner_func has been defined (nested) inside the Outer_func. We need to call Outer_func first in order to call Inner_func as a second step. We need to create a new variable called output and give it a value, which is 3 here. We then print the output with the desired value of "y", which in this case is 5.

# Recursion
tri_recursion <- function(k) {
  if (k > 0) {
    result <- k + tri_recursion(k - 1)
    print(result)
  } else {
    result = 0
    return(result)
  }
}
tri_recursion(6)


# Local Variables override Global Variable
txt <- "global variable"
my_function <- function() {
  txt = "fantastic"
  paste("R is", txt)
}
my_function()
txt # print txt


# Global Assignment Operator <<-
txt <- "awesome"
my_function <- function() {
  txt <<- "fantastic"
  paste("R is", txt)
}
my_function()
paste("R is", txt)























# INTRINSIC LOOPS

# Replicate() - Repeat an expression 'N' times
# Roll a die 5 times
replicate(5, sample(1:6, 1))
# [1] 3 1 6 2 4
# Generate 3 vectors of 4 random numbers
replicate(3, rnorm(4))
#           [,1]       [,2]       [,3]
# [1,]  0.341  -1.203   0.872
# [2,] -0.512   0.774  -0.231
# [3,]  1.123  -0.445   0.609
# [4,] -0.788   1.012  -1.344

# apply() — Apply Function over Matrix Rows/ Columns
m <- matrix(c(1,2,3,4,5,6), nrow = 2)
#      [,1] [,2] [,3]
# [1,]    1    3    5
# [2,]    2    4    6
apply(m, 1, sum)   # row sums
# [1] 9 12
apply(m, 2, sum)   # column sums
# [1] 3 7 11
apply(m, 1, mean)  # row means
# [1] 3 4
apply(m, 2, max)   # column max
# [1] 2 4 6

# lapply() — Apply over a List, Always Returns a List
nums <- list(a = 1:4, b = 5:8, c = 9:12)
lapply(nums, mean)
# $a
# [1] 2.5
# $b
# [1] 6.5
# $c
# [1] 10.5
lapply(nums, function(x) x * 2)
# $a
# [1] 2 4 6 8
# $b
# [1] 10 12 14 16
# ...

# sapply() — Like lapply but Simplifies the Output
nums <- list(a = 1:4, b = 5:8, c = 9:12)
sapply(nums, mean)
#    a    b     c
#  2.5  6.5  10.5
# → Returns a NAMED VECTOR (simplified!)
sapply(nums, range)
#      a  b   c
# [1,] 1  5   9    ← min
# [2,] 4  8  12    ← max
# → Returns a MATRIX when result has length > 1
