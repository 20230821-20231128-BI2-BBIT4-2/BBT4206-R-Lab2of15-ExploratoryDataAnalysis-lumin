---
title: "Business Intelligence Lab Submission Markdown"
author: "Kelly Noella Sota"
date: "22/09/2023"
output:
  github_document: 
    toc: yes
    toc_depth: 4
    fig_width: 6
    fig_height: 4
    df_print: default
editor_options:
  chunk_output_type: console
---

# Student Details

|                                                   |                                                                                            |
|--------------------------|----------------------------------------------|
| **Student ID Numbers and Names of Group Members** | \<list one student name and ID per line; you should be between 2 and 5 members per group\> |

```         
                                                  Kenneth Kimathi
                                                  Kelly Noella Sota
```

| **BBIT 4.2 Group** \| \<either group A, B, or C\> \|
| **Course Code** \| BBT4206 \|
| **Course Name** \| Business Intelligence II \|
| **Program** \| Bachelor of Business Information Technology \|
| **Semester Duration** \| 21^st^ August 2023 to 28^th^ November 2023 \|

# Setup Chunk

We start by installing the required packages:

``` r
# Install renv:
if (!is.element("renv", installed.packages()[, 1])) {
    install.packages("renv", dependencies = TRUE)
}
require("renv")
```

------------------------------------------------------------------------

**Note:** the following KnitR options have been set as the global defaults:\
`knitr::opts_chunk$set(echo = TRUE, warning = FALSE, eval = TRUE,                        collapse = FALSE, tidy = TRUE)`.

> output:\
> \
> github_document:\
> toc: yes\
> toc_depth: 4\
> fig_width: 6\
> fig_height: 4\
> df_print: default\
> \
> editor_options:\
> chunk_output_type: console

More KnitR options are documented here <https://bookdown.org/yihui/rmarkdown-cookbook/chunk-options.html> and here <https://yihui.org/knitr/options/>.

# Loading the dataset, check its data dimensions and data types

The dataset will be loaded into the project environment. The following code will show us the dataset dimension (number of rows/observations and columns/variables). And the last chuck of code will show the different data types of the variables.

``` r
# Load dataset

StudentPerformance_Dataset_1 <- read.csv("data/StudentPerformance_Dataset_1.csv", header = FALSE,
    stringsAsFactors = TRUE)
```

```         
## Error in file(file, "rt"): cannot open the connection
```

``` r
# Dimensions
dim(StudentPerformance_Dataset_1)
```

```         
## [1] 102 100
```

``` r
# Data types
sapply(StudentPerformance_Dataset_1, class)
```

```         
##       V1       V2       V3       V4       V5       V6       V7       V8       V9      V10 
## "factor" "factor" "factor" "factor" "factor" "factor" "factor" "factor" "factor" "factor" 
##      V11      V12      V13      V14      V15      V16      V17      V18      V19      V20 
## "factor" "factor" "factor" "factor" "factor" "factor" "factor" "factor" "factor" "factor" 
##      V21      V22      V23      V24      V25      V26      V27      V28      V29      V30 
## "factor" "factor" "factor" "factor" "factor" "factor" "factor" "factor" "factor" "factor" 
##      V31      V32      V33      V34      V35      V36      V37      V38      V39      V40 
## "factor" "factor" "factor" "factor" "factor" "factor" "factor" "factor" "factor" "factor" 
##      V41      V42      V43      V44      V45      V46      V47      V48      V49      V50 
## "factor" "factor" "factor" "factor" "factor" "factor" "factor" "factor" "factor" "factor" 
##      V51      V52      V53      V54      V55      V56      V57      V58      V59      V60 
## "factor" "factor" "factor" "factor" "factor" "factor" "factor" "factor" "factor" "factor" 
##      V61      V62      V63      V64      V65      V66      V67      V68      V69      V70 
## "factor" "factor" "factor" "factor" "factor" "factor" "factor" "factor" "factor" "factor" 
##      V71      V72      V73      V74      V75      V76      V77      V78      V79      V80 
## "factor" "factor" "factor" "factor" "factor" "factor" "factor" "factor" "factor" "factor" 
##      V81      V82      V83      V84      V85      V86      V87      V88      V89      V90 
## "factor" "factor" "factor" "factor" "factor" "factor" "factor" "factor" "factor" "factor" 
##      V91      V92      V93      V94      V95      V96      V97      V98      V99     V100 
## "factor" "factor" "factor" "factor" "factor" "factor" "factor" "factor" "factor" "factor"
```

# Dataset reduction

The following code will, firstly, reduce the dataset to a subset, check for its dimension and variables data types.

``` r
subset_StudentPerformance <- StudentPerformance_Dataset_1[, 1:10]
dim(subset_StudentPerformance)
```

```         
## [1] 102  10
```

``` r
sapply(subset_StudentPerformance, class)
```

```         
##       V1       V2       V3       V4       V5       V6       V7       V8       V9      V10 
## "factor" "factor" "factor" "factor" "factor" "factor" "factor" "factor" "factor" "factor"
```

# Frequency and Central Tendency Measure

The frequency provides insights about the distribution of values within a specific variable, in our case the YOB (year of birth). While the central tendency provides the most frequent value of a variable (mode).

``` r
# Frequency Measure
SubsetStudentPerformance_freq <- subset_StudentPerformance$V3
cbind(frequency = table(SubsetStudentPerformance_freq), percentage = prop.table(table(SubsetStudentPerformance_freq)) *
    100)
```

