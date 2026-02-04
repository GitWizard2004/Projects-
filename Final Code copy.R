#-------------------------------------------------------------------------------
# Installing Required Packages
#-------------------------------------------------------------------------------

install.packages("readxl")
install.packages("dplyr")
install.packages("arules")
install.packages("arulesViz")
install.packages("factoextra")
install.packages("cluster")
install.packages("rpart")
install.packages("caret")
install.packages("neuralnet")
install.packages("pROC")

#-------------------------------------------------------------------------------
# Association Rules
#-------------------------------------------------------------------------------

# Step 1: Load Required Libraries
library(readxl)
library(dplyr)
library(arules)
library(arulesViz)

# Step 2: Import Dataset
data <- read_excel('/Users/vishwa/Library/CloudStorage/OneDrive-TheUniversityofTexasatDallas/Semester 1/R Business Analytics (prof.Zhang)/Project/project data/Ecommerce Counterfeit Transactions.xlsx')


# Step 3: Data Cleaning & Preparation
# Keep only logical (TRUE/FALSE) variables
data_logical <- data %>%
  select_if(is.logical)

# Convert logicals to factors (required by arules)
data_logical <- data_logical %>%
  mutate(across(everything(), as.factor))
data_logical<-data_logical[,-c(1)]


# Step 4: Convert to Transactions
transactions <- as(data_logical, "transactions")

summary(transactions)
itemFrequencyPlot(
  transactions, 
  topN = 10, 
  type = "absolute", 
  main = "Top 10 Frequent Logical Attributes"
)


# ⚙️ Step 5: Run Apriori Algorithm

rules <- apriori(
  transactions,
  parameter = list(supp = 0.01, conf = 0.6, target = "rules",minlen=2)
)

inspect(rules)


# Step 6: Focus on Counterfeit-Related Rules

rules_counterfeit <- subset(rules, rhs %in% "involves_counterfeit=TRUE")
rules_counterfeit <- sort(rules_counterfeit, by = "lift", decreasing = TRUE)

inspect(head(rules_counterfeit, 10))
inspect(rules_counterfeit)

# Step 7: Visualization

plot(rules_counterfeit, method = "graph", engine = "htmlwidget")
plot(rules_counterfeit, method = "grouped")
plot(rules_counterfeit, measure = c("support", "lift"), shading = "confidence")


# Step 8: Export Rules

write(rules_counterfeit, file = "counterfeit_rules_logical.csv", sep = ",", quote = TRUE, row.names = FALSE)


# Step 9: Summary

cat("Number of Rules Generated:", length(rules), "\n")
cat("Number of Counterfeit Rules:", length(rules_counterfeit), "\n")

#-------------------------------------------------------------------------------
# Clustering by Country
#-------------------------------------------------------------------------------

# Load the package
library(dplyr)
library(factoextra)
library(cluster)

# Prepare data for clustering
data_for_cluster <- data %>%
  select(customer_location,customer_age,customer_history_orders,involves_counterfeit)

data_for_cluster <- data_for_cluster %>%
  mutate(across(where(is.logical), as.numeric))

# Aggregate numeric variables by country (first column)
data_country_avg <- data_for_cluster %>%
  group_by(customer_location) %>%      # replace with your actual column name
  summarise(across(where(is.numeric), mean, na.rm = TRUE))

# Convert back to data frame
data_country_avg <- as.data.frame(data_country_avg)

# Set row names to country
row.names(data_country_avg) <- data_country_avg[, 1]
data_country_avg <- data_country_avg[, -1]
data_country_avg1 <- data_country_avg %>% select(-involves_counterfeit)

# Determine optimal number of clusters
set.seed(123)
fviz_nbclust(data_country_avg1, kmeans, method = "wss",k.max=9)        # Elbow method
fviz_nbclust(data_country_avg1, kmeans, method = "silhouette",k.max=9) # Silhouette method

set.seed(123)
kmeans_model <- kmeans(data_country_avg1, centers = 2, nstart = 25)

# Add cluster labels back to data
data_country_avg1$Cluster <- kmeans_model$cluster
data_country_avg$Cluster <- kmeans_model$cluster

# Inspect cluster-wise averages
cluster_summary <- aggregate(. ~ Cluster, data = data_country_avg1, mean)
print(cluster_summary)

# Evaluate internal cluster quality
sil <- silhouette(kmeans_model$cluster, dist(data_country_avg1))
summary(sil)

# Visualize clusters
fviz_cluster(kmeans_model, data = data_country_avg1, geom = "point", ellipse.type = "convex") +
  labs(title = "K-means Clustering on Ecommerce Data")

