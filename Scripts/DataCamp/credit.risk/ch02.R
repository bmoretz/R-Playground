RPROJ <- list(HOME = normalizePath(getwd()), DATA = normalizePath("DataCamp\\credit.risk\\data\\"))

loan.data.file <- paste0(RPROJ$DATA, "loan_data_ch2.rds")
loan_data <- readRDS(loan.data.file)

# Set seed of 567
set.seed(567)

# Store row numbers for training set: index_train
index_train <- sample(1:nrow(loan_data), 2 / 3 * nrow(loan_data))

# Create training set: training_set
training_set <- loan_data[index_train,]

# Build a glm model with variable ir_cat as a predictor
log_model_cat <- glm( loan_status ~ ir_cat, family = "binomial", data = training_set )

# Print the parameter estimates 
print(log_model_cat)

# Look at the different categories in ir_cat using table()
table(loan_data$ir_cat)

log_model_cat$coefficients

# Build the logistic regression model
log_model_multi <- glm(loan_status ~ age + ir_cat + grade + loan_amnt + annual_inc, family = "binomial", data = training_set)

# Obtain significance levels using summary()
summary(log_model_multi)

# Build the logistic regression model
predictions_all_small <- predict(log_model_small, newdata = test_set, type = "response")

# Look at the range of the object "predictions_all_small"
range(predictions_all_small)

# Change the code below to construct a logistic regression model using all available predictors in the data set
log_model_small <- glm(loan_status ~ ., family = "binomial", data = training_set)

# Make PD-predictions for all test set elements using the the full logistic regression model
predictions_all_full <- predict(log_model_small, newdata = test_set, type = "response")

# Look at the predictions range
range(predictions_all_full)

# The code for the logistic regression model and the predictions is given below
log_model_full <- glm(loan_status ~ ., family = "binomial", data = training_set)
predictions_all_full <- predict(log_model_full, newdata = test_set, type = "response")

# Make a binary predictions-vector using a cut-off of 15%
pred_cutoff_15 <- ifelse(predictions_all_full > 0.15, 1, 0)

# Construct a confusion matrix
table(test_set$loan_status, pred_cutoff_15)