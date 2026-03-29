# VECTORS

# Vector of strings
fruits <- c("banana", "apple", "orange")
# Vector of numerical values
numbers <- c(1, 2, 3)
# Vector with numerical values in a sequence
numbers <- 1:10
# Vector with numerical decimals in a sequence
numbers1 <- 1.5:6.5
numbers1 # [1] 1.5 2.5 3.5 4.5 5.5 6.5
# Vector with numerical decimals in a sequence where the last element is not used
numbers2 <- 1.5:6.3
numbers2 # [1] 1.5 2.5 3.5 4.5 5.5
# Vector of logical values
log_values <- c(TRUE, FALSE, TRUE, FALSE)

# Vector Length
length(fruits)
# Vector Sorting
sort(numbers)
# Access the first item (banana)
fruits[1]
# Access the first and third item (banana and orange)
fruits[c(1, 3)]
# Access all items except for the first item
fruits[c(-1)]
# Change an item 
fruits[1] <- "pear"

# Repeating Vectors
repeat_each <- rep(c(1,2,3), each = 3)
repeat_times <- rep(c(1,2,3), times = 3)
repeat_indepent <- rep(c(1,2,3), times = c(5,2,1))

# Generating Sequenced Vectors
numbers <- 1:10
numbers <- seq(from = 0, to = 100, by = 20)












# LISTS

# Can take multiple data types
thislist <- list("apple", "banana", "cherry", 23L, 2.3)
# same method to access, update, and check length as vectors
# check if item exists
"apple" %in% thislist
# Append item
append(thislist, "orange")
append(thislist, "orange", after = 2)
# Remove item
thislist <- list("apple", "banana", "cherry")
newlist <- thislist[-1]
# Range through indices
(thislist)[2:5]
# Loop through a list
for (x in thislist) {
  print(x)
}
# Join two lists
list1 <- list("a", "b", "c")
list2 <- list(1,2,3)
list3 <- c(list1,list2)



























# MATRICES

# Create a matrix (gets filled top-bottom)
thismatrix <- matrix(c(1,2,3,4,5,6), nrow = 3, ncol = 2)
thismatrix <- matrix(c("apple", "banana", "cherry", "orange"), nrow = 2, ncol = 2)

# Access Element (row, column)
thismatrix[1, 2]
# Access Row
thismatrix[2, ]
# Access Column
thismatrix[, 2]
# Access Multiple Rows
thismatrix[c(1, 2), ]
# Access Multiple Columns
thismatrix[, c(1, 2)]

thismatrix <- matrix(c("apple", "banana", "cherry", "orange","grape", "pineapple", "pear", "melon", "fig"), nrow = 3, ncol = 3)
# Add column
newmatrix <- cbind(thismatrix, c("strawberry", "blueberry", "raspberry"))
# Add row
newmatrix <- rbind(thismatrix, c("strawberry", "blueberry", "raspberry"))

# Remove rows and columns (independently also)
# Remove the first row and the first column
thismatrix <- thismatrix[-c(1), -c(1)]

# Other features
"apple" %in% thismatrix
dim(thismatrix) # returns dimension
length(thismatrix)

# Loop through a matrix
for (rows in 1:nrow(thismatrix)) {
  for (columns in 1:ncol(thismatrix)) {
    print(thismatrix[rows, columns])
  }
}

# Combine 2 matrices
Matrix_Combined <- rbind(Matrix1, Matrix2)
Matrix_Combined <- cbind(Matrix1, Matrix2)








# ARRAY

# Unlike matrices, arrays can take dimensions more than 2
# Creating a sequence for an array
thisarray <- c(1:24)
# Creating a multi-dimensional array
multiarray <- array(thisarray, dim = c(4, 3, 2))
multiarray
# , , 1
#     [,1] [,2] [,3]
#[1,]    1    5    9
#[2,]    2    6   10
#[3,]    3    7   11
#[4,]    4    8   12
# , , 2
#     [,1] [,2] [,3]
#[1,]   13   17   21
#[2,]   14   18   22
#[3,]   15   19   23
#[4,]   16   20   24

# Accessing elements as usual
# Accessing whole row/ column/ matrix level
multiarray[c(1),,]
multiarray[,c(1),1]

