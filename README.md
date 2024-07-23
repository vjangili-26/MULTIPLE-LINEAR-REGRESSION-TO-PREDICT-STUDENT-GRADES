# MULTIPLE LINEAR REGRESSION TO PREDICT STUDENT GRADES

## INTRODUCTION
Data-driven strategies for enhancing educational outcomes have drawn more and more attention in recent years. Predicting student grades using various factors, such as prior academic performance, socioeconomic background, attendance, and demographics, is one such method. By utilizing data analysis and machine learning algorithms, we can pinpoint the variables affecting student performance and provide targeted support and intervention to students in need.

This project aims to use multiple linear regression in R programming to create a model that forecasts student grades based on various attributes. Multiple linear regression is a statistical technique that examines the relationship between a dependent variable (student grades) and several independent variables. The model is trained and evaluated using a dataset containing student demographics, socioeconomic status, previous academic performance, and attendance records.

## DATA
The dataset extracted from Kaggle contains information about 400 students and includes 33 attributes such as age, gender, family size, study time, and weekly alcohol consumption. Additionally, it includes information about student performance in two subjects, math, and Portuguese language. The attributes are as follows:

- **school:** student's school (binary: 'GP' - Gabriel Pereira or 'MS' - Mousinho da Silveira)
- **sex:** student's sex (binary: 'F' - female or 'M' - male)
- **age:** student's age (numeric: from 15 to 22)
- **address:** student's home address type (binary: 'U' - urban or 'R' - rural)
- **famsize:** family size (binary: 'LE3' - less or equal to 3 or 'GT3' - greater than 3)
- **Pstatus:** parent's cohabitation status (binary: 'T' - living together or 'A' - apart)
- **Medu:** mother's education (numeric: 0 - none, 1 - primary education (4th grade), 2 – 5th to 9th grade, 3 – secondary education, 4 – higher education)
- **Fedu:** father's education (numeric: 0 - none, 1 - primary education (4th grade), 2 – 5th to 9th grade, 3 – secondary education, 4 – higher education)
- **Mjob:** mother's job (nominal: 'teacher', 'health', 'civil services', 'at_home', 'other')
- **Fjob:** father's job (nominal: 'teacher', 'health', 'civil services', 'at_home', 'other')
- **reason:** reason to choose this school (nominal: 'home', 'reputation', 'course', 'other')
- **guardian:** student's guardian (nominal: 'mother', 'father', 'other')
- **traveltime:** home to school travel time (numeric: 1 - <15 min., 2 - 15 to 30 min., 3 - 30 min. to 1 hour, 4 - >1 hour)
- **studytime:** weekly study time (numeric: 1 - <2 hours, 2 - 2 to 5 hours, 3 - 5 to 10 hours, 4 - >10 hours)
- **failures:** number of past class failures (numeric: n if 1<=n<3, else 4)
- **schoolsup:** extra educational support (binary: yes or no)
- **famsup:** family educational support (binary: yes or no)
- **paid:** extra paid classes within the course subject (Math or Portuguese) (binary: yes or no)
- **activities:** extra-curricular activities (binary: yes or no)
- **nursery:** attended nursery school (binary: yes or no)
- **higher:** wants to take higher education (binary: yes or no)
- **internet:** Internet access at home (binary: yes or no)
- **romantic:** with a romantic relationship (binary: yes or no)
- **famrel:** quality of family relationships (numeric: from 1 - very bad to 5 - excellent)
- **freetime:** free time after school (numeric: from 1 - very low to 5 - very high)
- **goout:** going out with friends (numeric: from 1 - very low to 5 - very high)
- **Dalc:** workday alcohol consumption (numeric: from 1 - very low to 5 - very high)
- **Walc:** weekend alcohol consumption (numeric: from 1 - very low to 5 - very high)
- **health:** current health status (numeric: from 1 - very bad to 5 - very good)
- **absences:** number of school absences (numeric: from 0 to 93)
- **G1:** first period grade (numeric: from 0 to 20)
- **G2:** second period grade (numeric: from 0 to 20)
- **G3:** final grade (numeric: from 0 to 20, output target)