```         
##      frequency percentage
## 1998         2  1.9607843
## 1999         6  5.8823529
## 2000        23 22.5490196
## 2001        41 40.1960784
## 2002        27 26.4705882
## 2003         2  1.9607843
## YOB          1  0.9803922
```

``` r
# Central Tendency Measure
SubsetStudentPerformance_V3_mode <- names(table(subset_StudentPerformance$V3))[which(table(subset_StudentPerformance$V3) ==
    max(table(subset_StudentPerformance$V3)))]
print(SubsetStudentPerformance_V3_mode)
```

```         
## [1] "2001"
```

# Variability Measures

Standard deviation and variance can be calculated for numeric variables. The standard deviation shows how spread out the data values are, while the variance indicates how much each data point varies from the mean of the dataset.

``` r
# Standard Deviation Measure
sapply(subset_StudentPerformance[, 7:10], sd)
```

```         
## V7       V8       V9      V10 
## 1.011101 1.016272 1.020847 1.073317
```

``` r
# Variance Measure
sapply(subset_StudentPerformance[, 7:10], var)
```

```         
## V7       V8       V9      V10 
## 1.022326 1.032809 1.042128 1.152009
```

# Kurtosis and Skewness

Kurtosis measures the degree to which the data distribution is peaked or flat in comparison to a normal distribution, while the skewness measures the lack of symmetry in the distributionof data.

``` r
# Kurtosis Measure
sapply(subset_StudentPerformance[, 7:10], kurtosis, type = 2)
```

``` 
## V7         V8         V9        V10 
## 0.4773881  0.5479114 -0.2217801  0.5967808
```

``` r
# Skewness Measure
sapply(subset_StudentPerformance[, 7:10], skewness, type = 2)
```

```         
## V7         V8         V9        V10 
## 0.2719525 -0.5881365 -0.2065583 -0.7394934
```

# Optional Plots

Histograms and box plots have been created to represent the data distribution. Histogram represents the numeric variables while the the box plots will represent a summary of the distribution of numeric variables.

``` r
# Histogram Creation

subset_StudentPerformance_YOB <- as.numeric(unlist(subset_StudentPerformance[, 3]))
hist(subset_StudentPerformance_YOB, main = names(subset_StudentPerformance)[3])
```

![plot of chunk Histograms, Box Plot](figure/Histograms,%20Box%20Plot-1.png)

``` r
subset_StudentPerformance_read <- as.numeric(unlist(subset_StudentPerformance[, 7]))
hist(subset_StudentPerformance_read, main = names(subset_StudentPerformance)[7])
```

![plot of chunk Histograms, Box Plot](figure/Histograms,%20Box%20Plot-2.png)

``` r
subset_StudentPerformance_anticipate <- as.numeric(unlist(subset_StudentPerformance[, 8]))
hist(subset_StudentPerformance_anticipate, main = names(subset_StudentPerformance)[8])
```

![plot of chunk Histograms, Box Plot](figure/Histograms,%20Box%20Plot-3.png)

``` r
subset_StudentPerformance_answer <- as.numeric(unlist(subset_StudentPerformance[, 9]))
hist(subset_StudentPerformance_answer, main = names(subset_StudentPerformance)[9])
```

![plot of chunk Histograms, Box Plot](figure/Histograms,%20Box%20Plot-4.png)

``` r
subset_StudentPerformance_find <- as.numeric(unlist(subset_StudentPerformance[, 10]))
hist(subset_StudentPerformance_find, main = names(subset_StudentPerformance)[10])
```

![plot of chunk Histograms, Box Plot](figure/Histograms,%20Box%20Plot-5.png)

``` r
# Box and Whisker Plots Creation

subset_StudentPerformance_YOB <- as.numeric(unlist(subset_StudentPerformance[, 3]))
boxplot(subset_StudentPerformance_YOB, main = names(subset_StudentPerformance)[3])
```

![plot of chunk Histograms, Box Plot](figure/Histograms,%20Box%20Plot-6.png)

``` r
subset_StudentPerformance_read <- as.numeric(unlist(subset_StudentPerformance[, 7]))
boxplot(subset_StudentPerformance_read, main = names(subset_StudentPerformance)[7])
```

![plot of chunk Histograms, Box Plot](figure/Histograms,%20Box%20Plot-7.png)

``` r
subset_StudentPerformance_anticipate <- as.numeric(unlist(subset_StudentPerformance[, 8]))
boxplot(subset_StudentPerformance_anticipate, main = names(subset_StudentPerformance)[8])
```

![plot of chunk Histograms, Box Plot](figure/Histograms,%20Box%20Plot-8.png)

``` r
subset_StudentPerformance_answer <- as.numeric(unlist(subset_StudentPerformance[, 9]))
boxplot(subset_StudentPerformance_answer, main = names(subset_StudentPerformance)[9])
```

![plot of chunk Histograms, Box Plot](figure/Histograms,%20Box%20Plot-9.png)

``` r
subset_StudentPerformance_find <- as.numeric(unlist(subset_StudentPerformance[, 10]))
boxplot(subset_StudentPerformance_find, main = names(subset_StudentPerformance)[10])
```

![plot of chunk Histograms, Box Plot](figure/Histograms,%20Box%20Plot-10.png)

**etc.** as per the lab submission requirements.
