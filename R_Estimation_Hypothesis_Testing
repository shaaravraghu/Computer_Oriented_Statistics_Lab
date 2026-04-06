# ============================================================
#         POINT ESTIMATION — SYNTAX REFERENCE
# ============================================================

# --- DATA SETUP ---
x <- c(...)
n <- length(x)

# ============================================================
# MME & MLE — NORMAL DISTRIBUTION
# ============================================================

# MME of µ (= sample mean)
mu_mme <- mean(x)

# MME of σ² (= biased, divide by n)
sigma2_mme <- mean((x - mean(x))^2)

# MLE of µ (= sample mean, same as MME)
mu_mle <- mean(x)

# MLE of σ² (= biased, divide by n)
sigma2_mle <- mean((x - mean(x))^2)

# Unbiased estimator of σ² (divide by n-1)
sigma2_unbiased <- var(x)       # uses n-1

# Relationship:
# sigma2_mle = ((n-1)/n) * var(x)

# ============================================================
# MME & MLE — UNIFORM DISTRIBUTIONS
# ============================================================

# --- U(0, θ) ---
# MME: E[X] = θ/2  →  θ_mme = 2 * x̄
theta_mme <- 2 * mean(x)

# MLE: maximum order statistic
theta_mle <- max(x)

# --- U(a, b) ---
# MME: solve from E[X] = (a+b)/2, Var[X] = (b-a)²/12
x_bar <- mean(x)
s     <- sd(x)                  # sample sd (n-1)

a_mme <- x_bar - sqrt(3) * s
b_mme <- x_bar + sqrt(3) * s

# MLE:
a_mle <- min(x)
b_mle <- max(x)

# ============================================================
# BIAS
# ============================================================

# Bias = E(θ̂) - θ
# Normal µ̂ = x̄        → Bias = 0 (unbiased)
# Normal σ²_mle        → Bias = -σ²/n (biased)
# U(0,θ) theta_mle     → Bias = -θ/(n+1)  (biased)
# U(0,θ) theta_mme     → Bias = 0 (unbiased)
# U(a,b) MLE           → both biased

# ============================================================
# MSE
# ============================================================

# MSE = Bias² + Variance

# For µ̂ = x̄ (known σ²):
mse_mu <- sigma2_known / n

# For µ̂ = x̄ (unknown σ², use sample estimate):
mse_mu <- sigma2_mle / n        # or var(x)/n

# For σ²_mle (biased):
# MSE(σ²_mle) = (2n-1)/n² * σ⁴  ... theoretical
# In R, estimate using sigma2_mle directly:
mse_sigma2_mle <- (2 * n - 1) / n^2 * sigma2_mle^2

# For σ²_unbiased = S² (unbiased):
# MSE(S²) = 2σ⁴/(n-1)
mse_sigma2_unbiased <- 2 * sigma2_unbiased^2 / (n - 1)

# For U(0,θ) theta_mle:
# Bias = -θ/(n+1), Var = nθ²/((n+1)²(n+2))
# MSE  = 2θ²/((n+1)(n+2))  ... theoretical
mse_theta_mle <- 2 * theta_mle^2 / ((n + 1) * (n + 2))

# For U(0,θ) theta_mme:
# MSE = Var(2X̄) = 4*Var(X̄) = 4*(θ²/12)/n = θ²/(3n)
mse_theta_mme <- theta_mme^2 / (3 * n)

# ============================================================
# CONSISTENCY
# ============================================================

# An estimator is consistent if:
# 1. Bias → 0 as n → ∞
# 2. Variance → 0 as n → ∞
# Equivalently: MSE → 0 as n → ∞

# Simulate consistency (MSE shrinking with n):
ns  <- c(10, 50, 100, 500, 1000)
mse_vals <- sapply(ns, function(n) {
    sims <- replicate(2000, mean(rnorm(n, mean = 0, sd = 1)))
    mean((sims - 0)^2)
})
plot(ns, mse_vals, type = "o", pch = 16,
     main = "Consistency: MSE → 0 as n → ∞",
     xlab = "n", ylab = "MSE")

# ============================================================
# Z-TEST (known σ²)
# ============================================================

sigma2_known <- 0.25            # given known variance

z_stat  <- (mean(x) - mu_0) / sqrt(sigma2_known / n)
p_value <- 2 * (1 - pnorm(abs(z_stat)))   # two-sided

# Critical value
z_crit  <- qnorm(0.975)        # = 1.96 for α = 0.05 two-sided
z_crit_99 <- qnorm(0.995)      # = 2.576 for α = 0.01

# Decision
if (abs(z_stat) > z_crit) "Reject H0" else "Fail to Reject H0"

# One-sided (greater)
p_value_greater <- 1 - pnorm(z_stat)

# One-sided (less)
p_value_less    <- pnorm(z_stat)

# ============================================================
# T-TEST (unknown σ²)
# ============================================================

t_stat  <- (mean(x) - mu_0) / sqrt(var(x) / n)
p_value <- 2 * (1 - pt(abs(t_stat), df = n - 1))

t_crit  <- qt(0.975, df = n - 1)    # α = 0.05 two-sided

# Or use built-in:
t.test(x, mu = mu_0)

# ============================================================
# CONFIDENCE INTERVALS
# ============================================================

# 95% CI for µ — known σ² (Z-interval)
z_crit <- qnorm(0.975)
se     <- sqrt(sigma2_known / n)
ci_95  <- c(mean(x) - z_crit * se,
            mean(x) + z_crit * se)

# 99% CI for µ — known σ² (Z-interval)
z_crit99 <- qnorm(0.995)
ci_99    <- c(mean(x) - z_crit99 * se,
              mean(x) + z_crit99 * se)

# 95% CI for µ — unknown σ² (t-interval)
t_crit <- qt(0.975, df = n - 1)
se_t   <- sqrt(var(x) / n)
ci_t   <- c(mean(x) - t_crit * se_t,
            mean(x) + t_crit * se_t)

# 95% CI for θ — U(0,θ) using MLE (order statistic)
# Based on: P(X_(n) ≤ θ) = (X_(n)/θ)^n
# CI: [X_(n), X_(n) / (0.05)^(1/n)]  ... 95%
alpha  <- 0.05
ci_theta <- c(max(x), max(x) / (alpha/2)^(1/n))

# ============================================================
# USEFUL HELPER FUNCTIONS
# ============================================================

mean(x)           # sample mean
var(x)            # sample variance (n-1)
sd(x)             # sample sd (n-1)
median(x)         # sample median
max(x)            # maximum (MLE for U(0,θ) and U(a,b))
min(x)            # minimum (MLE for U(a,b))
length(x)         # sample size n

pnorm(q)          # P(Z ≤ q) for standard normal
qnorm(p)          # quantile of standard normal
pt(q, df)         # P(T ≤ q) for t-distribution
qt(p, df)         # quantile of t-distribution

t.test(x, mu = 0)                        # one-sample t-test
t.test(x, mu = 0, conf.level = 0.99)     # 99% CI
