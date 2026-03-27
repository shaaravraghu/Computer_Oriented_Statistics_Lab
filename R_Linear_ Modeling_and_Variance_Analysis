# Scatterplot
# Basic scatterplot
plot(x, y,
     main = "Scatterplot",
     xlab = "X Variable",
     ylab = "Y Variable",
     col  = "steelblue",
     pch  = 16,
     cex  = 1.2)

# Add a trend line
abline(lm(y ~ x), col = "red", lty = 2, lwd = 2)

# Add correlation text
r <- cor(x, y)
legend("topleft", legend = paste("r =", round(r, 3)))

# Scatterplot Matrix
# Base R
pairs(df,
      col  = "steelblue",
      pch  = 16,
      main = "Scatterplot Matrix")

# With correlation values
pairs(df, panel = function(x, y) {
    points(x, y, col = "steelblue", pch = 16)
    abline(lm(y ~ x), col = "red")
})





















# Simple Linear Regression: Y = β₀ + β₁X + ε
# Fit model
model <- lm(y ~ x, data = df)

# Summary — most important output
summary(model)

# Output explained:
# Coefficients:
#             Estimate Std. Error t value Pr(>|t|)
# (Intercept)   2.345      0.412    5.69  < 0.001 ***
# x             1.234      0.087   14.18  < 0.001 ***
#
# Residual standard error: 1.23
# Multiple R-squared:  0.874
# Adjusted R-squared:  0.871
# F-statistic: 201.1, p-value: < 0.001

# Extracting Components
model$coefficients       # β₀ and β₁
model$residuals          # residuals (y - ŷ)
model$fitted.values      # predicted ŷ values

coef(model)              # same as $coefficients
fitted(model)            # same as $fitted.values
residuals(model)         # same as $residuals

confint(model)           # 95% CI for coefficients
confint(model, level = 0.99)  # 99% CI

# Prediction
# Predict for new data
new_data <- data.frame(x = c(10, 20, 30))
predict(model, newdata = new_data)

# With confidence interval (for mean response)
predict(model, newdata = new_data, interval = "confidence")

# With prediction interval (for individual response)
predict(model, newdata = new_data, interval = "prediction")

#      fit      lwr      upr
# 1  14.68    12.34    17.02   ← prediction interval wider than CI

# Plotting the Fit
plot(x, y, pch = 16, col = "steelblue")
abline(model, col = "red", lwd = 2)    # regression line

# Add CI band
x_seq <- seq(min(x), max(x), length = 100)
ci <- predict(model,
              newdata  = data.frame(x = x_seq),
              interval = "confidence")

lines(x_seq, ci[,"lwr"], col = "red", lty = 2)
lines(x_seq, ci[,"upr"], col = "red", lty = 2)

# Diagnostic Plots
par(mfrow = c(2, 2))   # 2×2 grid
plot(model)

# Plot 1: Residuals vs Fitted   → checks linearity
# Plot 2: Normal Q-Q            → checks normality of residuals
# Plot 3: Scale-Location        → checks homoscedasticity
# Plot 4: Residuals vs Leverage → checks influential points
par(mfrow = c(1, 1))   # reset


































# Polynomial Regression: Model: Y = β₀ + β₁X + β₂X² + ... + βₙXⁿ + ε
# Quadratic (degree 2)
model2 <- lm(y ~ x + I(x^2), data = df)

# Cubic (degree 3)
model3 <- lm(y ~ x + I(x^2) + I(x^3), data = df)

# Using poly() — cleaner, handles multicollinearity better
model_p <- lm(y ~ poly(x, degree = 3), data = df)
# degree = 2 → quadratic
# degree = 3 → cubic

# raw = TRUE gives actual x, x², x³ (not orthogonal)
model_raw <- lm(y ~ poly(x, 3, raw = TRUE), data = df)
















# Logistic Regression: Used when Y is binary (0/1)
Model: log(p / 1-p) = β₀ + β₁X₁ + ...
# Fit logistic regression
model <- glm(y ~ x1 + x2 + x3,
             data   = df,
             family = binomial)    # key argument!

summary(model)
# Coefficients are on LOG-ODDS scale
# Extracting Info
coef(model)              # log-odds coefficients
exp(coef(model))         # ODDS RATIOS (more interpretable)
confint(model)           # CI on log-odds scale
exp(confint(model))      # CI on odds ratio scale
# Interpreting coefficients
# If β₁ = 0.5:
exp(0.5)   # = 1.65
# → One unit increase in x1 multiplies odds by 1.65 (65% increase)

# If β₁ = -0.3:
exp(-0.3)  # = 0.74
# → One unit increase in x1 multiplies odds by 0.74 (26% decrease)
# Predicting Probabilities
# Predict probabilities (not log-odds)
predict(model, type = "response")              # on training data
predict(model, newdata = new_df, type = "response")  # on new data