# %in%, dim(), length() as usual

# loop
for(x in multiarray){
  print(x)
}


















# DATAFRAMES
# Create a data frame
df <- data.frame(
  Name = c("Alice", "Bob", "Charlie"),
  Age = c(25, 30, 35),
  Score = c(88.5, 92.0, 78.3),
  Passed = c(TRUE, TRUE, FALSE)
)

# Summary and structure
print(df)
summary(df)
str(df)

# Dimensions
nrow(df)       # number of rows
ncol(df)       # number of columns
dim(df)        # both dimensions
length(df)     # number of columns

# Access a column (returns a vector)
df$Name
df[["Age"]]
df[, "Score"]

# Access a row
df[1, ]

# Access a specific element (row, col)
df[2, 3]

# Access multiple rows
df[c(1, 2), ]

# Access multiple columns
df[, c("Name", "Age")]

# Add a new column
df$Grade <- c("B", "A", "C")

# Update a value
df[1, "Age"] <- 26

# Remove a column
df$Grade <- NULL

# Remove a row
df <- df[-2, ]

# Check if value exists in a column
"Alice" %in% df$Name

# Filter rows based on condition
df[df$Age > 25, ]
df[df$Passed == TRUE, ]

# Add a new row
new_row <- data.frame(Name = "Diana", Age = 28, Score = 95.0, Passed = TRUE)
df <- rbind(df, new_row)

# Combine two data frames (same columns)
df1 <- data.frame(Name = c("Alice"), Age = c(25))
df2 <- data.frame(Name = c("Bob"), Age = c(30))
df_combined <- rbind(df1, df2)

# Combine two data frames side by side (same rows)
df3 <- data.frame(Score = c(88.5, 92.0))
df_wide <- cbind(df1, df3)

# Loop through rows
for (i in 1:nrow(df)) {
  print(df[i, ])
}

# Loop through columns
for (col in names(df)) {
  print(df[[col]])









































































# FACTORS
# Factors are used for categorical data (stores unique levels)

# Create a factor
sizes <- factor(c("small", "medium", "large", "medium", "small"))
sizes
# [1] small  medium large  medium small
# Levels: large medium small

# Levels are auto-sorted alphabetically
levels(sizes)       # [1] "large"  "medium" "small"
nlevels(sizes)      # [1] 3
length(sizes)       # [1] 5

# Define levels manually (controls order)
sizes <- factor(c("small", "medium", "large", "medium", "small"),
                levels = c("small", "medium", "large"))
levels(sizes)       # [1] "small"  "medium" "large"

# Access elements like a vector
sizes[1]            # small
sizes[c(1, 3)]      # small large

# Update an element (must be an existing level)
sizes[1] <- "large"

# Check if value is in factor
"medium" %in% sizes

# Ordered factor (ranked categories)
rating <- factor(c("low", "high", "medium", "high"),
                 levels = c("low", "medium", "high"),
                 ordered = TRUE)
rating
# [1] low    high   medium high
# Levels: low < medium < high

# Comparison works on ordered factors
rating[1] < rating[2]   # TRUE (low < high)

# Table of frequency counts
table(sizes)
# sizes
# small  medium   large
#     1       2       2

# Loop through a factor
for (x in sizes) {
  print(x)
}

# Convert factor to character or numeric
as.character(sizes)
as.numeric(sizes)   # returns internal level codes (1, 2, 3...)

# Drop unused levels
sizes <- sizes[sizes != "large"]
sizes <- droplevels(sizes)










































# FUNCTION
# Defining a Function
function_name <- function(arguments) {
    # body
    return(value)   # optional — R returns last evaluated expression
}
# Default Arguments
greet <- function(name, greeting = "Hello") {
    paste(greeting, name)
}
# Multiple Return Values
stats <- function(x) {
    list(mean = mean(x),
         sd   = sd(x),
         n    = length(x))
}
# Variable Number of Arguments
my_sum <- function(...) {
    sum(...)
}
# Recursive Functions
factorial <- function(n) {
    if (n == 0) return(1)
    n * factorial(n - 1)
}
# Anonymous Functions
sapply(1:5, function(x) x^2)
