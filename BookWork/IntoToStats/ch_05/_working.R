library(ISwR)

daily.intake <- c(5260, 5470, 5640, 6180, 6390, 6515,
	6805, 7515, 7515, 8230, 8770)

mean(daily.intake)

sd(daily.intake)

quantile(daily.intake)

# Assuming data comes from a normal distribution, does this distribution have a 
# mean u = 7725?

# 5.1 One sample t-test

t.test(daily.intake, mu = 7725)

# Output

" 
One Sample t - test # Type of test

data:daily.intake  # data being tested

t = -2.8208, df = 10, p - value = 0.01814 # t statistic, degrees of freedom, exact p value

alternative hypothesis:true mean is not equal to 7725 # test is not true

95 percent confidence interval: # Confidence interval, xhat - t0.975(f) * SEM < mean < xhat + t0.975(f) * SEM
 5986.348 7520.925

sample estimates: # true mean
	mean of x
	6753.636
"
# 5.2 Wilcoxon signed-rank test

wilcox.test(daily.intake, mu = 7725)

# Output

"Wilcoxon signed rank test with continuity correction

data:  daily.intake
V = 8, p-value = 0.0293
alternative hypothesis: true location is not equal to 7725"

# 5.3 Two sampled t-test

attach(energy)

energy

t.test(expend ~ stature)

"	Welch Two Sample t-test

data:  expend by stature
t = -3.8555, df = 15.919, p-value = 0.001411
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -3.459167 -1.004081
sample estimates:
 mean in group lean mean in group obese 
           8.066154           10.297778 "

# textbook t-test
t.test(expend ~ stature, var.equal = TRUE)

"Two Sample t-test

data:  expend by stature
t = -3.9456, df = 20, p-value = 0.000799
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -3.411451 -1.051796
sample estimates:
 mean in group lean mean in group obese 
           8.066154           10.297778 
"


# 5.4 Comparison of variances

var.test(expend ~ stature)

"F test to compare two variances

data:  expend by stature
F = 0.78445, num df = 12, denom df = 8, p-value = 0.6797
alternative hypothesis: true ratio of variances is not equal to 1
95 percent confidence interval:
 0.1867876 2.7547991
sample estimates:
ratio of variances 
          0.784446"

# 5.6 two-sample Wilcoxon test

wilcox.test(expend ~ stature)

# 5.6 Paired t test

attach(intake)

post - pre

t.test(pre, post, paired = TRUE)

t.test(pre, post) # WRONG

# 5.7 matched-pairs Wilcoxon test

wilcox.test( pre, post, paired = TRUE )