# matrix()
A <- matrix(c(1,2,3,4,5,6), nrow = 2, ncol = 3, byrow = TRUE)
#      [,1] [,2] [,3]
# [1,]    1    2    3
# [2,]    4    5    6

# byrow = TRUE  → fills row by row
# byrow = FALSE → fills column by column (default)

# Identity matrix
diag(3)
#      [,1] [,2] [,3]
# [1,]    1    0    0
# [2,]    0    1    0
# [3,]    0    0    1

# Diagonal matrix from vector
diag(c(2, 4, 6))
#      [,1] [,2] [,3]
# [1,]    2    0    0
# [2,]    0    4    0
# [3,]    0    0    6

# Zero matrix
matrix(0, nrow = 3, ncol = 3)

A <- matrix(1:4, nrow = 2)
B <- matrix(5:8, nrow = 2)

cbind(A, B)   # combine column-wise (side by side)
#      [,1] [,2] [,3] [,4]
# [1,]    1    3    5    7
# [2,]    2    4    6    8

rbind(A, B)   # combine row-wise (stack)
#      [,1] [,2]
# [1,]    1    3
# [2,]    2    4
# [3,]    5    7
# [4,]    6    8

A <- matrix(1:12, nrow = 3)

nrow(A)       # 3 — number of rows
ncol(A)       # 4 — number of columns
dim(A)        # c(3, 4)
length(A)     # 12 — total elements

A <- matrix(1:9, nrow = 3, byrow = TRUE)
#      [,1] [,2] [,3]
# [1,]    1    2    3
# [2,]    4    5    6
# [3,]    7    8    9

A[2, 3]      # element at row 2, col 3 → 6
A[1, ]       # entire row 1 → 1 2 3
A[, 2]       # entire col 2 → 2 5 8
A[1:2, 2:3]  # submatrix rows 1-2, cols 2-3

A <- matrix(c(1,2,3,4), nrow = 2)
B <- matrix(c(5,6,7,8), nrow = 2)

A + B        # element-wise addition
A - B        # element-wise subtraction
A * B        # element-wise multiplication (NOT matrix multiply)
A / B        # element-wise division
A ^ 2        # element-wise square
2 * A        # scalar multiplication

A <- matrix(c(1,2,3,4), nrow = 2)   # 2×2
B <- matrix(c(5,6,7,8), nrow = 2)   # 2×2

A %*% B      # TRUE matrix multiplication
#      [,1] [,2]
# [1,]   19   43
# [2,]   22   50

# Vector dot product
x <- c(1, 2, 3)
y <- c(4, 5, 6)
x %*% y      # 1×4 + 2×5 + 3×6 = 32

A <- matrix(c(1,2,3,4,5,6), nrow = 2)
#      [,1] [,2] [,3]
# [1,]    1    3    5
# [2,]    2    4    6

t(A)
#      [,1] [,2]
# [1,]    1    2
# [2,]    3    4
# [3,]    5    6

A <- matrix(c(1,2,3,4), nrow = 2)

det(A)
# 1×4 - 2×3 = -2

A <- matrix(c(1,2,3,4), nrow = 2)

solve(A)        # A⁻¹
#      [,1] [,2]
# [1,]   -2  1.5
# [2,]    1 -0.5

# Verify: A %*% solve(A) should give identity
round(A %*% solve(A))
#      [,1] [,2]
# [1,]    1    0
# [2,]    0    1

A <- matrix(c(2,1,1,3), nrow = 2)
b <- c(5, 10)

x <- solve(A, b)
# x = [1, 3]

# Verify:
A %*% x   # should equal b

A <- matrix(c(1,2,3,4,5,6,7,8,9), nrow = 3)

diag(A)       # extract diagonal → c(1, 5, 9)

diag(3)       # create 3×3 identity matrix

diag(c(2,4,6))  # create diagonal matrix from vector

A <- matrix(c(1,2,3,4,5,6,7,8,9), nrow = 3)

sum(diag(A))   # trace = 1 + 5 + 9 = 15

A <- matrix(c(1,2,3,2,4,6,1,0,1), nrow = 3)

qr(A)$rank    # rank of matrix A
# 2  (row 2 is a multiple of row 1 → linearly dependent)

A <- matrix(c(4,2,1,3), nrow = 2)

e <- eigen(A)

e$values      # eigenvalues
# [1] 5 2

e$vectors     # eigenvectors (columns)
#           [,1]       [,2]
# [1,]  0.7071  -0.4472
# [2,]  0.7071   0.8944

# Verify: A %*% v = λ × v
A %*% e$vectors[,1]               # Av₁
e$values[1] * e$vectors[,1]       # λ₁v₁
# both should be equal

A <- matrix(c(1,2,3,4,5,6), nrow = 2)

s <- svd(A)

s$d    # singular values (diagonal of D)
s$u    # left singular vectors  (U)
s$v    # right singular vectors (V)

# Reconstruct A:
s$u %*% diag(s$d) %*% t(s$v)
