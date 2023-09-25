# Install and load the renv package if you haven't already
if (!requireNamespace("renv", quietly = TRUE)) {
  install.packages("renv")
}

# Initialize renv
renv::init()

# Install required packages
renv::install(c("tidyverse", "ggplot2", "dplyr", "summarytools", "knitr"))

install.packages("stats")

# Load the packages
library(tidyverse)      # For data manipulation and visualization
library(ggplot2)        # For creating beautiful plots
library(dplyr)          # For data manipulation
library(summarytools)   # For summary statistics
library(knitr)          # For generating reports with knitr
library(stats)          # For basic statistical functions

#Load The Student Perfomance Dataset 
{r Load Dataset}
student_performance_dataset <-
  readr::read_csv(
    "markdown/perfomance-dataset.csv", # nolint
    col_types =
      readr::cols(
        class_group =
          readr::col_factor(levels = c("A", "B", "C")),
        gender = readr::col_factor(levels = c("1", "0")),
        YOB = readr::col_date(format = "%Y"),
        regret_choosing_bi =
          readr::col_factor(levels = c("1", "0")),
        drop_bi_now =
          readr::col_factor(levels = c("1", "0")),
        motivator =
          readr::col_factor(levels = c("1", "0")),
        read_content_before_lecture =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        anticipate_test_questions =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        answer_rhetorical_questions =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        find_terms_I_do_not_know =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        copy_new_terms_in_reading_notebook =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        take_quizzes_and_use_results =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        reorganise_course_outline =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        write_down_important_points =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        space_out_revision =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        studying_in_study_group =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        schedule_appointments =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        goal_oriented =
          readr::col_factor(levels =
                              c("1", "0")),
        spaced_repetition =
          readr::col_factor(levels =
                              c("1", "2", "3", "4")),
        testing_and_active_recall =
          readr::col_factor(levels =
                              c("1", "2", "3", "4")),
        interleaving =
          readr::col_factor(levels =
                              c("1", "2", "3", "4")),
        categorizing =
          readr::col_factor(levels =
                              c("1", "2", "3", "4")),
        retrospective_timetable =
          readr::col_factor(levels =
                              c("1", "2", "3", "4")),
        cornell_notes =
          readr::col_factor(levels =
                              c("1", "2", "3", "4")),
        sq3r = readr::col_factor(levels =
                                   c("1", "2", "3", "4")),
        commute = readr::col_factor(levels =
                                      c("1", "2",
                                        "3", "4")),
        study_time = readr::col_factor(levels =
                                         c("1", "2",
                                           "3", "4")),
        repeats_since_Y1 = readr::col_integer(),
        paid_tuition = readr::col_factor(levels =
                                           c("0", "1")),
        free_tuition = readr::col_factor(levels =
                                           c("0", "1")),
        extra_curricular = readr::col_factor(levels =
                                               c("0", "1")),
        sports_extra_curricular =
          readr::col_factor(levels = c("0", "1")),
        exercise_per_week = readr::col_factor(levels =
                                                c("0", "1",
                                                  "2",
                                                  "3")),
        meditate = readr::col_factor(levels =
                                       c("0", "1",
                                         "2", "3")),
        pray = readr::col_factor(levels =
                                   c("0", "1",
                                     "2", "3")),
        internet = readr::col_factor(levels =
                                       c("0", "1")),
        laptop = readr::col_factor(levels = c("0", "1")),
        family_relationships =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        friendships = readr::col_factor(levels =
                                          c("1", "2", "3",
                                            "4", "5")),
        romantic_relationships =
          readr::col_factor(levels =
                              c("0", "1", "2", "3", "4")),
        spiritual_wellnes =
          readr::col_factor(levels = c("1", "2", "3",
                                       "4", "5")),
        financial_wellness =
          readr::col_factor(levels = c("1", "2", "3",
                                       "4", "5")),
        health = readr::col_factor(levels = c("1", "2",
                                              "3", "4",
                                              "5")),
        day_out = readr::col_factor(levels = c("0", "1",
                                               "2", "3")),
        night_out = readr::col_factor(levels = c("0",
                                                 "1", "2",
                                                 "3")),
        alcohol_or_narcotics =
          readr::col_factor(levels = c("0", "1", "2", "3")),
        mentor = readr::col_factor(levels = c("0", "1")),
        mentor_meetings = readr::col_factor(levels =
                                              c("0", "1",
                                                "2", "3")),
        `Attendance Waiver Granted: 1 = Yes, 0 = No` =
          readr::col_factor(levels = c("0", "1")),
        GRADE = readr::col_factor(levels =
                                    c("A", "B", "C", "D",
                                      "E"))),
    locale = readr::locale())

