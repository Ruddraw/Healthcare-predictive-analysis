#goal: explore and model the relationships between 
      #various factors and insurance charges to 
      #understand which factors significantly influence 
      #insurance costs.

# Load the dataset from a CSV file
df = read.csv('insurance.csv', header = TRUE)

# Identify numeric columns in the dataframe
num_cols <- unlist(lapply(df, is.numeric))

# Plot scatterplots for all pairs of numeric columns
plot(df[, num_cols])

# Calculate and round the correlation matrix of numeric columns
round(cor(df[, num_cols]), 2)

# Convert 'smoker', 'sex', and 'region' columns to factors
smoker = as.factor(df$smoker)
sex = as.factor(df$sex)
region = as.factor(df$region)

# Create boxplots of charges by smoker status, sex, and region
boxplot(df$charges ~ smoker, main = 'Smoker')
boxplot(df$charges ~ sex, main = 'Sex')
boxplot(df$charges ~ region, main = 'Region')

# Fit a linear model to predict charges based on all other variables
model1 = lm(charges ~ ., data = df)

# Display the summary of the linear model
summary(model1)