The attributes like Mother's education, studytime, higher, failure are the explanatory variables to predict the final grade ‘G_agg’ (aggregate of G1, G2, G3) which is the target variable. The following is the summary of the data which explains the mean, median, min value, max value of each attribute.

## EXPLORATORY DATA ANALYSIS
The following is the distribution plot of all the attributes present in the dataset. Before developing a predictive model to estimate student grades based on various attributes, we first conducted an exploratory data analysis (EDA) to gain a better understanding of the dataset and identify any patterns or trends in the data.

The dataset used in this project contains information on students' demographic characteristics, socio-economic status, previous academic performance, and attendance records.

The EDA helped us gain a better understanding of the dataset and identified some of the key relationships between the independent variables and the dependent variable. It also allowed us to identify and handle any missing values, outliers, and multicollinearity issues, ensuring that the dataset was suitable for building a predictive model using multiple linear regression.

## METHODS
The following steps were included in the methodology for examining the Student Alcohol Consumption dataset and creating a model to forecast student performance:

1. **Data Pre-processing:** We identified that the dataset has few categorical variables. To deal with such data, we converted the attributes to numerical values to fit the model accurately. We also checked for any missing values and found none. We aggregated the three columns for grades into one column ‘G_agg’ (final grades of students).

2. **Feature Selection:** We selected the most relevant features that impact student performance using correlation analysis. We found that attributes like Medu, studytime, higher, failure have more correlation with the target variable ‘G_agg’ and can be used to perform multiple linear regression.

3. **Model Selection:** We chose multiple linear regression to predict student performance based on various characteristics.

4. **Model Training:** The dataset was split into training (80%) and testing sets (20%). The training set was used to train the model. The model's performance was assessed using metrics such as mean squared error, R-squared, and root mean squared error.

The coefficients table's p-values illustrate the significance of each predictor variable. The predictor variable is significant at the 95% confidence level if the p-value is less than 0.05. In this instance, higher is not significant, but Medu, studytime, and failures are all significant predictors of student performance.

## RESULTS AND ANALYSIS
We can also determine which variables are more likely to be weakly or not at all associated with the response variable by looking at the scatter plot matrix. This knowledge can help us decide which variables to include in a predictive model and where additional research might be useful.

### Key Findings:
- The coefficients table's p-values illustrate the significance of each predictor variable.
- The adjusted R-squared value shows the percentage of variance in the dependent variable that is explained by the independent variables in the model.
- The F-statistic and corresponding p-value show the significance of the model as a whole.
- The residuals should be normally distributed with a constant variance and a mean of zero.
- The average difference between the actual and predicted G_agg scores is shown by the residual standard error.

## CONCLUSION
We used multiple linear regression to forecast the students' final grades based on a variety of factors, such as study time, study habits, a desire to pursue higher education, and prior failures. Our analysis revealed that the mother's educational background and prior failures had a significant impact on students' academic performance. Although the effects were not statistically significant, study time and the desire to pursue higher education also showed some positive associations with final grades.

Our developed model only partially accounts for the variance in the data, as indicated by its R-squared value of 0.1753. Nevertheless, it still offered insightful information about the elements that influence how well students perform. 

In the future, we might investigate additional modeling methods, such as decision trees or neural networks, to increase the precision of our predictions. We could also gather more data or use data from other sources to enhance our analysis. Overall, this project offers a solid foundation for future study in predicting student performance.

## REFERENCES
- [RStudio Pubs - Student Performance](https://rstudio-pubs-static.s3.amazonaws.com/335819_204193fc3ceb41acb5cf9b386e2cc91b.html)
- [RStudio Pubs - Predicting Student Grades](https://rstudio-pubs-static.s3.amazonaws.com/365904_90b5ff49711448b5aa6ba2f09ffb4fc3.html)
- [Kaggle - Student Alcohol Consumption](https://www.kaggle.com/datasets/uciml/student-alcohol-consumption)