counterfeit_rate <- data_country_avg %>%
  group_by(Cluster) %>%
  summarise(
    Total_Countries = n(),
    Avg_CounterfeitRate = round(mean(involves_counterfeit, na.rm = TRUE) * 100, 2)
  )

print(counterfeit_rate)

kmeans_model

#-------------------------------------------------------------------------------
# Clustering by Customer Demographics
#-------------------------------------------------------------------------------

# Load the package
library(readxl)
library(dplyr)
library(factoextra)
library(cluster)

#Selecting only the numeric columns
data1_numeric <- data %>%
  select_if(is.numeric)

#Removing unwanted columns
data1<- data[,-c(1:3)]

# Convert logical variables to numeric 
data1 <- data1 %>%
  mutate(across(where(is.logical), as.numeric))

# Identify character variables
char_vars <- names(data1)[sapply(data1, is.character)]

# Create list to store mappings 
mappings_list <- list()

# Convert each character variable 
for (var in char_vars) {
  
  # Replace missing or blank values
  data1[[var]][is.na(data1[[var]]) | trimws(data1[[var]]) == ""] <- "Unknown"
  
  # Convert to factor
  data1[[var]] <- as.factor(data1[[var]])
  
  # Save mapping (factor levels → numeric codes)
  mappings_list[[var]] <- data.frame(
    code = seq_along(levels(data1[[var]])),
    category = levels(data1[[var]]),
    stringsAsFactors = FALSE
  )
  
  # Convert factor to numeric
  data1[[var]] <- as.numeric(data1[[var]])
}

#Display all mappings
mappings_list

# Remove rows with missing values
data1 <- na.omit(data1)

# If you have a pre-selected numeric subset
if (exists("data1_numeric")) {
  data1_numeric <- na.omit(data1_numeric)
}

# Prepare data1 for clustering
data1_for_cluster <- data1 %>%
  select(customer_location,customer_age,customer_history_orders)   

# Determine optimal number of clusters
set.seed(123)
fviz_nbclust(data1_for_cluster, kmeans, method = "wss")        # Elbow method
fviz_nbclust(data1_for_cluster, kmeans, method = "silhouette") # Silhouette method

# Run K-means clustering (choose k, e.g., 3)
set.seed(123)
kmeans_model1 <- kmeans(data1_for_cluster, centers = 3, nstart = 25)

# Add cluster labels back to data1
data1$Cluster <- kmeans_model1$cluster
data1_for_cluster$Cluster <- kmeans_model1$cluster

# Inspect cluster-wise averages
cluster_summary <- aggregate(. ~ Cluster, data = data1_for_cluster, mean)
print(cluster_summary)

# Evaluate internal cluster quality
sil <- silhouette(kmeans_model1$cluster, dist(data1_for_cluster))
summary(sil)

# Visualize clusters
fviz_cluster(kmeans_model1, data = data1_for_cluster, geom = "point", ellipse.type = "convex") +
  labs(title = "K-means Clustering on Ecommerce data1")

# 10: External evaluation using involves_counterfeit
# Cross-tab of clusters vs counterfeit label
table(data1$Cluster, data1$involves_counterfeit)

# 11: Compute counterfeit proportion per cluster
counterfeit_rate1 <- data1 %>%
  group_by(Cluster) %>%
  summarise(
    Total = n(),
    Counterfeit = sum(involves_counterfeit == 1, na.rm = TRUE),
    CounterfeitRate = round((Counterfeit / Total) * 100, 2)
  )

print(counterfeit_rate1)

kmeans_model1

#-------------------------------------------------------------------------------
# Random Sampling of Dataset
#-------------------------------------------------------------------------------

set.seed(123)

# Your original data
data_orig <- data

# Count current TRUE/FALSE
current_true  <- sum(data_orig$involves_counterfeit == TRUE)
current_false <- sum(data_orig$involves_counterfeit == FALSE)
total_orig    <- nrow(data_orig)

# Desired final proportions
p_true  <- 0.40
p_false <- 0.60

# Solve final total size X required to satisfy ratio
X <- max(
  current_true  / p_true,
  current_false / p_false
)

X <- ceiling(X)  # final dataset size required

# How many new rows to add
add_total <- X - total_orig

add_true  <- round(X * p_true  - current_true)
add_false <- round(X * p_false - current_false)

# Split TRUE/FALSE data
data_true  <- data[data$involves_counterfeit == TRUE, ]
data_false <- data[data$involves_counterfeit == FALSE, ]

# Sample with replacement
sample_true  <- data_true[sample(nrow(data_true),  add_true,  replace = TRUE), ]
sample_false <- data_false[sample(nrow(data_false), add_false, replace = TRUE), ]

# Final dataset
data_sampled <- rbind(data_orig, sample_true, sample_false)

