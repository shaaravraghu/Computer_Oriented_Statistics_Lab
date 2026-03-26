# Prefix Conventions
r: random samples
d: density
p: probability
q: quantile

# Various Distributions

# Normal: Parameters (Location = mean, Scale = sd)
rnorm(n, mean = 0, sd = 1)

# Uniform: Parameters (min, max)
runif(n, min = 0, max = 1)

# Binomial: Parameters (size: no of trials per experiment, prob: probability of success per trial)
rbinom(n, size, prob)

# Poisson: Parameters (rate = lambda)
rpois(n, lambda)

# Exponential: Parameters (rate = 1/ mean)
rexp(n, rate = 1)

# Gamma: Parameters (shape, rate)
rgamma(n, shape, rate = 1)

# Beta: Parameters (shape1, shape2)
rbeta(n, shape1, shape2)

# Chi-Square: Parameters (df, ncp)
rchisq(n, df, ncp = 0)

# Student t
rt(n, df)

# F
rf(n, df1, df2)

# Geometric
rgeom(n, prob)

# Negative Binomial
rnbinom(n, size, prob)

# Log Normal
rlnorm(n, meanlog = 0, sdlog = 1)

# Cauchy
rcauchy(n, location = 0, scale = 1)
























############################################################
#UNIFORM(A,B)
############################################################

a <- 0
b <- 1
n <- 1000

x1 <- runif(n, a, b)
s <- seq(a, b, length=11)

par(mfrow=c(1,1))
hist(x1, col=5, probability=TRUE, breaks=s, main="UNIFORM(0,1)")
lines(s, dunif(s, a, b), col=2, lwd=2, lty=2)


############################
# NORMAL(mu, sigma)
############################

mu <- 0      # location
sigma <- 1   # scale
n <- 1000    # sample size

x1 <- rnorm(n, mu, sigma)                 # generate random sample
s <- seq(min(x1), max(x1), by = 0.05)     # define a sequence

par(mfrow = c(1,1))                       # divide the plotting area
hist(x1, probability = TRUE, breaks = 30,
     col = 8, main = "NORMAL(0,1)")       # histogram plot
lines(s, dnorm(s, mean = 0, sd = 1),
      col = 2, lwd = 3)                   # density curve



############################
# Chi-square distribution
############################

df <- 5      # degrees of freedom
n <- 1000    # sample size

x1 <- rchisq(n, df = df)                  # generate random sample
s <- seq(0, max(x1), length = 100)

par(mfrow = c(1,1))
hist(x1, probability = TRUE, breaks = 30,
     ylim = c(0, 0.3), main = "Chi-square Distribution")
lines(s, dchisq(s, df),
      col = "red", lwd = 2)



############################
# T-DISTRIBUTION
############################

df <- 4     # degrees of freedom
n <- 1000   # sample size

x1 <- rt(n, df = df)                       # generate random sample
s <- seq(min(x1), max(x1), length = 100)

par(mfrow = c(1,1))
hist(x1, probability = TRUE, breaks = 30,
     main = "T-DISTRIBUTION")

lines(s, dt(s, df),
      col = "red", lwd = 2)               # t density
lines(s, dnorm(s, 0, 1),
      col = "green", lwd = 3)             # normal density




############################
# Beta from uniform
############################

nn <- 10000     # sample size
a <- 3          # shape 1
b <- 7          # shape 2
m <- a + b - 1  # number of uniform samples

d <- numeric(nn)

for (i in 1:nn) {
  u <- runif(m, 0, 1)
  u_sort <- sort(u)
  d[i] <- u_sort[a]     # a-th order statistic
}

hist(d, probability = TRUE, breaks = 30,
     main = "rth Order Statistic")

s <- seq(0, 1, length = 100)
lines(s, dbeta(s, a, b),
      col = "red", lwd = 2)




##############################################
# NORMAL(mu, sigma) Comparing robustness
# of mean and median
##############################################

mu <- 0
sigma <- 1

ss <- 1000   # number of iterations
n <- 1001    # observations per iteration

dmedian <- numeric(ss)
dmean   <- numeric(ss)

for (i in 1:ss) {
  x1 <- rnorm(n, mu, sigma)
  
  # add outliers
  x1[1:10] <- x1[1:10] + rnorm(10, 3, 0.1)
  
  x1sort <- sort(x1)
  
  dmedian[i] <- x1sort[501]
  dmean[i]   <- mean(x1)
}

par(mfrow = c(2,1))
hist(dmedian, breaks = 30, probability = TRUE,
     main = "Distribution of Median")
hist(dmean, breaks = 30, probability = TRUE,
     main = "Distribution of Mean")