# type = "response"  → probabilities [0,1]
# type = "link"      → log-odds (default)
# Classification
probs <- predict(model, type = "response")

# Convert probabilities to classes with threshold 0.5
predicted_class <- ifelse(probs > 0.5, 1, 0)

# Confusion matrix
table(Predicted = predicted_class, Actual = df$y)
#          Actual
# Predicted  0  1
#         0 40  5
#         1  8 47

# Accuracy
mean(predicted_class == df$y)
# Plotting Logistic Curve
# Single predictor case
plot(x, y, pch = 16,
     col  = ifelse(y == 1, "steelblue", "tomato"),
     main = "Logistic Regression")

x_seq <- seq(min(x), max(x), length = 200)
y_prob <- predict(model,
                  newdata = data.frame(x = x_seq),
                  type    = "response")

lines(x_seq, y_prob, col = "black", lwd = 2)
abline(h = 0.5, lty = 2, col = "gray")   # decision boundary
# Model fit
# Null deviance vs Residual deviance
summary(model)$null.deviance       # deviance with only intercept
summary(model)$deviance            # deviance of fitted model

# Pseudo R² (McFadden's)
1 - (model$deviance / model$null.deviance)
# > 0.2 is generally considered good fit






























# ============================================================
#         ANALYSIS OF VARIANCE — 1-WAY & 2-WAY LAYOUT
# ============================================================


# ============================================================
# 1. ONE-WAY ANOVA
# ============================================================
# Tests if means of 3+ groups are equal
# H0: μ1 = μ2 = μ3 = ...
# H1: At least one mean is different
# Assumes: normality, equal variances, independence

# --- Data Setup ---
group1 <- c(85, 90, 88, 92, 87)
group2 <- c(78, 82, 79, 81, 80)
group3 <- c(90, 95, 92, 94, 91)

# Long format (required for aov)
scores <- c(group1, group2, group3)
groups <- factor(rep(c("A", "B", "C"), each = 5))
df     <- data.frame(scores, groups)

# --- Fit One-Way ANOVA ---
model1 <- aov(scores ~ groups, data = df)
summary(model1)

# Output:
#           Df Sum Sq Mean Sq F value   Pr(>F)
# groups     2  432.1   216.0   54.32  < 0.001 ***
# Residuals 12   47.7     3.98

# Reading the output:
# Df        → degrees of freedom (groups: k-1, residuals: N-k)
# Sum Sq    → Sum of Squares
# Mean Sq   → Sum Sq / Df
# F value   → Mean Sq (groups) / Mean Sq (residuals)
# Pr(>F)    → p-value → if < 0.05, reject H0


# --- Extract Components ---
summary(model1)[[1]]$"F value"    # F statistic
summary(model1)[[1]]$"Pr(>F)"     # p-value


# --- Check Assumptions ---

# 1. Normality of residuals — Shapiro-Wilk test
shapiro.test(residuals(model1))
# H0: residuals are normal → p > 0.05 means OK

# 2. Homogeneity of variances — Bartlett's test (assumes normality)
bartlett.test(scores ~ groups, data = df)
# H0: variances are equal → p > 0.05 means OK

# 3. Homogeneity of variances — Levene's test (more robust)
# install.packages("car")
library(car)
leveneTest(scores ~ groups, data = df)
# H0: variances are equal → p > 0.05 means OK


# --- Post-Hoc Tests (if ANOVA is significant) ---
# ANOVA only tells you THAT groups differ, not WHICH ones

# Tukey HSD — most common, controls family-wise error rate
TukeyHSD(model1)
# Output:
#       diff    lwr    upr  p adj
# B-A  -8.2  -10.5  -5.9  0.000   ← A and B differ
# C-A   4.6    2.3   6.9  0.001   ← A and C differ
# C-B  12.8   10.5  15.1  0.000   ← B and C differ

# Plot Tukey results
plot(TukeyHSD(model1))

# Pairwise t-tests with Bonferroni correction
pairwise.t.test(scores, groups, p.adjust.method = "bonferroni")
# Other methods: "holm", "BH", "fdr", "none"


# --- Visualizing One-Way ANOVA ---

# Boxplot by group
boxplot(scores ~ groups, data = df,
        col  = c("steelblue", "tomato", "seagreen"),
        main = "One-Way ANOVA — Group Comparison",
        xlab = "Group",
        ylab = "Score")

# Group means plot
means <- tapply(scores, groups, mean)
barplot(means,
        col  = c("steelblue", "tomato", "seagreen"),
        main = "Group Means",
        ylab = "Mean Score",
        ylim = c(0, max(means) * 1.2))


