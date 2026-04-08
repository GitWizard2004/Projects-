#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Apr  1 18:23:56 2026

@author: vishwa
"""

import pandas as pd
df = pd.read_csv("loan_data.csv")
print(df.shape)

##Pre precess
from sklearn.preprocessing import LabelEncoder
le = LabelEncoder()
df["person_gender"] = le.fit_transform(df["person_gender"])  
df["previous_loan_defaults_on_file"] = le.fit_transform(df["previous_loan_defaults_on_file"])
print(df[["person_gender", "previous_loan_defaults_on_file"]].head())

## One hot encoding
df = pd.get_dummies(df, columns=["person_education", "person_home_ownership", "loan_intent"], drop_first=False)
df = df.astype({col: int for col in df.select_dtypes(bool).columns})
print(df.shape)
print(df.columns.tolist())

# Separate features and target
from sklearn.model_selection import train_test_split

X = df.drop("loan_status", axis=1)
y = df["loan_status"]

# Stratified 80/20 split
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42, stratify=y
)

print(f"X_train: {X_train.shape}")
print(f"X_test:  {X_test.shape}")
print(f"Train default rate: {y_train.mean():.2%}")
print(f"Test default rate:  {y_test.mean():.2%}")

## SMOTE on trian data 
from imblearn.over_sampling import SMOTE

smote = SMOTE(sampling_strategy=0.67, random_state=42)
X_train_res, y_train_res = smote.fit_resample(X_train, y_train)

print(f"Before SMOTE — Class 0: {sum(y_train==0):,}  Class 1: {sum(y_train==1):,}")
print(f"After SMOTE  — Class 0: {sum(y_train_res==0):,}  Class 1: {sum(y_train_res==1):,}")
print(f"New default rate: {y_train_res.mean():.2%}")

##Scaleing
from sklearn.preprocessing import StandardScaler

scaler = StandardScaler()

X_train_scaled = scaler.fit_transform(X_train_res)
X_test_scaled = scaler.transform(X_test)
pd.DataFrame(X_train_scaled).describe().round(2)

##Exploratory data analysis
import matplotlib.pyplot as plt
import seaborn as sns

fig, ax = plt.subplots(figsize=(6, 4))

counts = df["loan_status"].value_counts()
ax.bar(["Repaid (0)", "Default (1)"], counts.values, 
       color=["#4C72B0", "#DD8452"], edgecolor="white", width=0.5)

for bar, val in zip(ax.patches, counts.values):
    ax.text(bar.get_x() + bar.get_width()/2, bar.get_height() + 200,
            f"{val:,}\n({val/len(df)*100:.1f}%)", ha="center", fontsize=10)

ax.set_title("Target Class Distribution")
ax.set_ylabel("Count")
plt.tight_layout()
plt.show()
##Default rate by loan intent
df_eda = pd.read_csv("loan_data.csv")

fig, ax = plt.subplots(figsize=(8, 5))

intent_default = df_eda.groupby("loan_intent")["loan_status"].mean().sort_values(ascending=False)
intent_default.plot(kind="bar", ax=ax, color="#4C72B0", edgecolor="white")

ax.set_title("Default Rate by Loan Intent")
ax.set_ylabel("Default Rate")
ax.set_xlabel("")
ax.set_xticklabels(ax.get_xticklabels(), rotation=30, ha="right")
ax.yaxis.set_major_formatter(plt.FuncFormatter(lambda y, _: f"{y:.0%}"))

plt.tight_layout()
plt.show()

##Default rate by education level
edu_order = ["High School", "Associate", "Bachelor", "Master", "Doctorate"]
edu_default = df_eda.groupby("person_education")["loan_status"].mean().reindex(edu_order)
sns.barplot(x=edu_default.index, y=edu_default.values)
plt.title("Default Rate by Education Level")
plt.ylabel("Default Rate")
plt.xticks(rotation=30, ha="right")
plt.tight_layout()
plt.show()

##Credit score distribution by default status
sample = df_eda.sample(2000, random_state=42)
sns.scatterplot(data=sample, x="credit_score", y="loan_amnt", 
                hue="loan_status", alpha=0.5)
plt.title("Credit Score vs Loan Amount by Default Status")
plt.tight_layout()
plt.show()

##Correlation heatmap
import numpy as np

fig, ax = plt.subplots(figsize=(12, 10))

corr = df.corr()
mask = np.triu(np.ones_like(corr, dtype=bool))
sns.heatmap(corr, mask=mask, ax=ax, annot=True, fmt=".2f", 
            cmap="coolwarm", center=0, linewidths=0.5, 
            annot_kws={"size": 7})

ax.set_title("Feature Correlation Heatmap")
plt.tight_layout()
plt.show()

##Default rate by home ownership
sns.barplot(x=df_eda["person_home_ownership"], y=df_eda["loan_status"])

plt.title("Default Rate by Home Ownership")
plt.ylabel("Default Rate")
plt.xlabel("Home Ownership")
plt.tight_layout()
plt.show()

## Model Building
##### Logistic Regression
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import classification_report, confusion_matrix, accuracy_score, roc_auc_score

# 1. Train
lr = LogisticRegression(max_iter=1000, random_state=42)
lr.fit(X_train_scaled, y_train_res)

# 2. Predict
y_pred_lr = lr.predict(X_test_scaled)
y_pred_lr_train = lr.predict(X_train_scaled)

# 3. Training Set Report
print("Logistic Regression - Training Set Results")
print("="*40)
print(classification_report(y_train_res, y_pred_lr_train))

# 4. Test Set Report
print("Logistic Regression - Test Set Results")
print("="*40)
print(classification_report(y_test, y_pred_lr))

# 5. Confusion Matrix
print("Confusion Matrix:")
print(confusion_matrix(y_test, y_pred_lr))

# 6. Overfitting Check
print(f"Train Accuracy: {accuracy_score(y_train_res, y_pred_lr_train):.2%}")
print(f"Test Accuracy:  {accuracy_score(y_test, y_pred_lr):.2%}")
print(f"Difference:     {abs(accuracy_score(y_train_res, y_pred_lr_train) - accuracy_score(y_test, y_pred_lr)):.2%}")

##### Decision Tree
from sklearn.tree import DecisionTreeClassifier
from sklearn.model_selection import GridSearchCV

# 1. Grid Search for best parameters
param_grid = {
    "max_depth": [4, 6, 8, 10],
    "min_samples_split": [2, 5, 10],
    "min_samples_leaf": [1, 2, 4],
    "criterion": ["gini", "entropy"]
}

dt_grid = GridSearchCV(
    DecisionTreeClassifier(random_state=42),
    param_grid,
    cv=5,
    scoring="f1",
    n_jobs=-1,
    verbose=1
)

dt_grid.fit(X_train_scaled, y_train_res)
print(f"Best Parameters: {dt_grid.best_params_}")
print(f"Best CV F1 Score: {dt_grid.best_score_:.3f}")

# 2. Train best model
dt = dt_grid.best_estimator_

# 3. Predict
y_pred_dt = dt.predict(X_test_scaled)
y_pred_dt_train = dt.predict(X_train_scaled)

# 4. Training Set Report
print("\nDecision Tree - Training Set Results")
print("="*40)
print(classification_report(y_train_res, y_pred_dt_train))

# 5. Test Set Report
print("Decision Tree - Test Set Results")
print("="*40)
print(classification_report(y_test, y_pred_dt))

# 6. Confusion Matrix
print("Confusion Matrix:")
print(confusion_matrix(y_test, y_pred_dt))

# 7. Overfitting Check
print(f"Train Accuracy: {accuracy_score(y_train_res, y_pred_dt_train):.2%}")
print(f"Test Accuracy:  {accuracy_score(y_test, y_pred_dt):.2%}")
print(f"Difference:     {abs(accuracy_score(y_train_res, y_pred_dt_train) - accuracy_score(y_test, y_pred_dt)):.2%}")


##### Random Forest
from sklearn.ensemble import RandomForestClassifier

# 1. Grid Search for best parameters
param_grid_rf = {
    "n_estimators": [100, 200, 300],
    "max_depth": [6, 8, 10],
    "min_samples_split": [2, 5],
    "min_samples_leaf": [1, 2]
}

rf_grid = GridSearchCV(
    RandomForestClassifier(random_state=42),
    param_grid_rf,
    cv=5,
    scoring="f1",
    n_jobs=-1,
    verbose=1
)

rf_grid.fit(X_train_scaled, y_train_res)
print(f"Best Parameters: {rf_grid.best_params_}")
print(f"Best CV F1 Score: {rf_grid.best_score_:.3f}")

# 2. Train best model
rf = rf_grid.best_estimator_

# 3. Predict
y_pred_rf = rf.predict(X_test_scaled)
y_pred_rf_train = rf.predict(X_train_scaled)

# 4. Training Set Report
print("\nRandom Forest - Training Set Results")
print("="*40)
print(classification_report(y_train_res, y_pred_rf_train))

# 5. Test Set Report
print("Random Forest - Test Set Results")
print("="*40)
print(classification_report(y_test, y_pred_rf))

# 6. Confusion Matrix
print("Confusion Matrix:")
print(confusion_matrix(y_test, y_pred_rf))

# 7. Overfitting Check
print(f"Train Accuracy: {accuracy_score(y_train_res, y_pred_rf_train):.2%}")
print(f"Test Accuracy:  {accuracy_score(y_test, y_pred_rf):.2%}")
print(f"Difference:     {abs(accuracy_score(y_train_res, y_pred_rf_train) - accuracy_score(y_test, y_pred_rf)):.2%}")

##### XGBoost
from xgboost import XGBClassifier

# 1. Grid Search for best parameters
param_grid_xgb = {
    "n_estimators": [100, 200, 300],
    "max_depth": [4, 6, 8],
    "learning_rate": [0.01, 0.1, 0.2],
    "subsample": [0.8, 1.0]
}

xgb_grid = GridSearchCV(
    XGBClassifier(random_state=42, eval_metric="logloss", n_jobs=-1),
    param_grid_xgb,
    cv=5,
    scoring="f1",
    n_jobs=-1,
    verbose=1
)

xgb_grid.fit(X_train_scaled, y_train_res)
print(f"Best Parameters: {xgb_grid.best_params_}")
print(f"Best CV F1 Score: {xgb_grid.best_score_:.3f}")

# 2. Train best model
xgb = xgb_grid.best_estimator_

# 3. Predict
y_pred_xgb = xgb.predict(X_test_scaled)
y_pred_xgb_train = xgb.predict(X_train_scaled)

# 4. Training Set Report
print("\nXGBoost - Training Set Results")
print("="*40)
print(classification_report(y_train_res, y_pred_xgb_train))

# 5. Test Set Report
print("XGBoost - Test Set Results")
print("="*40)
print(classification_report(y_test, y_pred_xgb))

# 6. Confusion Matrix
print("Confusion Matrix:")
print(confusion_matrix(y_test, y_pred_xgb))

# 7. Overfitting Check
print(f"Train Accuracy: {accuracy_score(y_train_res, y_pred_xgb_train):.2%}")
print(f"Test Accuracy:  {accuracy_score(y_test, y_pred_xgb):.2%}")
print(f"Difference:     {abs(accuracy_score(y_train_res, y_pred_xgb_train) - accuracy_score(y_test, y_pred_xgb)):.2%}")

##### XGBoost - With Regularization
param_grid_xgb2 = {
    "n_estimators": [100, 200, 300],
    "max_depth": [4, 6],
    "learning_rate": [0.01, 0.1],
    "subsample": [0.8, 1.0],
    "reg_lambda": [1, 5, 10],
    "min_child_weight": [1, 5]
}

xgb_grid2 = GridSearchCV(
    XGBClassifier(random_state=42, eval_metric="logloss", n_jobs=-1),
    param_grid_xgb2,
    cv=5,
    scoring="f1",
    n_jobs=-1,
    verbose=1
)

xgb_grid2.fit(X_train_scaled, y_train_res)
print(f"Best Parameters: {xgb_grid2.best_params_}")
print(f"Best CV F1 Score: {xgb_grid2.best_score_:.3f}")

# Best model
xgb2 = xgb_grid2.best_estimator_

# Predict
y_pred_xgb2 = xgb2.predict(X_test_scaled)
y_pred_xgb2_train = xgb2.predict(X_train_scaled)

# Training Set Report
print("\nXGBoost Regularized - Training Set Results")
print("="*40)
print(classification_report(y_train_res, y_pred_xgb2_train))

# Test Set Report
print("XGBoost Regularized - Test Set Results")
print("="*40)
print(classification_report(y_test, y_pred_xgb2))

# Confusion Matrix
print("Confusion Matrix:")
print(confusion_matrix(y_test, y_pred_xgb2))

# Overfitting Check
print(f"Train Accuracy: {accuracy_score(y_train_res, y_pred_xgb2_train):.2%}")
print(f"Test Accuracy:  {accuracy_score(y_test, y_pred_xgb2):.2%}")
print(f"Difference:     {abs(accuracy_score(y_train_res, y_pred_xgb2_train) - accuracy_score(y_test, y_pred_xgb2)):.2%}")

##### LightGBM
from lightgbm import LGBMClassifier

# 1. Grid Search for best parameters
param_grid_lgbm = {
    "n_estimators": [100, 200, 300],
    "max_depth": [4, 6, 8],
    "learning_rate": [0.01, 0.1, 0.2],
    "subsample": [0.8, 1.0],
    "reg_lambda": [1, 5, 10],
}

lgbm_grid = GridSearchCV(
    LGBMClassifier(random_state=42, n_jobs=-1, verbose=-1),
    param_grid_lgbm,
    cv=5,
    scoring="f1",
    n_jobs=-1,
    verbose=1
)

lgbm_grid.fit(X_train_scaled, y_train_res)
print(f"Best Parameters: {lgbm_grid.best_params_}")
print(f"Best CV F1 Score: {lgbm_grid.best_score_:.3f}")

# 2. Best model
lgbm = lgbm_grid.best_estimator_

# 3. Predict
y_pred_lgbm = lgbm.predict(X_test_scaled)
y_pred_lgbm_train = lgbm.predict(X_train_scaled)

# 4. Training Set Report
print("\nLightGBM - Training Set Results")
print("="*40)
print(classification_report(y_train_res, y_pred_lgbm_train))

# 5. Test Set Report
print("LightGBM - Test Set Results")
print("="*40)
print(classification_report(y_test, y_pred_lgbm))

# 6. Confusion Matrix
print("Confusion Matrix:")
print(confusion_matrix(y_test, y_pred_lgbm))

# 7. Overfitting Check
print(f"Train Accuracy: {accuracy_score(y_train_res, y_pred_lgbm_train):.2%}")
print(f"Test Accuracy:  {accuracy_score(y_test, y_pred_lgbm):.2%}")
print(f"Difference:     {abs(accuracy_score(y_train_res, y_pred_lgbm_train) - accuracy_score(y_test, y_pred_lgbm)):.2%}")

##### Voting Classifier - Hard and Soft
from sklearn.ensemble import VotingClassifier

# 1. Hard Voting
hard_voting = VotingClassifier(
    estimators=[
        ("lr", lr),
        ("dt", dt),
        ("rf", rf),
        ("xgb", xgb2),
        ("lgbm", lgbm)
    ],
    voting="hard"
)

hard_voting.fit(X_train_scaled, y_train_res)
y_pred_hv = hard_voting.predict(X_test_scaled)
y_pred_hv_train = hard_voting.predict(X_train_scaled)

print("\nHard Voting - Training Set Results")
print("="*40)
print(classification_report(y_train_res, y_pred_hv_train))
print("Hard Voting - Test Set Results")
print("="*40)
print(classification_report(y_test, y_pred_hv))
print("Confusion Matrix:")
print(confusion_matrix(y_test, y_pred_hv))
print(f"Train Accuracy: {accuracy_score(y_train_res, y_pred_hv_train):.2%}")
print(f"Test Accuracy:  {accuracy_score(y_test, y_pred_hv):.2%}")
print(f"Difference:     {abs(accuracy_score(y_train_res, y_pred_hv_train) - accuracy_score(y_test, y_pred_hv)):.2%}")

# 2. Soft Voting
soft_voting = VotingClassifier(
    estimators=[
        ("lr", lr),
        ("dt", dt),
        ("rf", rf),
        ("xgb", xgb2),
        ("lgbm", lgbm)
    ],
    voting="soft"
)

soft_voting.fit(X_train_scaled, y_train_res)
y_pred_sv = soft_voting.predict(X_test_scaled)
y_pred_sv_train = soft_voting.predict(X_train_scaled)

print("\nSoft Voting - Training Set Results")
print("="*40)
print(classification_report(y_train_res, y_pred_sv_train))
print("Soft Voting - Test Set Results")
print("="*40)
print(classification_report(y_test, y_pred_sv))
print("Confusion Matrix:")
print(confusion_matrix(y_test, y_pred_sv))
print(f"Train Accuracy: {accuracy_score(y_train_res, y_pred_sv_train):.2%}")
print(f"Test Accuracy:  {accuracy_score(y_test, y_pred_sv):.2%}")
print(f"Difference:     {abs(accuracy_score(y_train_res, y_pred_sv_train) - accuracy_score(y_test, y_pred_sv)):.2%}")

##### ROC Curves
from sklearn.metrics import roc_curve, roc_auc_score
import matplotlib.pyplot as plt

# Get probabilities for each model
models_proba = {
    "Logistic Regression": (lr, X_test_scaled),
    "Decision Tree":       (dt, X_test_scaled),
    "Random Forest":       (rf, X_test_scaled),
    "XGBoost":             (xgb2, X_test_scaled),
    "LightGBM":            (lgbm, X_test_scaled),
    "Soft Voting":         (soft_voting, X_test_scaled)
}

colors = ["#4C72B0", "#DD8452", "#55A868", "#C44E52", "#8172B3", "#937860"]

plt.figure(figsize=(10, 7))

for (name, (model, X)), color in zip(models_proba.items(), colors):
    y_proba = model.predict_proba(X)[:, 1]
    fpr, tpr, _ = roc_curve(y_test, y_proba)
    auc = roc_auc_score(y_test, y_proba)
    plt.plot(fpr, tpr, lw=2, color=color, label=f"{name} (AUC={auc:.3f})")

# Random classifier baseline
plt.plot([0, 1], [0, 1], "k--", lw=1.5, label="Random Classifier")

plt.title("ROC Curves — All Models")
plt.xlabel("False Positive Rate")
plt.ylabel("True Positive Rate")
plt.legend(loc="lower right")
plt.tight_layout()
plt.show()

##### Feature Importance — All Models
fig, axes = plt.subplots(2, 3, figsize=(18, 12))
fig.suptitle("Feature Importance — All Models", fontsize=15, fontweight="bold")
fig.delaxes(axes[1, 2])

feature_names = X_train.columns

models_fi = {
    "Logistic Regression": abs(lr.coef_[0]),
    "Decision Tree":       dt.feature_importances_,
    "Random Forest":       rf.feature_importances_,
    "XGBoost":             xgb2.feature_importances_,
    "LightGBM (Gain)":     lgbm.booster_.feature_importance(importance_type="gain")
}

colors = ["#4C72B0", "#DD8452", "#55A868", "#C44E52", "#8172B3"]

for (name, importance), ax, color in zip(models_fi.items(), axes.flatten(), colors):
    fi = pd.DataFrame({"feature": feature_names, "importance": importance}).nlargest(10, "importance")
    sns.barplot(data=fi, y="feature", x="importance", ax=ax, color=color)
    ax.set(title=name, xlabel="Importance", ylabel="")

plt.tight_layout()
plt.show()

##### Final Model Comparison
from sklearn.metrics import precision_score, recall_score, f1_score

models_eval = {
    "Logistic Regression": (y_pred_lr, y_pred_lr_train),
    "Decision Tree":       (y_pred_dt, y_pred_dt_train),
    "Random Forest":       (y_pred_rf, y_pred_rf_train),
    "XGBoost":             (y_pred_xgb2, y_pred_xgb2_train),
    "LightGBM":            (y_pred_lgbm, y_pred_lgbm_train),
    "Hard Voting":         (y_pred_hv, y_pred_hv_train),
    "Soft Voting":         (y_pred_sv, y_pred_sv_train)
}

results = []
for name, (y_pred, y_pred_train) in models_eval.items():
    results.append({
        "Model":      name,
        "Train Acc":  f"{accuracy_score(y_train_res, y_pred_train):.2%}",
        "Test Acc":   f"{accuracy_score(y_test, y_pred):.2%}",
        "Difference": f"{abs(accuracy_score(y_train_res, y_pred_train) - accuracy_score(y_test, y_pred)):.2%}",
        "Precision":  f"{precision_score(y_test, y_pred):.3f}",
        "Recall":     f"{recall_score(y_test, y_pred):.3f}",
        "F1 Score":   f"{f1_score(y_test, y_pred):.3f}"
    })

results_df = pd.DataFrame(results).set_index("Model")
print(results_df.to_string())





