# Step 1: Summary Statistics
head(student_performance_dataset)    # View the first few rows
str(student_performance_dataset)      # Structure of the dataset
summary(student_performance_dataset)  # Summary statistics

# Count of each class group
table(student_performance_dataset$class_group)

# Count and percentage of gender
table(student_performance_dataset$gender)
prop.table(table(student_performance_dataset$gender))

# Create a bar plot for counts of birth years
birth_year_counts <- table(format(student_performance_dataset$YOB, "%Y"))
barplot(birth_year_counts, main = "Distribution of Birth Years", xlab = "Year of Birth", ylab = "Count")

# Bar plot for class group
barplot(table(student_performance_dataset$class_group), main = "Class Group Distribution", xlab = "Class Group", ylab = "Count")

# Box plot of study time by class group
boxplot(student_performance_dataset$study_time ~ student_performance_dataset$class_group, main = "Study Time by Class Group", xlab = "Class Group", ylab = "Study Time")

# Select only numeric columns and convert them to numeric
numeric_data <- select(student_performance_dataset, -c(YOB, repeats_since_Y1)) %>%
  mutate_if(is.character, as.numeric)

#Step 2 Data Processing
# Example: Remove rows with missing values
# Load the tidyr package
library(tidyr)

# Remove rows with missing values
student_performance_dataset <- student_performance_dataset %>%
  drop_na()

selected_vars <- c(
  "study_time", "mentor", "health", "YOB", "class_group",
  "repeats_since_Y1", "read_content_before_lecture",
  "take_quizzes_and_use_results", "reorganise_course_outline",
  "space_out_revision","exercise_per_week","GRADE","gender"
)

selected_data <- student_performance_dataset %>%
  select(all_of(selected_vars))



# Create a random sample (e.g., 20% of the data)
sampled_data <- selected_data %>%
  sample_n(size = nrow(selected_data) * 0.2)



# Load required libraries
library(dplyr)
library(psych)
library(e1071)# For skewness and kurtosis

# Step 4: Measures of Frequency and Summary Statistics

# Measures of Frequency

# 1. Count the number of students in each class group
class_group_counts <- selected_data %>%
  count(class_group)

# 2. Count the number of students with mentors
mentor_counts <- selected_data %>%
  count(mentor)

# 3. Count the number of students with various health ratings
health_counts <- selected_data %>%
  count(health)

# 4. Count the number of students in each study time category
study_time_counts <- selected_data %>%
  count(study_time)

# 5. Count the number of students based on their Year of Birth (YOB)
yob_counts <- selected_data %>%
  count(YOB)

# 6. Count the number of students based on their exercise_per_week
exercise_counts <- selected_data %>%
  count(exercise_per_week)

# Summary Statistics

# Convert 'study_time' and 'exercise_per_week' to numeric
selected_data <- selected_data %>%
  mutate(study_time = as.numeric(study_time),
         exercise_per_week = as.numeric(exercise_per_week))

# 1. Calculate the mean for study_time
mean_study_time <- selected_data %>%
  summarize(mean_study_time = mean(study_time, na.rm = TRUE))

# 2. Calculate the median for study_time
median_study_time <- selected_data %>%
  summarize(median_study_time = median(study_time, na.rm = TRUE))

# 3. Calculate the variance for study_time
var_study_time <- selected_data %>%
  summarize(var_study_time = var(study_time, na.rm = TRUE))

# 4. Calculate the standard deviation for study_time
std_dev_study_time <- selected_data %>%
  summarize(std_dev_study_time = sd(study_time, na.rm = TRUE))

# 5. Calculate the skewness for study_time
skewness_study_time <- selected_data %>%
  summarize(skewness_study_time = psych::skew(study_time, na.rm = TRUE))

# 6. Calculate the kurtosis for study_time
kurtosis_study_time <- selected_data %>%
  summarize(kurtosis_study_time = e1071::kurtosis(study_time, na.rm = TRUE))

# 7. Calculate the mean for exercise_per_week
mean_exercise <- selected_data %>%
  summarize(mean_exercise = mean(exercise_per_week, na.rm = TRUE))

# 8. Calculate the median for exercise_per_week
median_exercise <- selected_data %>%
  summarize(median_exercise = median(exercise_per_week, na.rm = TRUE))

# 9. Calculate the variance for exercise_per_week
var_exercise <- selected_data %>%
  summarize(var_exercise = var(exercise_per_week, na.rm = TRUE))

# 10. Calculate the standard deviation for exercise_per_week
std_dev_exercise <- selected_data %>%
  summarize(std_dev_exercise = sd(exercise_per_week, na.rm = TRUE))

# 11. Calculate the skewness for exercise_per_week
skewness_exercise <- selected_data %>%
  summarize(skewness_exercise = psych::skew(exercise_per_week, na.rm = TRUE))

