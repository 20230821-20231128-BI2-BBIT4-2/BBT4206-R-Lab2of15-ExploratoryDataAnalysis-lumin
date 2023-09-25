#STEP 1. Load the required dataset

StudentPerformance_Dataset_1 <- read.csv("data/StudentPerformance_Dataset_1.csv", header = FALSE,
                         stringsAsFactors = TRUE)

#STEP 2. Dimension of the dataset
dim(StudentPerformance_Dataset_1)

#STEP 3. Data types of the variables
sapply(StudentPerformance_Dataset_1, class)

#STEP 4. Reducing the original dataset and checking for its dimension 
#and variables data types

subset_StudentPerformance <- StudentPerformance_Dataset_1 [,1:10]
dim(subset_StudentPerformance)
sapply(subset_StudentPerformance,class)

#STEP 5. Frequency Measure
SubsetStudentPerformance_freq <- subset_StudentPerformance$V3
cbind(frequency = table(SubsetStudentPerformance_freq),
      percentage = prop.table(table(SubsetStudentPerformance_freq)) * 100)

#STEP 6. Central Tendency Measure
SubsetStudentPerformance_V3_mode <- names(table(
    subset_StudentPerformance$V3))[
    which(table(subset_StudentPerformance$V3) ==
    max(table(subset_StudentPerformance$V3)))
]
print(SubsetStudentPerformance_V3_mode)

#STEP 7. Data Distribution
summary(subset_StudentPerformance)

#STEP 8. Standard Deviation Measure
sapply(subset_StudentPerformance[, 7:10], sd)

#STEP 9. Variance Measure
sapply(subset_StudentPerformance[, 7:10], var)

#STEP 10. Kurtosis Measure
sapply(subset_StudentPerformance[, 7:10], kurtosis, type = 2)

#STEP 11. Skewness Measure
sapply(subset_StudentPerformance[, 7:10], skewness, type = 2)

#STEP 12. Covariance Measure
SubsetPerformance_cov <- cov(subset_StudentPerformance[, 7:10])
View(SubsetPerformance_cov)

#STEP 13. Correlation Measure
SubsetPerformance_cor <- cor(subset_StudentPerformance[, 7:10])
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

