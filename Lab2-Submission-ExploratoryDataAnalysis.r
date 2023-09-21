#STEP 1. Load the required dataset

library(readr)
StudentPerformance_Dataset_1 <- read_csv("data/StudentPerformance-Dataset_1.csv")
View(StudentPerformance_Dataset_1)

#STEP 2. Dimension of the dataset
dim(StudentPerformance_Dataset_1)

#STEP 3. Data types of the variables
sapply(StudentPerformance_Dataset_1, class)

#STEP 4. Reducing the original dataset and checking for its dimension 
#and variables datasets

subset_StudentPerformance <- StudentPerformance_Dataset_1 [,1:10]
dim(subset_StudentPerformance)
sapply(subset_StudentPerformance,class)

#STEP 5. Frequency Measure
SubsetStudentPerformance_freq <- subset_StudentPerformance$YOB
cbind(frequency = table(SubsetStudentPerformance_freq),
      percentage = prop.table(table(SubsetStudentPerformance_freq)) * 100)

#STEP 6. Central Tendency Measure
SubsetStudentPerformance_YOB_mode <- names(table(
    subset_StudentPerformance$YOB))[
    which(table(subset_StudentPerformance$YOB) ==
    max(table(subset_StudentPerformance$YOB)))
]
print(SubsetStudentPerformance_YOB_mode)

#STEP 7. Data Distribution
summary(subset_StudentPerformance)

#STEP 8. Standard Deviation Measure
sapply(subset_StudentPerformance[, -1], sd)

#STEP 9. Variance Measure
sapply(subset_StudentPerformance[, -1], var)

#STEP 10. Kurtosis Measure
sapply(subset_StudentPerformance[, -1], kurtosis, type = 2)

#STEP 11. Skewness Measure
sapply(subset_StudentPerformance[, -1], skewness, type = 2)

#STEP 12. Covariance Measure
SubsetPerformance_cov <- cov(subset_StudentPerformance[, -1])
View(SubsetPerformance_cov)

#STEP 13. Correlation Measure
SubsetPerformance_cor <- cor(subset_StudentPerformance[, -1])
View(SubsetPerformance_cor)

#STEP 14. Histogram Creation

subset_StudentPerformance_YOB <- as.numeric(unlist(subset_StudentPerformance[, 3]))
hist(subset_StudentPerformance_YOB, main = names(subset_StudentPerformance)[3])

subset_StudentPerformance_read <- as.numeric(unlist(subset_StudentPerformance[, 7]))
hist(subset_StudentPerformance_read, main = names(subset_StudentPerformance)[7])

subset_StudentPerformance_anticipate <- as.numeric(unlist(subset_StudentPerformance[, 8]))
hist(subset_StudentPerformance_anticipate, main = names(subset_StudentPerformance)[8])

subset_StudentPerformance_answer <- as.numeric(unlist(subset_StudentPerformance[, 9]))
hist(subset_StudentPerformance_answer, main = names(subset_StudentPerformance)[9])

subset_StudentPerformance_find <- as.numeric(unlist(subset_StudentPerformance[, 10]))
hist(subset_StudentPerformance_find, main = names(subset_StudentPerformance)[10])


#STEP 15. Box and Whisker Plots Creation

subset_StudentPerformance_YOB <- as.numeric(unlist(subset_StudentPerformance[, 3]))
boxplot(subset_StudentPerformance_YOB, main = names(subset_StudentPerformance)[3])

subset_StudentPerformance_read <- as.numeric(unlist(subset_StudentPerformance[, 7]))
boxplot(subset_StudentPerformance_read, main = names(subset_StudentPerformance)[7])

subset_StudentPerformance_anticipate <- as.numeric(unlist(subset_StudentPerformance[, 8]))
boxplot(subset_StudentPerformance_anticipate, main = names(subset_StudentPerformance)[8])

subset_StudentPerformance_answer <- as.numeric(unlist(subset_StudentPerformance[, 9]))
boxplot(subset_StudentPerformance_answer, main = names(subset_StudentPerformance)[9])

subset_StudentPerformance_find <- as.numeric(unlist(subset_StudentPerformance[, 10]))
boxplot(subset_StudentPerformance_find, main = names(subset_StudentPerformance)[10])

#STEP 16. Correlation Plot Creation

ggcorrplot(cor(subset_StudentPerformance[, 7:10]))