# 12. Calculate the kurtosis for exercise_per_week
kurtosis_exercise <- selected_data %>%
  summarize(kurtosis_exercise = e1071::kurtosis(exercise_per_week, na.rm = TRUE))

# Print the results

# Measures of Frequency
print("Measures of Frequency:")
print(class_group_counts)
print(mentor_counts)
print(health_counts)
print(study_time_counts)
print(yob_counts)
print(exercise_counts)

# Summary Statistics
print("Summary Statistics:")
print(mean_study_time)
print(median_study_time)
print(var_study_time)
print(std_dev_study_time)
print(skewness_study_time)
print(kurtosis_study_time)

# Summary Statistics for Exercise
print("Summary Statistics for Exercise per Week:")
print(mean_exercise)
print(median_exercise)
print(var_exercise)
print(std_dev_exercise)
print(skewness_exercise)
print(kurtosis_exercise)

# Load necessary libraries
library(tidyverse)
library(gridExtra)

# Select relevant variables
selected_vars <- c(
  "study_time", "mentor", "health", "YOB", "class_group",
  "repeats_since_Y1", "read_content_before_lecture",
  "take_quizzes_and_use_results", "reorganise_course_outline",
  "space_out_revision", "exercise_per_week", "GRADE", "gender"
)

# Select and clean the data
selected_data <- student_performance_dataset %>%
  select(all_of(selected_vars)) %>%
  drop_na()  # Remove rows with missing values

# Ensure that relevant columns are numeric
selected_data$study_time <- as.numeric(selected_data$study_time)
selected_data$exercise_per_week <- as.numeric(selected_data$exercise_per_week)
selected_data$YOB <- as.numeric(selected_data$YOB)

# Convert "GRADE" to numeric
selected_data$GRADE <- as.numeric(selected_data$GRADE)

# Verify the structure of the cleaned data
str(selected_data)

# Visualization 1: Histogram of Study Time
histogram_study_time <- ggplot(selected_data, aes(x = study_time)) +
  geom_histogram(binwidth = 1, fill = "blue", color = "black") +
  labs(title = "Distribution of Study Time",
       x = "Study Time (hours per week)",
       y = "Frequency")

# Visualization 2: Bar Chart of Gender Distribution
gender_bar_chart <- ggplot(selected_data, aes(x = gender)) +
  geom_bar(fill = "purple") +
  labs(title = "Gender Distribution",
       x = "Gender",
       y = "Count")

# Visualization 3: Box Plot of Age vs. Performance
box_plot_age_performance <- ggplot(selected_data, aes(x = as.factor(YOB), y = GRADE)) +
  geom_boxplot(fill = "green", color = "black") +
  labs(title = "Box Plot of Age vs. Performance",
       x = "YOB",
       y = "GRADE")

# Visualization 4: Bar Plot of Class Group Distribution
class_group_counts <- table(selected_data$class_group)
class_group_bar_plot <- ggplot(data.frame(class_group = factor(names(class_group_counts)), count = as.numeric(class_group_counts)), 
                               aes(x = class_group, y = count, fill = class_group)) +
  geom_bar(stat = "identity") +
  labs(title = "Class Group Distribution",
       x = "Class Group",
       y = "Count") +
  theme_minimal()

# Visualization 5: Scatter Plot of Exercise vs. Study Time
scatter_plot_exercise_vs_study_time <- ggplot(selected_data, aes(x = study_time, y = exercise_per_week, color = GRADE)) +
  geom_point() +
  labs(title = "Scatter Plot of Exercise vs. Study Time",
       x = "Study Time (hours per week)",
       y = "Exercise per Week") +
  scale_color_gradient(low = "blue", high = "red")

# Arrange and display the plots
grid.arrange(
  histogram_study_time, gender_bar_chart, 
  box_plot_age_performance, class_group_bar_plot, 
  scatter_plot_exercise_vs_study_time, 
  ncol = 2, top = "Exploratory Data Analysis"
)

# Load necessary libraries
library(tidyverse)
library(broom)  # For tidying ANOVA results
library(MASS)   # For logistic regression

# Specify the independent and dependent variables
independent_var <- "study_time"
dependent_var <- "GRADE"

# Perform the Chi-squared Test for Independence (Gender and Grade)
chi_square_test <- chisq.test(selected_data$GRADE, selected_data$gender)

# Perform Logistic Regression (Gender and Grade)
logistic_model <- glm(GRADE ~ gender, data = selected_data, family = binomial(link = "logit"))

# Print results
cat("Chi-squared Test for Independence (Gender and Grade):\n")
print(chi_square_test)

cat("\nLogistic Regression (Gender and Grade):\n")
summary(logistic_model)
