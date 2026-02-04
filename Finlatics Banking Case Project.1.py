import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
data=pd.read_csv("/Users/vishwa/Downloads/Finlatics/Documents/banking_data.csv")
print(data.head())

#Q1: What is the distribution of the age among clients?
plt.figure(figsize=(10,6))
sns.histplot(data["age"],bins=10)
plt.xlabel("Age")
plt.ylabel("Frequency")
plt.title("Age Distribution of Clients")
plt.show()

#Q2: How does the job type vary among the clients?
plt.figure(figsize=(10,6))
sns.countplot(y=data['job'], order=data['job'].value_counts().index)
plt.title("Job Type Distribution")
plt.show()

#Q3: What is the marital status distribution of the clients?
plt.figure(figsize=(10,6))
sns.countplot(x="marital", data=data, order=data['marital'].value_counts().index)
plt.xlabel("Marital Status")  
plt.ylabel("Frequency")
plt.title("Marital Status Distribution")
plt.show()

#Q4: What is the level of education among the clients?
plt.figure(figsize=(10,6))
sns.countplot(x="education",data=data, order=data['education'].value_counts().index)
plt.xlabel("Education Level")
plt.ylabel("Frequency")
plt.title("Education Level Distribution")
plt.show()

#Q5: What proportion of clients have credit in default?
plt.figure(figsize=(10,6))
sns.countplot(x="default",data=data)
plt.xlabel("Default Credit")
plt.ylabel("Frequency")
plt.title("Proportion of Clients Having Credit in Default")
plt.show()

#Q6: What is the distribution of average yearly balance among the clients?
plt.figure(figsize=(10,6))
sns.histplot(data["balance"],bins=5)
plt.xlabel("Average Yearly Balance")
plt.ylabel("Frequency")
plt.title("Yearly Balance Distribution")
plt.show()

#Q7: How many clients have housing loans?
print("Clients with Housing Loan:")
print(data['housing'].value_counts())

#Q8: How many clients have personal loans?
print("Clients with Personal Loan:")
print(data['loan'].value_counts())

#Q9: What are the communication types used for contacting clients during the campaign?
plt.figure(figsize=(10,6))
sns.countplot(x="contact",data=data)
plt.xlabel("Communication Type")
plt.ylabel("Frequency")
plt.title("Communication Types Used for Contacting Clients")
plt.show()

#Q10: What is the distribution of the last contact day of the month?
plt.figure(figsize=(10,6))
sns.histplot(data["day"],bins=10)
plt.xlabel("Day of the Month")
plt.ylabel("Frequency")
plt.title("Last Contact Day of the Month Distribution")
plt.show()

#Q11: How does the last contact month vary among the clients?
plt.figure(figsize=(10,6))
sns.countplot(x="month",data=data, order=data['month'].value_counts().index)
plt.xlabel("Month")
plt.ylabel("Frequency")
plt.title("Last Contact Month Distribution")
plt.show()

#Q12: What is the distribution of the duration of the last contact?
plt.figure(figsize=(10,6))
sns.histplot(data["duration"],bins=10)
plt.xlabel("Duration of Last Contact")
plt.ylabel("Frequency")
plt.title("Duration of Last Contact Distribution")
plt.show()

#Q13: How many contacts were performed during the campaign for each client?
plt.figure(figsize=(10,6))
sns.countplot(x="campaign",data=data)
plt.xlabel("Number of Contacts")
plt.ylabel("Frequency")
plt.title("Number of Contacts During Campaign")
plt.show()

#Q14: What is the distribution of the number of days passed since the client was last contacted from a previous campaign?
plt.figure(figsize=(10,6))
sns.histplot(data["pdays"],bins=10)
plt.xlabel("Number of Days")
plt.ylabel("Frequency")
plt.title("Days Since Last Contact")
plt.show()

#Q15: How many contacts were performed before the current campaign for each client?
plt.figure(figsize=(10,6))
sns.countplot(x="previous",data=data)
plt.xlabel("Number of Contacts")
plt.ylabel("Frequency")
plt.title("Contacts Before Current Campaign")
plt.show()

#Q16: What were the outcomes of the previous marketing campaigns?
plt.figure(figsize=(10,6))
sns.countplot(y="poutcome",data=data)
plt.xlabel("Frequency")
plt.ylabel("Outcome")
plt.title("Outcomes of Previous Marketing Campaigns")
plt.show()

#Q17: What is the distribution of clients who subscribed to a term deposit vs. those who did not?
plt.figure(figsize=(10,6))
sns.countplot(x="y",data=data)
plt.xlabel("Subscribed to Term Deposit")   
plt.ylabel("Frequency")
plt.title("Subscription to Term Deposit")
plt.show()

#Q18: Are there any correlations between different attributes and the likelihood of subscribing to a term deposit?
plt.figure(figsize=(10, 6))
sns.heatmap(data.select_dtypes(include=['int64','float64']).corr(), annot=True, fmt=".2f", cmap="PuBuGn")
plt.title("Correlation between Different Attributes")
plt.show()