# Check size + ratio
nrow(data_sampled)
prop.table(table(data_sampled$involves_counterfeit))

#-------------------------------------------------------------------------------
# Decision Tree
#-------------------------------------------------------------------------------

# Load the package
library(readxl)
library(dplyr)
library(rpart)
library(rpart.plot)
library(caret)

Decision_data <- data_sampled
Decision_data<- Decision_data[, -c(1,2,3)]  

#Splitting the data as train and test
set.seed(1)  
train.index <- sample(c(1:dim(Decision_data)[1]), dim(Decision_data)[1]*0.7)  
train.df <- Decision_data[train.index, ]
valid.df <- Decision_data[-train.index, ]

#Decision tree
tree <- rpart(involves_counterfeit ~ payment_method + discount_applied+device_fingerprint_new +
                customer_location  + geolocation_mismatch + velocity_flag+discount_percentage + refund_requested,
              data = train.df,
              method = "class")
#plot
rpart.plot(
  tree,
  type = 4,
  extra = 104,
  fallen.leaves = TRUE,
  cex = 1.15,      # shrink text
  tweak = 0.5,    # slightly smaller boxes
  gap = 1,        # more vertical space
  faclen = 0
)

# Number of terminal leaves
length(unique(tree$where))
# Most important variable
tree$variable.importance

# Get predicted classes for the training set
train_pred <- predict(tree, train.df, type = "class")

# confusionMatrix function to get the confusion matrix and accuracy for test data
confusionMatrix(as.factor(train_pred), as.factor(train.df$involves_counterfeit))

#validation data prediction and confussion matrix
valid_pred <- predict(tree, valid.df, type="class")
confusionMatrix(as.factor(valid_pred), as.factor(valid.df$involves_counterfeit))

#-------------------------------------------------------------------------------
# Logistic Regression
#-------------------------------------------------------------------------------

# Load the package
library(readxl)
library(dplyr)
library(rpart)
library(rpart.plot)
library(caret)

logit_data <- data_sampled

logit_data<-logit_data[, -c(1,2,3)]  

#Splitting the data as train and test
set.seed(123)  
train.index1 <- sample(c(1:dim(logit_data)[1]), dim(logit_data)[1]*0.7)  
train.df1<- logit_data[train.index1, ]
valid.df1 <- logit_data[-train.index1, ]

# optimal model
logit.opt <- glm(involves_counterfeit ~ payment_method + discount_applied+device_fingerprint_new +
                   customer_location  + geolocation_mismatch + velocity_flag+discount_percentage + refund_requested,
                 data = train.df1, family = "binomial") 
summary(logit.opt)


# 1) TRAINING SET optimized model
train_prob  <- predict(logit.opt, newdata = train.df1, type = "response")
train_pred1  <- ifelse(train_prob > 0.5, 1, 0)

train_pred1  <- factor(train_pred1, levels = c(0, 1))
train_true1  <- factor(train.df1$involves_counterfeit, levels = c(0, 1))

confusionMatrix(train_pred1, train_true1)

# 2) VALIDATION SET optimized model
valid_prob  <- predict(logit.opt, newdata = valid.df1, type = "response")
valid_pred1  <- ifelse(valid_prob > 0.5, 1, 0)

valid_pred1  <- factor(valid_pred1, levels = c(0, 1))
valid_true1  <- factor(valid.df1$involves_counterfeit, levels = c(0, 1))

confusionMatrix(valid_pred1, valid_true1)

#-------------------------------------------------------------------------------
# ROC Curve
#-------------------------------------------------------------------------------

# Load required libraries
library(pROC)

# actual target for each validation dataset
actual_tree  <- valid.df$involves_counterfeit
actual_logit <- valid.df1$involves_counterfeit


# 1) Decision Tree (probability of class = 1)
tree_prob_valid <- predict(tree, valid.df, type = "prob")[,2]

# 2) Logistic Regression (probability of class = 1)
logit_prob_valid <- predict(logit.opt, newdata = valid.df1, type = "response")



# Compute ROC objects
roc_tree  <- roc(actual_tree,  tree_prob_valid)
roc_logit <- roc(actual_logit, logit_prob_valid)


# Plot ROC Curves
plot(roc_tree, col="red", lwd=2, main="ROC Comparison of Models")
lines(roc_logit, col="blue", lwd=2)


legend(
  "bottomright",
  legend = c("Decision Tree", "Logistic Regression"),
  col = c("red", "blue"),
  lwd = 2
)

# Print AUC values
cat("AUC - Decision Tree:      ", auc(roc_tree),  "\n")
cat("AUC - Logistic Regression: ", auc(roc_logit), "\n")




