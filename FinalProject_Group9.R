#reading data
setwd('C:/Users/vaish/Downloads')
data <- read.csv("student-mat.csv")
View(data)

#SUMMARY
summary(data)

# Exploratory data analysis
library(Hmisc)
hist.data.frame(data)


library(ggplot2)
ggplot(data = data, aes(x = internet , fill = sex)) + 
  geom_bar(position = "dodge") +  xlab("Internet Access")+ylab("Total") +
  theme(axis.text.x = element_text(angle = 90)) + ggtitle(" Bar Graph Showing Internet Access Across Students")

ggplot(data = data, aes(y= sex, x = G3)) +
  geom_boxplot(color="red", fill="yellow", alpha=0.2) +ylab("Gender")+xlab("Final Math Grade") + 
  ggtitle(" Box Plot Showing Student Perfomance Between Genders")

ggplot(data = data, aes(fill =internet, y = failures)) +
  geom_histogram(position = "dodge", bins = 30) +xlab("Internet")+ylab("Failures") +
  ggtitle(" Histogram Showing Failures Against Internet Access")

ggplot(data = data, aes(x=G3, fill = romantic)) +
  geom_histogram(position = "dodge") +xlab("G3")+
  ggtitle("Histogram Showing The Difference in Performance of Students in Relationships")


#PREPROCESSING
#converted to numeric values
data$sex <- ifelse(data$sex == "F", 1, 0)
data$famsize <- ifelse(data$famsize == "GT3", 1, 0)
data$school <- ifelse(data$school == "GP", 1, 0)
data$address <- ifelse(data$address == "U", 1, 0)
data$Pstatus <- ifelse(data$Pstatus == "T", 1, 0)
data$schoolsup <- ifelse(data$schoolsup == "yes", 1, 0)
data$famsup <- ifelse(data$famsup == "yes", 1, 0)
data$paid <- ifelse(data$paid == "yes", 1, 0)
data$activities <- ifelse(data$activities == "yes", 1, 0)
data$nursery <- ifelse(data$nursery == "yes", 1, 0)
data$higher <- ifelse(data$higher == "yes", 1, 0)
data$internet <- ifelse(data$internet == "yes", 1, 0)
data$romantic <- ifelse(data$romantic == "yes", 1, 0)

#drop columns : Mjob, Fjob, Guardian, reason
df<- subset(data, select = -c(Mjob, Fjob, guardian, reason))
print('Modified dataframe:-')
df
View(df)

#Missing values - NONE
is.na(df)

#Aggregate G1, G2, G3 to G_Agg
G_agg <- rowMeans(df[, c("G1", "G2", "G3")])
print(G_agg)

G_agg <- rowMeans(df[, c("G1", "G2", "G3")])
df$G_agg <- G_agg
df <- df[, !colnames(df) %in% c("G1", "G2", "G3")]
head(df, 5)


#Correlation Matrix
install.packages("corrplot")
library(corrplot)

corrmat<-cor(df)
corrplot(corrmat, method = "color", type = "full", 
         tl.col = "black", tl.srt = 45, title = 'Correlation HeatMap')
# attributes with high correlation Medu, studytime, higher, failure


#Splitting data to train and test

# Set the proportion of data to use for training (e.g., 80%)
prop_train <- 0.8

# Compute the number of rows to use for training
num_train <- round(prop_train * nrow(df))

# Randomly sample rows for the training set
set.seed(123) # Set a seed for reproducibility
train_indices <- sample(seq_len(nrow(df)), size = num_train)

# Split the data into the training and testing sets
training <- df[train_indices, ]
testing <- df[-train_indices, ]

model<- lm(G_agg~Medu+studytime+higher+failures, data = training)
summary(model)
anova(model)

#Scaled location ,QQ Plot, Residual and fitted values plot
plot(model)

#scatter plot
library(car)
scatterplotMatrix(~G_agg+Medu+studytime+higher+failures, data = training)


#QQ PLOT
qqnorm(df$G_agg)
qqline(df$G_agg)

#SHAPIRO-WILK
?shapiro.test
shapiro.test(training$G_agg)


#TESTING MODEL ON TEST SET
test_result<-predict(model,newData = testing)
test_result