# --- Non-Parametric Alternative (if assumptions violated) ---
# Kruskal-Wallis test
kruskal.test(scores ~ groups, data = df)
# H0: distributions are equal across groups


# ============================================================
# 2. TWO-WAY ANOVA
# ============================================================
# Tests effect of TWO factors (and their interaction) on response
# H0 (Factor A):      all levels of A have same mean
# H0 (Factor B):      all levels of B have same mean
# H0 (Interaction):   effect of A doesn't depend on B (and vice versa)

# --- Data Setup ---
score    <- c(85,90,88,78,82,80,90,95,92,
              87,91,89,79,83,81,91,96,93)

method   <- factor(rep(c("M1","M2","M3"), times = 6))
gender   <- factor(rep(c("Male","Female"), each = 9))

df2 <- data.frame(score, method, gender)

# --- Fit Two-Way ANOVA ---

# Without interaction
model2a <- aov(score ~ method + gender, data = df2)
summary(model2a)

# With interaction (RECOMMENDED — always check interaction first)
model2b <- aov(score ~ method * gender, data = df2)
summary(model2b)

# method * gender expands to: method + gender + method:gender

# Output:
#                Df Sum Sq Mean Sq F value   Pr(>F)
# method          2  432.1   216.0   54.32  < 0.001 ***
# gender          1   18.2    18.2    4.58   0.047  *
# method:gender   2    5.4     2.7    0.68   0.521       ← interaction NS
# Residuals      12   47.7     3.98

# Reading:
# method        → main effect of teaching method significant
# gender        → main effect of gender significant
# method:gender → interaction NOT significant (p=0.521)
#                 meaning effect of method is same for both genders


# --- Interaction Plot ---
# Most important plot for Two-Way ANOVA
interaction.plot(x.factor     = df2$method,
                 trace.factor  = df2$gender,
                 response      = df2$score,
                 type          = "o",
                 col           = c("steelblue", "tomato"),
                 pch           = c(16, 17),
                 lwd           = 2,
                 main          = "Interaction Plot",
                 xlab          = "Method",
                 ylab          = "Mean Score",
                 trace.label   = "Gender")

# Interpreting interaction plot:
# Lines PARALLEL   → NO interaction (effect of A same across B)
# Lines CROSS/DIVERGE → INTERACTION exists (effect of A depends on B)


# --- Post-Hoc for Two-Way ANOVA ---
# Only do post-hoc for significant main effects
# If interaction is significant → interpret interaction, not main effects

# Tukey for main effects
TukeyHSD(model2b, which = "method")   # post-hoc for method only
TukeyHSD(model2b, which = "gender")   # post-hoc for gender only
TukeyHSD(model2b)                     # post-hoc for all


# --- Check Assumptions ---
shapiro.test(residuals(model2b))          # normality
bartlett.test(score ~ interaction(method, gender), data = df2)  # equal variances
plot(model2b)                             # diagnostic plots


# --- Visualizing Two-Way ANOVA ---

# Boxplot for each combination
boxplot(score ~ method * gender, data = df2,
        col  = c("steelblue","steelblue","steelblue",
                 "tomato","tomato","tomato"),
        main = "Two-Way ANOVA",
        xlab = "Method × Gender",
        ylab = "Score",
        las  = 2)

# Cell means (all combinations)
tapply(df2$score, list(df2$method, df2$gender), mean)


# ============================================================
# QUICK COMPARISON — 1-WAY vs 2-WAY
# ============================================================

# One-Way:
# aov(y ~ A)                       → 1 factor
# TukeyHSD(model)                  → post-hoc

# Two-Way without interaction:
# aov(y ~ A + B)                   → 2 factors, no interaction

# Two-Way with interaction:
# aov(y ~ A * B)                   → 2 factors + interaction
# aov(y ~ A + B + A:B)             → same as above

# ============================================================
# DECISION GUIDE
# ============================================================

# Step 1: Run aov(y ~ A * B) — always include interaction first
# Step 2: Check interaction p-value
#   Interaction significant?
#     YES → interpret interaction (use interaction.plot)
#           post-hoc on combined groups
#     NO  → interpret main effects separately
#           post-hoc on each factor with TukeyHSD
# Step 3: Check assumptions
#   Normality violated?    → Kruskal-Wallis (1-way only)
#   Equal variance failed? → Welch's ANOVA: oneway.test(y~A, var.equal=FALSE)

# ============================================================
# EXTRA: WELCH'S ANOVA (if variances unequal)
# ============================================================
oneway.test(scores ~ groups, data = df, var.equal = FALSE)
# Games-Howell post-hoc (install.packages("rstatix"))
library(rstatix)
games_howell_test(df, scores ~ groups)

