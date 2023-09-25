Business Intelligence Lab Submission Markdown
================
Lumin
\<25/9/23

- [Student Details](#student-details)
- [Setup Chunk](#setup-chunk)
- [SETUP CHUNK](#setup-chunk-1)
  - [Next, let’s load the Student Performance
    Dataset.](#next-lets-load-the-student-performance-dataset)
- [Step 1: Summary Statistics](#step-1-summary-statistics)
  - [Let’s start by examining some basic statistics and the structure of
    the
    dataset.](#lets-start-by-examining-some-basic-statistics-and-the-structure-of-the-dataset)
- [Step 2:Data Processing](#step-2data-processing)
- [Step 3: Measures of Frequency and Summary
  Statistics](#step-3-measures-of-frequency-and-summary-statistics)
  - [In this step, we will calculate measures of frequency and summary
    statistics for selected
    variables.](#in-this-step-we-will-calculate-measures-of-frequency-and-summary-statistics-for-selected-variables)
- [Step 4: Data Visualization](#step-4-data-visualization)
  - [In this step, we will create visualizations to explore the
    data.](#in-this-step-we-will-create-visualizations-to-explore-the-data)
- [Step 5: Statistical Tests](#step-5-statistical-tests)
  - [In this step, we will perform statistical tests to analyze the
    data.](#in-this-step-we-will-perform-statistical-tests-to-analyze-the-data)

# Student Details

| Student ID Numbers and Names of Group Members |
|-----------------------------------------------|
| 112827-Lumin-Kenneth Mungai                   |
| 134265-Lumin-Emmanuel Kiptoo                  |
| 123324-Kelly Noella Sota                      |

**BBIT 4.2 Group**: \<either group A, B, or C\>

**Course Code**: BBT4206

**Course Name**: Business Intelligence II

**Program**: Bachelor of Business Information Technology

**Semester Duration**: 21<sup>st</sup> August 2023 to 28<sup>th</sup>
November 2023

# Setup Chunk

**Note:** the following KnitR options have been set as the global
defaults:  
`knitr::opts_chunk$set(echo = TRUE, warning = FALSE, eval = TRUE,                        collapse = FALSE, tidy = TRUE)`.

> output:  
>   
> github_document:  
> toc: yes  
> toc_depth: 4  
> fig_width: 6  
> fig_height: 4  
> df_print: default  
>   
> editor_options:  
> chunk_output_type: console

More KnitR options are documented here
<https://bookdown.org/yihui/rmarkdown-cookbook/chunk-options.html> and
here <https://yihui.org/knitr/options/>.

# SETUP CHUNK

## Next, let’s load the Student Performance Dataset.

``` r
student_performance_dataset <-
  read_csv("perfomance-dataset.csv",
           col_types =
             cols(
               class_group = col_factor(levels = c("A", "B", "C")),
               gender = col_factor(levels = c("1", "0")),
               YOB = col_date(format = "%Y"),
               regret_choosing_bi = col_factor(levels = c("1", "0")),
               drop_bi_now = col_factor(levels = c("1", "0")),
               motivator = col_factor(levels = c("1", "0")),
               read_content_before_lecture =
                 col_factor(levels = c("1", "2", "3", "4", "5")),
               anticipate_test_questions =
                 col_factor(levels = c("1", "2", "3", "4", "5")),
               answer_rhetorical_questions =
                 col_factor(levels = c("1", "2", "3", "4", "5")),
               find_terms_I_do_not_know =
                 col_factor(levels = c("1", "2", "3", "4", "5")),
               copy_new_terms_in_reading_notebook =
                 col_factor(levels = c("1", "2", "3", "4", "5")),
               take_quizzes_and_use_results =
                 col_factor(levels = c("1", "2", "3", "4", "5")),
               reorganise_course_outline =
                 col_factor(levels = c("1", "2", "3", "4", "5")),
               write_down_important_points =
                 col_factor(levels = c("1", "2", "3", "4", "5")),
               space_out_revision =
                 col_factor(levels = c("1", "2", "3", "4", "5")),
               studying_in_study_group =
                 col_factor(levels = c("1", "2", "3", "4", "5")),
               schedule_appointments =
                 col_factor(levels = c("1", "2", "3", "4", "5")),
               goal_oriented = col_factor(levels = c("1", "0")),
               spaced_repetition =
                 col_factor(levels = c("1", "2", "3", "4")),
               testing_and_active_recall =
                 col_factor(levels = c("1", "2", "3", "4")),
               interleaving = col_factor(levels = c("1", "2", "3", "4")),
               categorizing = col_factor(levels = c("1", "2", "3", "4")),
               retrospective_timetable =
                 col_factor(levels = c("1", "2", "3", "4")),
               cornell_notes = col_factor(levels = c("1", "2", "3", "4")),
               sq3r = col_factor(levels = c("1", "2", "3", "4")),
               commute = col_factor(levels = c("1", "2", "3", "4")),
               study_time = col_factor(levels = c("1", "2", "3", "4")),
               repeats_since_Y1 = col_integer(),
               paid_tuition = col_factor(levels = c("0", "1")),
               free_tuition = col_factor(levels = c("0", "1")),
               extra_curricular = col_factor(levels = c("0", "1")),
               sports_extra_curricular = col_factor(levels = c("0", "1")),
               exercise_per_week = col_factor(levels = c("0", "1", "2", "3")),
               meditate = col_factor(levels = c("0", "1", "2", "3")),
               pray = col_factor(levels = c("0", "1", "2", "3")),
               internet = col_factor(levels = c("0", "1")),
               laptop = col_factor(levels = c("0", "1")),
               family_relationships =
                 col_factor(levels = c("1", "2", "3", "4", "5")),
               friendships = col_factor(levels = c("1", "2", "3", "4", "5")),
               romantic_relationships =
                 col_factor(levels = c("0", "1", "2", "3", "4")),
               spiritual_wellnes =
                 col_factor(levels = c("1", "2", "3", "4", "5")),
               financial_wellness =
                 col_factor(levels = c("1", "2", "3", "4", "5")),
               health = col_factor(levels = c("1", "2", "3", "4", "5")),
               day_out = col_factor(levels = c("0", "1", "2", "3")),
               night_out = col_factor(levels = c("0", "1", "2", "3")),
               alcohol_or_narcotics =
                 col_factor(levels = c("0", "1", "2", "3")),
               mentor = col_factor(levels = c("0", "1")),
               mentor_meetings = col_factor(levels = c("0", "1", "2", "3")),
               `Attendance Waiver Granted: 1 = Yes, 0 = No` =
                 col_factor(levels = c("0", "1")),
               GRADE = col_factor(levels = c("A", "B", "C", "D", "E"))),
           locale = locale())
```

# Step 1: Summary Statistics

## Let’s start by examining some basic statistics and the structure of the dataset.

``` r
# View the first few rows
head(student_performance_dataset)
```

    ## # A tibble: 6 × 100
    ##   class_group gender YOB        regret_choosing_bi drop_bi_now motivator
    ##   <fct>       <fct>  <date>     <fct>              <fct>       <fct>    
    ## 1 A           1      2000-01-01 0                  0           1        
    ## 2 B           1      1999-01-01 0                  0           1        
    ## 3 B           1      2001-01-01 0                  1           1        
    ## 4 B           1      1999-01-01 0                  0           1        
    ## 5 A           1      1999-01-01 0                  0           1        
    ## 6 C           1      2000-01-01 0                  0           1        
    ## # ℹ 94 more variables: read_content_before_lecture <fct>,
    ## #   anticipate_test_questions <fct>, answer_rhetorical_questions <fct>,
    ## #   find_terms_I_do_not_know <fct>, copy_new_terms_in_reading_notebook <fct>,
    ## #   take_quizzes_and_use_results <fct>, reorganise_course_outline <fct>,
    ## #   write_down_important_points <fct>, space_out_revision <fct>,
    ## #   studying_in_study_group <fct>, schedule_appointments <fct>,
    ## #   goal_oriented <fct>, spaced_repetition <fct>, …

``` r
# Structure of the dataset
str(student_performance_dataset)
```

    ## spc_tbl_ [101 × 100] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
    ##  $ class_group                                                                                                                                                                                                                                                                                  : Factor w/ 3 levels "A","B","C": 1 2 2 2 1 3 1 3 1 3 ...
    ##  $ gender                                                                                                                                                                                                                                                                                       : Factor w/ 2 levels "1","0": 1 1 1 1 1 1 2 1 2 1 ...
    ##  $ YOB                                                                                                                                                                                                                                                                                          : Date[1:101], format: "2000-01-01" "1999-01-01" ...
    ##  $ regret_choosing_bi                                                                                                                                                                                                                                                                           : Factor w/ 2 levels "1","0": 2 2 2 2 2 2 2 2 2 2 ...
    ##  $ drop_bi_now                                                                                                                                                                                                                                                                                  : Factor w/ 2 levels "1","0": 2 2 1 2 2 2 2 2 2 2 ...
    ##  $ motivator                                                                                                                                                                                                                                                                                    : Factor w/ 2 levels "1","0": 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ read_content_before_lecture                                                                                                                                                                                                                                                                  : Factor w/ 5 levels "1","2","3","4",..: 5 3 1 2 3 2 2 3 3 3 ...
    ##  $ anticipate_test_questions                                                                                                                                                                                                                                                                    : Factor w/ 5 levels "1","2","3","4",..: 4 3 5 2 4 3 3 3 2 3 ...
    ##  $ answer_rhetorical_questions                                                                                                                                                                                                                                                                  : Factor w/ 5 levels "1","2","3","4",..: 5 3 3 3 4 4 3 4 3 4 ...
    ##  $ find_terms_I_do_not_know                                                                                                                                                                                                                                                                     : Factor w/ 5 levels "1","2","3","4",..: 3 3 5 4 5 3 3 4 5 4 ...
    ##  $ copy_new_terms_in_reading_notebook                                                                                                                                                                                                                                                           : Factor w/ 5 levels "1","2","3","4",..: 5 4 5 3 5 3 3 3 5 4 ...
    ##  $ take_quizzes_and_use_results                                                                                                                                                                                                                                                                 : Factor w/ 5 levels "1","2","3","4",..: 4 4 1 3 5 3 3 2 5 5 ...
    ##  $ reorganise_course_outline                                                                                                                                                                                                                                                                    : Factor w/ 5 levels "1","2","3","4",..: 5 4 4 3 3 3 2 2 5 3 ...
    ##  $ write_down_important_points                                                                                                                                                                                                                                                                  : Factor w/ 5 levels "1","2","3","4",..: 5 5 5 3 5 3 3 4 5 4 ...
    ##  $ space_out_revision                                                                                                                                                                                                                                                                           : Factor w/ 5 levels "1","2","3","4",..: 4 3 1 3 3 2 2 2 3 2 ...
    ##  $ studying_in_study_group                                                                                                                                                                                                                                                                      : Factor w/ 5 levels "1","2","3","4",..: 4 4 1 1 2 3 1 4 1 3 ...
    ##  $ schedule_appointments                                                                                                                                                                                                                                                                        : Factor w/ 5 levels "1","2","3","4",..: 3 2 1 4 2 2 1 2 5 2 ...
    ##  $ goal_oriented                                                                                                                                                                                                                                                                                : Factor w/ 2 levels "1","0": 2 1 2 2 2 2 2 2 1 2 ...
    ##  $ spaced_repetition                                                                                                                                                                                                                                                                            : Factor w/ 4 levels "1","2","3","4": 3 3 1 4 2 2 1 3 4 3 ...
    ##  $ testing_and_active_recall                                                                                                                                                                                                                                                                    : Factor w/ 4 levels "1","2","3","4": 4 3 4 3 3 2 2 3 4 3 ...
    ##  $ interleaving                                                                                                                                                                                                                                                                                 : Factor w/ 4 levels "1","2","3","4": 2 2 2 2 1 2 1 2 2 2 ...
    ##  $ categorizing                                                                                                                                                                                                                                                                                 : Factor w/ 4 levels "1","2","3","4": 3 3 4 2 3 2 1 3 4 2 ...
    ##  $ retrospective_timetable                                                                                                                                                                                                                                                                      : Factor w/ 4 levels "1","2","3","4": 4 3 1 2 3 2 1 2 2 3 ...
    ##  $ cornell_notes                                                                                                                                                                                                                                                                                : Factor w/ 4 levels "1","2","3","4": 4 4 2 3 3 2 1 2 1 4 ...
    ##  $ sq3r                                                                                                                                                                                                                                                                                         : Factor w/ 4 levels "1","2","3","4": 2 3 4 4 3 2 1 3 1 4 ...
    ##  $ commute                                                                                                                                                                                                                                                                                      : Factor w/ 4 levels "1","2","3","4": 4 4 4 1 3 3 4 4 4 4 ...
    ##  $ study_time                                                                                                                                                                                                                                                                                   : Factor w/ 4 levels "1","2","3","4": 2 3 1 2 2 2 1 2 2 2 ...
    ##  $ repeats_since_Y1                                                                                                                                                                                                                                                                             : int [1:101] 4 4 8 4 5 4 2 0 5 2 ...
    ##  $ paid_tuition                                                                                                                                                                                                                                                                                 : Factor w/ 2 levels "0","1": 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ free_tuition                                                                                                                                                                                                                                                                                 : Factor w/ 2 levels "0","1": 1 1 1 2 1 1 2 2 1 1 ...
    ##  $ extra_curricular                                                                                                                                                                                                                                                                             : Factor w/ 2 levels "0","1": 2 2 1 2 1 1 1 2 2 2 ...
    ##  $ sports_extra_curricular                                                                                                                                                                                                                                                                      : Factor w/ 2 levels "0","1": 2 2 1 1 1 1 1 1 1 1 ...
    ##  $ exercise_per_week                                                                                                                                                                                                                                                                            : Factor w/ 4 levels "0","1","2","3": 3 3 2 2 2 3 1 2 1 2 ...
    ##  $ meditate                                                                                                                                                                                                                                                                                     : Factor w/ 4 levels "0","1","2","3": 2 1 1 2 1 1 1 3 1 1 ...
    ##  $ pray                                                                                                                                                                                                                                                                                         : Factor w/ 4 levels "0","1","2","3": 4 4 2 4 2 3 2 1 2 3 ...
    ##  $ internet                                                                                                                                                                                                                                                                                     : Factor w/ 2 levels "0","1": 2 2 2 2 2 2 1 2 2 2 ...
    ##  $ laptop                                                                                                                                                                                                                                                                                       : Factor w/ 2 levels "0","1": 2 2 2 2 2 2 2 2 2 2 ...
    ##  $ family_relationships                                                                                                                                                                                                                                                                         : Factor w/ 5 levels "1","2","3","4",..: 5 4 4 4 4 4 4 4 4 4 ...
    ##  $ friendships                                                                                                                                                                                                                                                                                  : Factor w/ 5 levels "1","2","3","4",..: 5 4 3 2 4 4 4 4 4 4 ...
    ##  $ romantic_relationships                                                                                                                                                                                                                                                                       : Factor w/ 5 levels "0","1","2","3",..: 4 1 5 1 1 1 4 1 4 5 ...
    ##  $ spiritual_wellnes                                                                                                                                                                                                                                                                            : Factor w/ 5 levels "1","2","3","4",..: 4 4 2 5 3 4 3 3 4 3 ...
    ##  $ financial_wellness                                                                                                                                                                                                                                                                           : Factor w/ 5 levels "1","2","3","4",..: 4 2 3 4 3 3 3 3 4 3 ...
    ##  $ health                                                                                                                                                                                                                                                                                       : Factor w/ 5 levels "1","2","3","4",..: 5 3 3 4 3 4 3 3 3 5 ...
    ##  $ day_out                                                                                                                                                                                                                                                                                      : Factor w/ 4 levels "0","1","2","3": 2 3 1 1 2 2 2 2 2 1 ...
    ##  $ night_out                                                                                                                                                                                                                                                                                    : Factor w/ 4 levels "0","1","2","3": 1 4 1 1 2 2 1 2 2 1 ...
    ##  $ alcohol_or_narcotics                                                                                                                                                                                                                                                                         : Factor w/ 4 levels "0","1","2","3": 1 1 2 1 2 2 1 2 2 1 ...
    ##  $ mentor                                                                                                                                                                                                                                                                                       : Factor w/ 2 levels "0","1": 2 2 1 1 1 1 1 1 2 1 ...
    ##  $ mentor_meetings                                                                                                                                                                                                                                                                              : Factor w/ 4 levels "0","1","2","3": 3 3 1 1 1 1 1 1 2 1 ...
    ##  $ A - 1. I am enjoying the subject                                                                                                                                                                                                                                                             : num [1:101] 5 5 4 5 5 3 5 4 5 3 ...
    ##  $ A - 2. Classes start and end on time                                                                                                                                                                                                                                                         : num [1:101] 5 5 5 4 5 5 4 5 5 5 ...
    ##  $ A - 3. The learning environment is participative, involves learning by doing and is group-based                                                                                                                                                                                              : num [1:101] 5 5 4 3 5 5 3 3 4 4 ...
    ##  $ A - 4. The subject content is delivered according to the course outline and meets my expectations                                                                                                                                                                                            : num [1:101] 5 5 5 4 5 5 4 5 4 5 ...
    ##  $ A - 5. The topics are clear and logically developed                                                                                                                                                                                                                                          : num [1:101] 5 5 5 5 4 4 4 5 4 5 ...
    ##  $ A - 6. I am developing my oral and writing skills                                                                                                                                                                                                                                            : num [1:101] 4 5 5 3 4 4 3 4 3 3 ...
    ##  $ A - 7. I am developing my reflective and critical reasoning skills                                                                                                                                                                                                                           : num [1:101] 4 5 5 4 4 4 4 4 3 3 ...
    ##  $ A - 8. The assessment methods are assisting me to learn                                                                                                                                                                                                                                      : num [1:101] 5 4 5 4 4 5 4 5 5 4 ...
    ##  $ A - 9. I receive relevant feedback                                                                                                                                                                                                                                                           : num [1:101] 5 5 5 4 4 4 4 5 4 4 ...
    ##  $ A - 10. I read the recommended readings and notes                                                                                                                                                                                                                                            : num [1:101] 5 5 4 5 4 4 5 4 5 5 ...
    ##  $ A - 11. I use the eLearning material posted                                                                                                                                                                                                                                                  : num [1:101] 5 5 5 5 5 4 5 5 5 5 ...
    ##  $ B - 1. Concept 1 of 6: Principles of Business Intelligence and the DataOps Philosophy                                                                                                                                                                                                        : num [1:101] 4 4 4 5 5 3 4 4 5 4 ...
    ##  $ B - 2. Concept 3 of 6: Linear Algorithms for Predictive Analytics                                                                                                                                                                                                                            : num [1:101] 5 5 4 3 5 3 4 4 5 2 ...
    ##  $ C - 2. Quizzes at the end of each concept                                                                                                                                                                                                                                                    : num [1:101] 5 4 5 5 5 5 5 5 5 4 ...
    ##  $ C - 3. Lab manuals that outline the steps to follow during the labs                                                                                                                                                                                                                          : num [1:101] 5 3 5 5 5 5 5 5 5 4 ...
    ##  $ C - 4. Required lab work submissions at the end of each lab manual that outline the activity to be done on your own                                                                                                                                                                          : num [1:101] 5 3 5 4 5 5 5 4 5 5 ...
    ##  $ C - 5. Supplementary videos to watch                                                                                                                                                                                                                                                         : num [1:101] 5 4 4 4 4 5 4 3 4 3 ...
    ##  $ C - 6. Supplementary podcasts to listen to                                                                                                                                                                                                                                                   : num [1:101] 5 3 4 4 4 5 1 4 4 3 ...
    ##  $ C - 7. Supplementary content to read                                                                                                                                                                                                                                                         : num [1:101] 5 4 4 4 5 5 1 4 5 3 ...
    ##  $ C - 8. Lectures slides                                                                                                                                                                                                                                                                       : num [1:101] 5 3 5 4 5 5 5 4 4 5 ...
    ##  $ C - 9. Lecture notes on some of the lecture slides                                                                                                                                                                                                                                           : num [1:101] 5 4 5 5 5 3 4 4 5 5 ...
    ##  $ C - 10. The quality of the lectures given (quality measured by the breadth (the full span of knowledge of a subject) and depth (the extent to which specific topics are focused upon, amplified, and explored) of learning - NOT quality measured by how fun/comical/lively the lectures are): num [1:101] 5 3 5 5 5 5 4 4 4 4 ...
    ##  $ C - 11. The division of theory and practice such that most of the theory is done during the recorded online classes and most of the practice is done during the physical classes                                                                                                             : num [1:101] 5 4 5 3 5 5 3 5 3 5 ...
    ##  $ C - 12. The recordings of online classes                                                                                                                                                                                                                                                     : num [1:101] 5 3 5 4 4 5 3 4 3 5 ...
    ##  $ D - 1. 
    ## Write two things you like about the teaching and learning in this unit so far.                                                                                                                                                                                                      : chr [1:101] "It is well taught and the assessment are helping me learn" "It is very detailed and understandable " "systematic  well explained" "The lecturer is thorough in his work The notes provided are comprehensive and useful" ...
    ##  $ D - 2. Write at least one recommendation to improve the teaching and learning in this unit (for the remaining weeks in the semester)                                                                                                                                                         : chr [1:101] "none." "it is already at its best" "Just a little flexibility in operations. e.g. make up CATs " "The lecturer could be more lively and interactive in class as well as using examples that could help better und"| __truncated__ ...
    ##  $ Average Course Evaluation Rating                                                                                                                                                                                                                                                             : num [1:101] 4.82 4.91 4.73 4.18 4.45 ...
    ##  $ Average Level of Learning Attained Rating                                                                                                                                                                                                                                                    : num [1:101] 4.5 4.5 4 4 5 3 4 4 5 3 ...
    ##  $ Average Pedagogical Strategy Effectiveness Rating                                                                                                                                                                                                                                            : num [1:101] 5 3.45 4.73 4.27 4.73 ...
    ##  $ Project: Section 1-4: (20%) x/10                                                                                                                                                                                                                                                             : num [1:101] 9 8.5 8.4 9 9 8.5 8 10 8.5 7.4 ...
    ##  $ Project: Section 5-11: (50%) x/10                                                                                                                                                                                                                                                            : num [1:101] 8.5 7.8 7 0 6 7.8 3 8 7.8 8 ...
    ##  $ Project: Section 12: (30%) x/5                                                                                                                                                                                                                                                               : num [1:101] 0 0 0 0 0 0 0 3.5 0 2 ...
    ##  $ Project: (10%): x/30 x 100 TOTAL                                                                                                                                                                                                                                                             : num [1:101] 70 65.2 61.6 36 60 65.2 44 86 65.2 69.6 ...
    ##  $ Quiz 1 on Concept 1 (Introduction) x/32                                                                                                                                                                                                                                                      : num [1:101] 19.6 19.7 11.3 18.8 13.3 ...
    ##  $ Quiz 3 on Concept 3 (Linear) x/15                                                                                                                                                                                                                                                            : num [1:101] 12 11 4.5 7 7 8 5 5 11 10 ...
    ##  $ Quiz 4 on Concept 4 (Non-Linear) x/22                                                                                                                                                                                                                                                        : num [1:101] 21.67 11.42 12.08 10.42 8.33 ...
    ##  $ Quiz 5 on Concept 5 (Dashboarding) x/10                                                                                                                                                                                                                                                      : num [1:101] 7.33 5 2.67 NA 8.33 6.5 6.33 6 NA 7.67 ...
    ##  $ Quizzes and  Bonus Marks (7%): x/79 x 100 TOTAL                                                                                                                                                                                                                                              : num [1:101] 76.7 59.7 38.6 45.9 46.8 ...
    ##  $ Lab 1 - 2.c. - (Simple Linear Regression) x/5                                                                                                                                                                                                                                                : num [1:101] 5 5 NA 4 5 5 5 5 5 5 ...
    ##  $ Lab 2 - 2.e. -  (Linear Regression using Gradient Descent) x/5                                                                                                                                                                                                                               : num [1:101] 5 3 NA 5 4 2.15 3 2.15 4.5 3.45 ...
    ##  $ Lab 3 - 2.g. - (Logistic Regression using Gradient Descent) x/5                                                                                                                                                                                                                              : num [1:101] 5 4.85 NA 4.85 5 4.85 4.85 4.85 5 2.85 ...
    ##  $ Lab 4 - 2.h. - (Linear Discriminant Analysis) x/5                                                                                                                                                                                                                                            : num [1:101] 5 NA 4.45 NA 5 2.85 NA 2.85 4.85 5 ...
    ##  $ Lab 5 - Chart JS Dashboard Setup x/5                                                                                                                                                                                                                                                         : num [1:101] 0 0 0 5 0 0 0 0 0 5 ...
    ##  $ Lab Work (7%) x/25 x 100                                                                                                                                                                                                                                                                     : num [1:101] 80 51.4 17.8 75.4 76 59.4 51.4 59.4 77.4 85.2 ...
    ##  $ CAT 1 (8%): x/38 x 100                                                                                                                                                                                                                                                                       : num [1:101] 55.3 63.1 NA 59.2 69.7 ...
    ##  $ CAT 2 (8%): x/100 x 100                                                                                                                                                                                                                                                                      : num [1:101] 43 NA NA NA 52 NA NA 88 NA 60 ...
    ##  $ Attendance Waiver Granted: 1 = Yes, 0 = No                                                                                                                                                                                                                                                   : Factor w/ 2 levels "0","1": 1 1 1 1 1 1 2 1 2 1 ...
    ##  $ Absenteeism Percentage                                                                                                                                                                                                                                                                       : num [1:101] 19.2 22.2 11.1 3.7 11.1 ...
    ##  $ Coursework TOTAL: x/40 (40%)                                                                                                                                                                                                                                                                 : num [1:101] 25.8 19.3 10.1 16.8 24.3 ...
    ##  $ EXAM: x/60 (60%)                                                                                                                                                                                                                                                                             : num [1:101] 43 28 44 24 36 NA 44 18 36 20 ...
    ##  $ TOTAL = Coursework TOTAL + EXAM (100%)                                                                                                                                                                                                                                                       : num [1:101] 68.8 47.3 54.1 40.8 60.3 ...
    ##   [list output truncated]
    ##  - attr(*, "spec")=
    ##   .. cols(
    ##   ..   class_group = col_factor(levels = c("A", "B", "C"), ordered = FALSE, include_na = FALSE),
    ##   ..   gender = col_factor(levels = c("1", "0"), ordered = FALSE, include_na = FALSE),
    ##   ..   YOB = col_date(format = "%Y"),
    ##   ..   regret_choosing_bi = col_factor(levels = c("1", "0"), ordered = FALSE, include_na = FALSE),
    ##   ..   drop_bi_now = col_factor(levels = c("1", "0"), ordered = FALSE, include_na = FALSE),
    ##   ..   motivator = col_factor(levels = c("1", "0"), ordered = FALSE, include_na = FALSE),
    ##   ..   read_content_before_lecture = col_factor(levels = c("1", "2", "3", "4", "5"), ordered = FALSE, include_na = FALSE),
    ##   ..   anticipate_test_questions = col_factor(levels = c("1", "2", "3", "4", "5"), ordered = FALSE, include_na = FALSE),
    ##   ..   answer_rhetorical_questions = col_factor(levels = c("1", "2", "3", "4", "5"), ordered = FALSE, include_na = FALSE),
    ##   ..   find_terms_I_do_not_know = col_factor(levels = c("1", "2", "3", "4", "5"), ordered = FALSE, include_na = FALSE),
    ##   ..   copy_new_terms_in_reading_notebook = col_factor(levels = c("1", "2", "3", "4", "5"), ordered = FALSE, include_na = FALSE),
    ##   ..   take_quizzes_and_use_results = col_factor(levels = c("1", "2", "3", "4", "5"), ordered = FALSE, include_na = FALSE),
    ##   ..   reorganise_course_outline = col_factor(levels = c("1", "2", "3", "4", "5"), ordered = FALSE, include_na = FALSE),
    ##   ..   write_down_important_points = col_factor(levels = c("1", "2", "3", "4", "5"), ordered = FALSE, include_na = FALSE),
    ##   ..   space_out_revision = col_factor(levels = c("1", "2", "3", "4", "5"), ordered = FALSE, include_na = FALSE),
    ##   ..   studying_in_study_group = col_factor(levels = c("1", "2", "3", "4", "5"), ordered = FALSE, include_na = FALSE),
    ##   ..   schedule_appointments = col_factor(levels = c("1", "2", "3", "4", "5"), ordered = FALSE, include_na = FALSE),
    ##   ..   goal_oriented = col_factor(levels = c("1", "0"), ordered = FALSE, include_na = FALSE),
    ##   ..   spaced_repetition = col_factor(levels = c("1", "2", "3", "4"), ordered = FALSE, include_na = FALSE),
    ##   ..   testing_and_active_recall = col_factor(levels = c("1", "2", "3", "4"), ordered = FALSE, include_na = FALSE),
    ##   ..   interleaving = col_factor(levels = c("1", "2", "3", "4"), ordered = FALSE, include_na = FALSE),
    ##   ..   categorizing = col_factor(levels = c("1", "2", "3", "4"), ordered = FALSE, include_na = FALSE),
    ##   ..   retrospective_timetable = col_factor(levels = c("1", "2", "3", "4"), ordered = FALSE, include_na = FALSE),
    ##   ..   cornell_notes = col_factor(levels = c("1", "2", "3", "4"), ordered = FALSE, include_na = FALSE),
    ##   ..   sq3r = col_factor(levels = c("1", "2", "3", "4"), ordered = FALSE, include_na = FALSE),
    ##   ..   commute = col_factor(levels = c("1", "2", "3", "4"), ordered = FALSE, include_na = FALSE),
    ##   ..   study_time = col_factor(levels = c("1", "2", "3", "4"), ordered = FALSE, include_na = FALSE),
    ##   ..   repeats_since_Y1 = col_integer(),
    ##   ..   paid_tuition = col_factor(levels = c("0", "1"), ordered = FALSE, include_na = FALSE),
    ##   ..   free_tuition = col_factor(levels = c("0", "1"), ordered = FALSE, include_na = FALSE),
    ##   ..   extra_curricular = col_factor(levels = c("0", "1"), ordered = FALSE, include_na = FALSE),
    ##   ..   sports_extra_curricular = col_factor(levels = c("0", "1"), ordered = FALSE, include_na = FALSE),
    ##   ..   exercise_per_week = col_factor(levels = c("0", "1", "2", "3"), ordered = FALSE, include_na = FALSE),
    ##   ..   meditate = col_factor(levels = c("0", "1", "2", "3"), ordered = FALSE, include_na = FALSE),
    ##   ..   pray = col_factor(levels = c("0", "1", "2", "3"), ordered = FALSE, include_na = FALSE),
    ##   ..   internet = col_factor(levels = c("0", "1"), ordered = FALSE, include_na = FALSE),
    ##   ..   laptop = col_factor(levels = c("0", "1"), ordered = FALSE, include_na = FALSE),
    ##   ..   family_relationships = col_factor(levels = c("1", "2", "3", "4", "5"), ordered = FALSE, include_na = FALSE),
    ##   ..   friendships = col_factor(levels = c("1", "2", "3", "4", "5"), ordered = FALSE, include_na = FALSE),
    ##   ..   romantic_relationships = col_factor(levels = c("0", "1", "2", "3", "4"), ordered = FALSE, include_na = FALSE),
    ##   ..   spiritual_wellnes = col_factor(levels = c("1", "2", "3", "4", "5"), ordered = FALSE, include_na = FALSE),
    ##   ..   financial_wellness = col_factor(levels = c("1", "2", "3", "4", "5"), ordered = FALSE, include_na = FALSE),
    ##   ..   health = col_factor(levels = c("1", "2", "3", "4", "5"), ordered = FALSE, include_na = FALSE),
    ##   ..   day_out = col_factor(levels = c("0", "1", "2", "3"), ordered = FALSE, include_na = FALSE),
    ##   ..   night_out = col_factor(levels = c("0", "1", "2", "3"), ordered = FALSE, include_na = FALSE),
    ##   ..   alcohol_or_narcotics = col_factor(levels = c("0", "1", "2", "3"), ordered = FALSE, include_na = FALSE),
    ##   ..   mentor = col_factor(levels = c("0", "1"), ordered = FALSE, include_na = FALSE),
    ##   ..   mentor_meetings = col_factor(levels = c("0", "1", "2", "3"), ordered = FALSE, include_na = FALSE),
    ##   ..   `A - 1. I am enjoying the subject` = col_double(),
    ##   ..   `A - 2. Classes start and end on time` = col_double(),
    ##   ..   `A - 3. The learning environment is participative, involves learning by doing and is group-based` = col_double(),
    ##   ..   `A - 4. The subject content is delivered according to the course outline and meets my expectations` = col_double(),
    ##   ..   `A - 5. The topics are clear and logically developed` = col_double(),
    ##   ..   `A - 6. I am developing my oral and writing skills` = col_double(),
    ##   ..   `A - 7. I am developing my reflective and critical reasoning skills` = col_double(),
    ##   ..   `A - 8. The assessment methods are assisting me to learn` = col_double(),
    ##   ..   `A - 9. I receive relevant feedback` = col_double(),
    ##   ..   `A - 10. I read the recommended readings and notes` = col_double(),
    ##   ..   `A - 11. I use the eLearning material posted` = col_double(),
    ##   ..   `B - 1. Concept 1 of 6: Principles of Business Intelligence and the DataOps Philosophy` = col_double(),
    ##   ..   `B - 2. Concept 3 of 6: Linear Algorithms for Predictive Analytics` = col_double(),
    ##   ..   `C - 2. Quizzes at the end of each concept` = col_double(),
    ##   ..   `C - 3. Lab manuals that outline the steps to follow during the labs` = col_double(),
    ##   ..   `C - 4. Required lab work submissions at the end of each lab manual that outline the activity to be done on your own` = col_double(),
    ##   ..   `C - 5. Supplementary videos to watch` = col_double(),
    ##   ..   `C - 6. Supplementary podcasts to listen to` = col_double(),
    ##   ..   `C - 7. Supplementary content to read` = col_double(),
    ##   ..   `C - 8. Lectures slides` = col_double(),
    ##   ..   `C - 9. Lecture notes on some of the lecture slides` = col_double(),
    ##   ..   `C - 10. The quality of the lectures given (quality measured by the breadth (the full span of knowledge of a subject) and depth (the extent to which specific topics are focused upon, amplified, and explored) of learning - NOT quality measured by how fun/comical/lively the lectures are)` = col_double(),
    ##   ..   `C - 11. The division of theory and practice such that most of the theory is done during the recorded online classes and most of the practice is done during the physical classes` = col_double(),
    ##   ..   `C - 12. The recordings of online classes` = col_double(),
    ##   ..   `D - 1. 
    ##   .. Write two things you like about the teaching and learning in this unit so far.` = col_character(),
    ##   ..   `D - 2. Write at least one recommendation to improve the teaching and learning in this unit (for the remaining weeks in the semester)` = col_character(),
    ##   ..   `Average Course Evaluation Rating` = col_double(),
    ##   ..   `Average Level of Learning Attained Rating` = col_double(),
    ##   ..   `Average Pedagogical Strategy Effectiveness Rating` = col_double(),
    ##   ..   `Project: Section 1-4: (20%) x/10` = col_double(),
    ##   ..   `Project: Section 5-11: (50%) x/10` = col_double(),
    ##   ..   `Project: Section 12: (30%) x/5` = col_double(),
    ##   ..   `Project: (10%): x/30 x 100 TOTAL` = col_double(),
    ##   ..   `Quiz 1 on Concept 1 (Introduction) x/32` = col_double(),
    ##   ..   `Quiz 3 on Concept 3 (Linear) x/15` = col_double(),
    ##   ..   `Quiz 4 on Concept 4 (Non-Linear) x/22` = col_double(),
    ##   ..   `Quiz 5 on Concept 5 (Dashboarding) x/10` = col_double(),
    ##   ..   `Quizzes and  Bonus Marks (7%): x/79 x 100 TOTAL` = col_double(),
    ##   ..   `Lab 1 - 2.c. - (Simple Linear Regression) x/5` = col_double(),
    ##   ..   `Lab 2 - 2.e. -  (Linear Regression using Gradient Descent) x/5` = col_double(),
    ##   ..   `Lab 3 - 2.g. - (Logistic Regression using Gradient Descent) x/5` = col_double(),
    ##   ..   `Lab 4 - 2.h. - (Linear Discriminant Analysis) x/5` = col_double(),
    ##   ..   `Lab 5 - Chart JS Dashboard Setup x/5` = col_double(),
    ##   ..   `Lab Work (7%) x/25 x 100` = col_double(),
    ##   ..   `CAT 1 (8%): x/38 x 100` = col_double(),
    ##   ..   `CAT 2 (8%): x/100 x 100` = col_double(),
    ##   ..   `Attendance Waiver Granted: 1 = Yes, 0 = No` = col_factor(levels = c("0", "1"), ordered = FALSE, include_na = FALSE),
    ##   ..   `Absenteeism Percentage` = col_double(),
    ##   ..   `Coursework TOTAL: x/40 (40%)` = col_double(),
    ##   ..   `EXAM: x/60 (60%)` = col_double(),
    ##   ..   `TOTAL = Coursework TOTAL + EXAM (100%)` = col_double(),
    ##   ..   GRADE = col_factor(levels = c("A", "B", "C", "D", "E"), ordered = FALSE, include_na = FALSE)
    ##   .. )
    ##  - attr(*, "problems")=<externalptr>

``` r
# Summary statistics
summary(student_performance_dataset)
```

    ##  class_group gender      YOB             regret_choosing_bi drop_bi_now
    ##  A:23        1:58   Min.   :1998-01-01   1: 2               1: 2       
    ##  B:37        0:43   1st Qu.:2000-01-01   0:99               0:99       
    ##  C:41               Median :2001-01-01                                 
    ##                     Mean   :2000-11-25                                 
    ##                     3rd Qu.:2002-01-01                                 
    ##                     Max.   :2003-01-01                                 
    ##                                                                        
    ##  motivator read_content_before_lecture anticipate_test_questions
    ##  1:76      1:11                        1: 5                     
    ##  0:25      2:25                        2: 6                     
    ##            3:47                        3:31                     
    ##            4:14                        4:43                     
    ##            5: 4                        5:16                     
    ##                                                                 
    ##                                                                 
    ##  answer_rhetorical_questions find_terms_I_do_not_know
    ##  1: 3                        1: 6                    
    ##  2:15                        2: 2                    
    ##  3:32                        3:30                    
    ##  4:38                        4:37                    
    ##  5:13                        5:26                    
    ##                                                      
    ##                                                      
    ##  copy_new_terms_in_reading_notebook take_quizzes_and_use_results
    ##  1: 5                               1: 4                        
    ##  2:10                               2: 5                        
    ##  3:24                               3:22                        
    ##  4:37                               4:32                        
    ##  5:25                               5:38                        
    ##                                                                 
    ##                                                                 
    ##  reorganise_course_outline write_down_important_points space_out_revision
    ##  1: 7                      1: 4                        1: 8              
    ##  2:16                      2: 8                        2:17              
    ##  3:28                      3:20                        3:34              
    ##  4:32                      4:38                        4:28              
    ##  5:18                      5:31                        5:14              
    ##                                                                          
    ##                                                                          
    ##  studying_in_study_group schedule_appointments goal_oriented spaced_repetition
    ##  1:34                    1:42                  1:20          1:12             
    ##  2:21                    2:35                  0:81          2:31             
    ##  3:21                    3:16                                3:48             
    ##  4:16                    4: 5                                4:10             
    ##  5: 9                    5: 3                                                 
    ##                                                                               
    ##                                                                               
    ##  testing_and_active_recall interleaving categorizing retrospective_timetable
    ##  1: 2                      1:14         1: 6         1:17                   
    ##  2:17                      2:51         2:28         2:36                   
    ##  3:55                      3:32         3:56         3:38                   
    ##  4:27                      4: 4         4:11         4:10                   
    ##                                                                             
    ##                                                                             
    ##                                                                             
    ##  cornell_notes sq3r   commute   study_time repeats_since_Y1 paid_tuition
    ##  1:19          1:18   1   :16   1   :45    Min.   : 0.00    0   :89     
    ##  2:26          2:28   2   :23   2   :39    1st Qu.: 0.00    1   :11     
    ##  3:38          3:30   3   :33   3   :12    Median : 2.00    NA's: 1     
    ##  4:18          4:25   4   :28   4   : 4    Mean   : 2.05                
    ##                       NA's: 1   NA's: 1    3rd Qu.: 3.00                
    ##                                            Max.   :10.00                
    ##                                            NA's   :1                    
    ##  free_tuition extra_curricular sports_extra_curricular exercise_per_week
    ##  0   :73      0   :47          0   :64                 0   :23          
    ##  1   :27      1   :53          1   :36                 1   :49          
    ##  NA's: 1      NA's: 1          NA's: 1                 2   :23          
    ##                                                        3   : 5          
    ##                                                        NA's: 1          
    ##                                                                         
    ##                                                                         
    ##  meditate    pray    internet   laptop    family_relationships friendships
    ##  0   :49   0   : 8   0   :13   0   :  0   1   : 0              1   : 0    
    ##  1   :35   1   :24   1   :87   1   :100   2   : 2              2   : 3    
    ##  2   : 7   2   :19   NA's: 1   NA's:  1   3   :18              3   :17    
    ##  3   : 9   3   :49                        4   :39              4   :56    
    ##  NA's: 1   NA's: 1                        5   :41              5   :24    
    ##                                           NA's: 1              NA's: 1    
    ##                                                                           
    ##  romantic_relationships spiritual_wellnes financial_wellness  health  
    ##  0   :56                1   : 1           1   :10            1   : 2  
    ##  1   : 0                2   : 8           2   :18            2   : 3  
    ##  2   : 6                3   :37           3   :41            3   :22  
    ##  3   :27                4   :33           4   :21            4   :35  
    ##  4   :11                5   :21           5   :10            5   :38  
    ##  NA's: 1                NA's: 1           NA's: 1            NA's: 1  
    ##                                                                       
    ##  day_out   night_out alcohol_or_narcotics  mentor   mentor_meetings
    ##  0   :27   0   :55   0   :68              0   :59   0   :53        
    ##  1   :67   1   :41   1   :30              1   :41   1   :29        
    ##  2   : 5   2   : 2   2   : 1              NA's: 1   2   :15        
    ##  3   : 1   3   : 2   3   : 1                        3   : 3        
    ##  NA's: 1   NA's: 1   NA's: 1                        NA's: 1        
    ##                                                                    
    ##                                                                    
    ##  A - 1. I am enjoying the subject A - 2. Classes start and end on time
    ##  Min.   :3.00                     Min.   :3.00                        
    ##  1st Qu.:4.00                     1st Qu.:4.00                        
    ##  Median :5.00                     Median :5.00                        
    ##  Mean   :4.49                     Mean   :4.68                        
    ##  3rd Qu.:5.00                     3rd Qu.:5.00                        
    ##  Max.   :5.00                     Max.   :5.00                        
    ##  NA's   :1                        NA's   :1                           
    ##  A - 3. The learning environment is participative, involves learning by doing and is group-based
    ##  Min.   :3.00                                                                                   
    ##  1st Qu.:4.00                                                                                   
    ##  Median :4.00                                                                                   
    ##  Mean   :4.35                                                                                   
    ##  3rd Qu.:5.00                                                                                   
    ##  Max.   :5.00                                                                                   
    ##  NA's   :1                                                                                      
    ##  A - 4. The subject content is delivered according to the course outline and meets my expectations
    ##  Min.   :3.00                                                                                     
    ##  1st Qu.:4.75                                                                                     
    ##  Median :5.00                                                                                     
    ##  Mean   :4.74                                                                                     
    ##  3rd Qu.:5.00                                                                                     
    ##  Max.   :5.00                                                                                     
    ##  NA's   :1                                                                                        
    ##  A - 5. The topics are clear and logically developed
    ##  Min.   :2.00                                       
    ##  1st Qu.:4.00                                       
    ##  Median :5.00                                       
    ##  Mean   :4.65                                       
    ##  3rd Qu.:5.00                                       
    ##  Max.   :5.00                                       
    ##  NA's   :1                                          
    ##  A - 6. I am developing my oral and writing skills
    ##  Min.   :1.00                                     
    ##  1st Qu.:4.00                                     
    ##  Median :4.00                                     
    ##  Mean   :4.11                                     
    ##  3rd Qu.:5.00                                     
    ##  Max.   :5.00                                     
    ##  NA's   :1                                        
    ##  A - 7. I am developing my reflective and critical reasoning skills
    ##  Min.   :2.00                                                      
    ##  1st Qu.:4.00                                                      
    ##  Median :4.00                                                      
    ##  Mean   :4.38                                                      
    ##  3rd Qu.:5.00                                                      
    ##  Max.   :5.00                                                      
    ##  NA's   :1                                                         
    ##  A - 8. The assessment methods are assisting me to learn
    ##  Min.   :1.00                                           
    ##  1st Qu.:4.00                                           
    ##  Median :5.00                                           
    ##  Mean   :4.61                                           
    ##  3rd Qu.:5.00                                           
    ##  Max.   :5.00                                           
    ##  NA's   :1                                              
    ##  A - 9. I receive relevant feedback
    ##  Min.   :3.00                      
    ##  1st Qu.:4.00                      
    ##  Median :5.00                      
    ##  Mean   :4.58                      
    ##  3rd Qu.:5.00                      
    ##  Max.   :5.00                      
    ##  NA's   :1                         
    ##  A - 10. I read the recommended readings and notes
    ##  Min.   :3.00                                     
    ##  1st Qu.:4.00                                     
    ##  Median :5.00                                     
    ##  Mean   :4.55                                     
    ##  3rd Qu.:5.00                                     
    ##  Max.   :5.00                                     
    ##  NA's   :1                                        
    ##  A - 11. I use the eLearning material posted
    ##  Min.   :3.0                                
    ##  1st Qu.:4.0                                
    ##  Median :5.0                                
    ##  Mean   :4.7                                
    ##  3rd Qu.:5.0                                
    ##  Max.   :5.0                                
    ##  NA's   :1                                  
    ##  B - 1. Concept 1 of 6: Principles of Business Intelligence and the DataOps Philosophy
    ##  Min.   :1.00                                                                         
    ##  1st Qu.:4.00                                                                         
    ##  Median :4.00                                                                         
    ##  Mean   :4.25                                                                         
    ##  3rd Qu.:5.00                                                                         
    ##  Max.   :5.00                                                                         
    ##  NA's   :1                                                                            
    ##  B - 2. Concept 3 of 6: Linear Algorithms for Predictive Analytics
    ##  Min.   :2.00                                                     
    ##  1st Qu.:3.00                                                     
    ##  Median :4.00                                                     
    ##  Mean   :3.94                                                     
    ##  3rd Qu.:5.00                                                     
    ##  Max.   :5.00                                                     
    ##  NA's   :1                                                        
    ##  C - 2. Quizzes at the end of each concept
    ##  Min.   :2.00                             
    ##  1st Qu.:4.00                             
    ##  Median :5.00                             
    ##  Mean   :4.59                             
    ##  3rd Qu.:5.00                             
    ##  Max.   :5.00                             
    ##  NA's   :1                                
    ##  C - 3. Lab manuals that outline the steps to follow during the labs
    ##  Min.   :3.00                                                       
    ##  1st Qu.:4.00                                                       
    ##  Median :5.00                                                       
    ##  Mean   :4.61                                                       
    ##  3rd Qu.:5.00                                                       
    ##  Max.   :5.00                                                       
    ##  NA's   :1                                                          
    ##  C - 4. Required lab work submissions at the end of each lab manual that outline the activity to be done on your own
    ##  Min.   :3.00                                                                                                       
    ##  1st Qu.:4.00                                                                                                       
    ##  Median :5.00                                                                                                       
    ##  Mean   :4.55                                                                                                       
    ##  3rd Qu.:5.00                                                                                                       
    ##  Max.   :5.00                                                                                                       
    ##  NA's   :1                                                                                                          
    ##  C - 5. Supplementary videos to watch
    ##  Min.   :1.00                        
    ##  1st Qu.:4.00                        
    ##  Median :4.00                        
    ##  Mean   :4.19                        
    ##  3rd Qu.:5.00                        
    ##  Max.   :5.00                        
    ##  NA's   :1                           
    ##  C - 6. Supplementary podcasts to listen to
    ##  Min.   :1.00                              
    ##  1st Qu.:4.00                              
    ##  Median :4.00                              
    ##  Mean   :4.08                              
    ##  3rd Qu.:5.00                              
    ##  Max.   :5.00                              
    ##  NA's   :1                                 
    ##  C - 7. Supplementary content to read C - 8. Lectures slides
    ##  Min.   :1.00                         Min.   :2.0           
    ##  1st Qu.:4.00                         1st Qu.:4.0           
    ##  Median :4.00                         Median :5.0           
    ##  Mean   :4.17                         Mean   :4.6           
    ##  3rd Qu.:5.00                         3rd Qu.:5.0           
    ##  Max.   :5.00                         Max.   :5.0           
    ##  NA's   :1                            NA's   :1             
    ##  C - 9. Lecture notes on some of the lecture slides
    ##  Min.   :2.0                                       
    ##  1st Qu.:4.0                                       
    ##  Median :5.0                                       
    ##  Mean   :4.6                                       
    ##  3rd Qu.:5.0                                       
    ##  Max.   :5.0                                       
    ##  NA's   :1                                         
    ##  C - 10. The quality of the lectures given (quality measured by the breadth (the full span of knowledge of a subject) and depth (the extent to which specific topics are focused upon, amplified, and explored) of learning - NOT quality measured by how fun/comical/lively the lectures are)
    ##  Min.   :2.00                                                                                                                                                                                                                                                                                 
    ##  1st Qu.:4.00                                                                                                                                                                                                                                                                                 
    ##  Median :5.00                                                                                                                                                                                                                                                                                 
    ##  Mean   :4.54                                                                                                                                                                                                                                                                                 
    ##  3rd Qu.:5.00                                                                                                                                                                                                                                                                                 
    ##  Max.   :5.00                                                                                                                                                                                                                                                                                 
    ##  NA's   :1                                                                                                                                                                                                                                                                                    
    ##  C - 11. The division of theory and practice such that most of the theory is done during the recorded online classes and most of the practice is done during the physical classes
    ##  Min.   :2.00                                                                                                                                                                    
    ##  1st Qu.:4.00                                                                                                                                                                    
    ##  Median :5.00                                                                                                                                                                    
    ##  Mean   :4.49                                                                                                                                                                    
    ##  3rd Qu.:5.00                                                                                                                                                                    
    ##  Max.   :5.00                                                                                                                                                                    
    ##  NA's   :1                                                                                                                                                                       
    ##  C - 12. The recordings of online classes
    ##  Min.   :2.00                            
    ##  1st Qu.:4.00                            
    ##  Median :5.00                            
    ##  Mean   :4.33                            
    ##  3rd Qu.:5.00                            
    ##  Max.   :5.00                            
    ##  NA's   :1                               
    ##  D - 1. \nWrite two things you like about the teaching and learning in this unit so far.
    ##  Length:101                                                                             
    ##  Class :character                                                                       
    ##  Mode  :character                                                                       
    ##                                                                                         
    ##                                                                                         
    ##                                                                                         
    ##                                                                                         
    ##  D - 2. Write at least one recommendation to improve the teaching and learning in this unit (for the remaining weeks in the semester)
    ##  Length:101                                                                                                                          
    ##  Class :character                                                                                                                    
    ##  Mode  :character                                                                                                                    
    ##                                                                                                                                      
    ##                                                                                                                                      
    ##                                                                                                                                      
    ##                                                                                                                                      
    ##  Average Course Evaluation Rating Average Level of Learning Attained Rating
    ##  Min.   :2.909                    Min.   :2.000                            
    ##  1st Qu.:4.273                    1st Qu.:3.500                            
    ##  Median :4.545                    Median :4.000                            
    ##  Mean   :4.531                    Mean   :4.095                            
    ##  3rd Qu.:4.909                    3rd Qu.:4.500                            
    ##  Max.   :5.000                    Max.   :5.000                            
    ##  NA's   :1                        NA's   :1                                
    ##  Average Pedagogical Strategy Effectiveness Rating
    ##  Min.   :3.182                                    
    ##  1st Qu.:4.068                                    
    ##  Median :4.545                                    
    ##  Mean   :4.432                                    
    ##  3rd Qu.:4.909                                    
    ##  Max.   :5.000                                    
    ##  NA's   :1                                        
    ##  Project: Section 1-4: (20%) x/10 Project: Section 5-11: (50%) x/10
    ##  Min.   : 0.000                   Min.   : 0.000                   
    ##  1st Qu.: 7.400                   1st Qu.: 6.000                   
    ##  Median : 8.500                   Median : 7.800                   
    ##  Mean   : 8.011                   Mean   : 6.582                   
    ##  3rd Qu.: 9.000                   3rd Qu.: 8.300                   
    ##  Max.   :10.000                   Max.   :10.000                   
    ##                                                                    
    ##  Project: Section 12: (30%) x/5 Project: (10%): x/30 x 100 TOTAL
    ##  Min.   :0.000                  Min.   :  0.00                  
    ##  1st Qu.:0.000                  1st Qu.: 56.00                  
    ##  Median :0.000                  Median : 66.40                  
    ##  Mean   :1.015                  Mean   : 62.39                  
    ##  3rd Qu.:1.250                  3rd Qu.: 71.60                  
    ##  Max.   :5.000                  Max.   :100.00                  
    ##  NA's   :1                                                      
    ##  Quiz 1 on Concept 1 (Introduction) x/32 Quiz 3 on Concept 3 (Linear) x/15
    ##  Min.   : 4.75                           Min.   : 3.00                    
    ##  1st Qu.:11.53                           1st Qu.: 7.00                    
    ##  Median :15.33                           Median : 9.00                    
    ##  Mean   :16.36                           Mean   : 9.53                    
    ##  3rd Qu.:19.63                           3rd Qu.:12.00                    
    ##  Max.   :31.25                           Max.   :15.00                    
    ##                                          NA's   :2                        
    ##  Quiz 4 on Concept 4 (Non-Linear) x/22 Quiz 5 on Concept 5 (Dashboarding) x/10
    ##  Min.   : 3.00                         Min.   : 0.000                         
    ##  1st Qu.:10.91                         1st Qu.: 5.000                         
    ##  Median :13.50                         Median : 6.330                         
    ##  Mean   :13.94                         Mean   : 6.367                         
    ##  3rd Qu.:17.50                         3rd Qu.: 8.000                         
    ##  Max.   :22.00                         Max.   :12.670                         
    ##  NA's   :6                             NA's   :12                             
    ##  Quizzes and  Bonus Marks (7%): x/79 x 100 TOTAL
    ##  Min.   :26.26                                  
    ##  1st Qu.:43.82                                  
    ##  Median :55.31                                  
    ##  Mean   :56.22                                  
    ##  3rd Qu.:65.16                                  
    ##  Max.   :95.25                                  
    ##                                                 
    ##  Lab 1 - 2.c. - (Simple Linear Regression) x/5
    ##  Min.   :3.000                                
    ##  1st Qu.:5.000                                
    ##  Median :5.000                                
    ##  Mean   :4.898                                
    ##  3rd Qu.:5.000                                
    ##  Max.   :5.000                                
    ##  NA's   :3                                    
    ##  Lab 2 - 2.e. -  (Linear Regression using Gradient Descent) x/5
    ##  Min.   :2.150                                                 
    ##  1st Qu.:3.150                                                 
    ##  Median :4.850                                                 
    ##  Mean   :4.166                                                 
    ##  3rd Qu.:5.000                                                 
    ##  Max.   :5.000                                                 
    ##  NA's   :6                                                     
    ##  Lab 3 - 2.g. - (Logistic Regression using Gradient Descent) x/5
    ##  Min.   :2.85                                                   
    ##  1st Qu.:4.85                                                   
    ##  Median :4.85                                                   
    ##  Mean   :4.63                                                   
    ##  3rd Qu.:4.85                                                   
    ##  Max.   :5.00                                                   
    ##  NA's   :9                                                      
    ##  Lab 4 - 2.h. - (Linear Discriminant Analysis) x/5
    ##  Min.   :1.850                                    
    ##  1st Qu.:4.100                                    
    ##  Median :4.850                                    
    ##  Mean   :4.425                                    
    ##  3rd Qu.:5.000                                    
    ##  Max.   :5.000                                    
    ##  NA's   :18                                       
    ##  Lab 5 - Chart JS Dashboard Setup x/5 Lab Work (7%) x/25 x 100
    ##  Min.   :0.000                        Min.   : 17.80          
    ##  1st Qu.:0.000                        1st Qu.: 70.80          
    ##  Median :5.000                        Median : 80.00          
    ##  Mean   :3.404                        Mean   : 79.72          
    ##  3rd Qu.:5.000                        3rd Qu.: 97.20          
    ##  Max.   :5.000                        Max.   :100.00          
    ##                                                               
    ##  CAT 1 (8%): x/38 x 100 CAT 2 (8%): x/100 x 100
    ##  Min.   :32.89          Min.   :  0.00         
    ##  1st Qu.:59.21          1st Qu.: 51.00         
    ##  Median :69.73          Median : 63.50         
    ##  Mean   :69.39          Mean   : 62.13         
    ##  3rd Qu.:82.89          3rd Qu.: 81.75         
    ##  Max.   :97.36          Max.   :100.00         
    ##  NA's   :4              NA's   :31             
    ##  Attendance Waiver Granted: 1 = Yes, 0 = No Absenteeism Percentage
    ##  0:96                                       Min.   : 0.00         
    ##  1: 5                                       1st Qu.: 7.41         
    ##                                             Median :14.81         
    ##                                             Mean   :15.42         
    ##                                             3rd Qu.:22.22         
    ##                                             Max.   :51.85         
    ##                                                                   
    ##  Coursework TOTAL: x/40 (40%) EXAM: x/60 (60%)
    ##  Min.   : 7.47                Min.   : 5.00   
    ##  1st Qu.:20.44                1st Qu.:26.00   
    ##  Median :24.58                Median :34.00   
    ##  Mean   :24.53                Mean   :33.94   
    ##  3rd Qu.:29.31                3rd Qu.:42.00   
    ##  Max.   :35.08                Max.   :56.00   
    ##                               NA's   :4       
    ##  TOTAL = Coursework TOTAL + EXAM (100%) GRADE 
    ##  Min.   : 7.47                          A:23  
    ##  1st Qu.:45.54                          B:25  
    ##  Median :58.69                          C:22  
    ##  Mean   :57.12                          D:25  
    ##  3rd Qu.:68.83                          E: 6  
    ##  Max.   :87.72                                
    ## 

``` r
# Count of each class group
table(student_performance_dataset$class_group)
```

    ## 
    ##  A  B  C 
    ## 23 37 41

``` r
##Gender Analysis
###Next, we'll examine the gender distribution among students.
# Count and percentage of gender
table(student_performance_dataset$gender)
```

    ## 
    ##  1  0 
    ## 58 43

``` r
prop.table(table(student_performance_dataset$gender))
```

    ## 
    ##         1         0 
    ## 0.5742574 0.4257426

``` r
##Visualization
###We'll create some visualizations to better understand the 
# Create a bar plot for counts of birth years
birth_year_counts <- table(format(student_performance_dataset$YOB, "%Y"))
barplot(birth_year_counts, main = "Distribution of Birth Years", xlab = "Year of Birth", ylab = "Count")
```

![](Lab-Submission-Markdown_files/figure-gfm/Your%20Third%20Code%20Chunk-1.png)<!-- -->

``` r
# Bar plot for class group
barplot(table(student_performance_dataset$class_group), main = "Class Group Distribution", xlab = "Class Group", ylab = "Count")
```

![](Lab-Submission-Markdown_files/figure-gfm/Your%20Third%20Code%20Chunk-2.png)<!-- -->

``` r
# Box plot of study time by class group
boxplot(student_performance_dataset$study_time ~ student_performance_dataset$class_group, main = "Study Time by Class Group", xlab = "Class Group", ylab = "Study Time")
```

![](Lab-Submission-Markdown_files/figure-gfm/Your%20Third%20Code%20Chunk-3.png)<!-- -->

``` r
library(readr)
```

# Step 2:Data Processing

``` r
# Select only numeric columns and convert them to numeric
numeric_data <- select(student_performance_dataset, -c(YOB, repeats_since_Y1)) %>%
  mutate_if(is.character, as.numeric)
```

    ## Warning: There were 2 warnings in `mutate()`.
    ## The first warning was:
    ## ℹ In argument: `D - 1.  Write two things you like about the teaching and
    ##   learning in this unit so far. = .Primitive("as.double")(`D - 1. \nWrite two
    ##   things you like about the teaching and learning in this unit so far.`)`.
    ## Caused by warning:
    ## ! NAs introduced by coercion
    ## ℹ Run `dplyr::last_dplyr_warnings()` to see the 1 remaining warning.

``` r
# Example: Remove rows with missing values
# Load the tidyr package
library(tidyr)

# Remove rows with missing values
student_performance_dataset <- student_performance_dataset %>%
  drop_na()

# Select relevant variables
selected_vars <- c(
  "study_time", "mentor", "health", "YOB", "class_group",
  "repeats_since_Y1", "read_content_before_lecture",
  "take_quizzes_and_use_results", "reorganise_course_outline",
  "space_out_revision", "exercise_per_week", "GRADE", "gender"
)

selected_data <- student_performance_dataset %>%
  select(all_of(selected_vars))

library(readr)
```

# Step 3: Measures of Frequency and Summary Statistics

### In this step, we will calculate measures of frequency and summary statistics for selected variables.

``` r
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
```

    ## [1] "Measures of Frequency:"

``` r
print(class_group_counts)
```

    ## # A tibble: 3 × 2
    ##   class_group     n
    ##   <fct>       <int>
    ## 1 A              10
    ## 2 B              14
    ## 3 C              27

``` r
print(mentor_counts)
```

    ## # A tibble: 2 × 2
    ##   mentor     n
    ##   <fct>  <int>
    ## 1 0         31
    ## 2 1         20

``` r
print(health_counts)
```

    ## # A tibble: 4 × 2
    ##   health     n
    ##   <fct>  <int>
    ## 1 2          1
    ## 2 3         11
    ## 3 4         16
    ## 4 5         23

``` r
print(study_time_counts)
```

    ## # A tibble: 4 × 2
    ##   study_time     n
    ##   <fct>      <int>
    ## 1 1             20
    ## 2 2             22
    ## 3 3              6
    ## 4 4              3

``` r
print(yob_counts)
```

    ## # A tibble: 5 × 2
    ##   YOB            n
    ##   <date>     <int>
    ## 1 1999-01-01     2
    ## 2 2000-01-01    14
    ## 3 2001-01-01    20
    ## 4 2002-01-01    14
    ## 5 2003-01-01     1

``` r
print(exercise_counts)
```

    ## # A tibble: 4 × 2
    ##   exercise_per_week     n
    ##   <fct>             <int>
    ## 1 0                     8
    ## 2 1                    28
    ## 3 2                    13
    ## 4 3                     2

``` r
# Summary Statistics
print("Summary Statistics:")
```

    ## [1] "Summary Statistics:"

``` r
print(mean_study_time)
```

    ## # A tibble: 1 × 1
    ##   mean_study_time
    ##             <dbl>
    ## 1            1.84

``` r
print(median_study_time)
```

    ## # A tibble: 1 × 1
    ##   median_study_time
    ##               <dbl>
    ## 1                 2

``` r
print(var_study_time)
```

    ## # A tibble: 1 × 1
    ##   var_study_time
    ##            <dbl>
    ## 1          0.735

``` r
print(std_dev_study_time)
```

    ## # A tibble: 1 × 1
    ##   std_dev_study_time
    ##                <dbl>
    ## 1              0.857

``` r
print(skewness_study_time)
```

    ## # A tibble: 1 × 1
    ##   skewness_study_time
    ##                 <dbl>
    ## 1               0.856

``` r
print(kurtosis_study_time)
```

    ## # A tibble: 1 × 1
    ##   kurtosis_study_time
    ##                 <dbl>
    ## 1               0.115

``` r
# Summary Statistics for Exercise
print("Summary Statistics for Exercise per Week:")
```

    ## [1] "Summary Statistics for Exercise per Week:"

``` r
print(mean_exercise)
```

    ## # A tibble: 1 × 1
    ##   mean_exercise
    ##           <dbl>
    ## 1          2.18

``` r
print(median_exercise)
```

    ## # A tibble: 1 × 1
    ##   median_exercise
    ##             <dbl>
    ## 1               2

``` r
print(var_exercise)
```

    ## # A tibble: 1 × 1
    ##   var_exercise
    ##          <dbl>
    ## 1        0.548

``` r
print(std_dev_exercise)
```

    ## # A tibble: 1 × 1
    ##   std_dev_exercise
    ##              <dbl>
    ## 1            0.740

``` r
print(skewness_exercise)
```

    ## # A tibble: 1 × 1
    ##   skewness_exercise
    ##               <dbl>
    ## 1             0.300

``` r
print(kurtosis_exercise)
```

    ## # A tibble: 1 × 1
    ##   kurtosis_exercise
    ##               <dbl>
    ## 1            -0.166

``` r
library(readr)
```

# Step 4: Data Visualization

### In this step, we will create visualizations to explore the data.

``` r
# Load necessary libraries
library(tidyverse)
library(gridExtra)
```

    ## 
    ## Attaching package: 'gridExtra'

    ## The following object is masked from 'package:dplyr':
    ## 
    ##     combine

``` r
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
```

    ## tibble [51 × 13] (S3: tbl_df/tbl/data.frame)
    ##  $ study_time                  : num [1:51] 2 2 2 2 3 1 1 2 1 1 ...
    ##  $ mentor                      : Factor w/ 2 levels "0","1": 2 1 1 1 1 1 1 1 1 1 ...
    ##  $ health                      : Factor w/ 5 levels "1","2","3","4",..: 5 3 3 5 3 5 4 5 4 5 ...
    ##  $ YOB                         : num [1:51] 10957 10592 10957 10957 10957 ...
    ##  $ class_group                 : Factor w/ 3 levels "A","B","C": 1 1 3 3 3 2 3 3 3 2 ...
    ##  $ repeats_since_Y1            : int [1:51] 4 5 0 2 0 1 3 3 1 0 ...
    ##  $ read_content_before_lecture : Factor w/ 5 levels "1","2","3","4",..: 5 3 3 3 3 1 4 4 1 2 ...
    ##  $ take_quizzes_and_use_results: Factor w/ 5 levels "1","2","3","4",..: 4 5 2 5 5 5 4 4 1 5 ...
    ##  $ reorganise_course_outline   : Factor w/ 5 levels "1","2","3","4",..: 5 3 2 3 4 5 4 3 2 1 ...
    ##  $ space_out_revision          : Factor w/ 5 levels "1","2","3","4",..: 4 3 2 2 5 5 3 5 1 4 ...
    ##  $ exercise_per_week           : num [1:51] 3 2 2 2 3 1 3 3 3 2 ...
    ##  $ GRADE                       : num [1:51] 2 2 4 4 1 2 4 3 3 1 ...
    ##  $ gender                      : Factor w/ 2 levels "1","0": 1 1 1 1 1 2 2 1 1 2 ...

``` r
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
```

![](Lab-Submission-Markdown_files/figure-gfm/Your%20Sixth%20Code%20Chunk-1.png)<!-- -->

``` r
library(readr)
```

# Step 5: Statistical Tests

### In this step, we will perform statistical tests to analyze the data.

``` r
# Load necessary libraries
#We start by loading several R libraries that we'll use for statistical analysis. These libraries include tidyverse for data manipulation and visualization, broom for tidying ANOVA (analysis of variance) results, and MASS for logistic regression.
library(tidyverse)
library(broom)  # For tidying ANOVA results
library(MASS)   # For logistic regression
```

    ## 
    ## Attaching package: 'MASS'

    ## The following object is masked from 'package:dplyr':
    ## 
    ##     select

``` r
#we specify the names of the independent variable and the dependent variable. The independent variable, independent_var, is set to "study_time," which indicates the variable you want to use as a predictor. The dependent variable, dependent_var, is set to "GRADE," which represents the outcome variable you want to analyze.
# Specify the independent and dependent variables
independent_var <- "study_time"
dependent_var <- "GRADE"


# Perform the Chi-squared Test for Independence (Gender and Grade)
#In this step, we perform a Chi-squared Test for Independence. This test is used to examine the association between two categorical variables: "GRADE" and "gender." The result of the test is stored in the variable chi_square_test.
chi_square_test <- chisq.test(selected_data$GRADE, selected_data$gender)
```

    ## Warning in chisq.test(selected_data$GRADE, selected_data$gender): Chi-squared
    ## approximation may be incorrect

``` r
# Recode "GRADE" to binary (if needed)
#If your "GRADE" variable contains multiple levels (e.g., "A," "B," "C"), and you want to perform logistic regression, you typically need to recode it as binary. Here, we recode "GRADE" such that if the original value is "A," it is recoded as 1 (indicating success), and for any other value, it is recoded as 0 (indicating not successful)
selected_data$GRADE <- ifelse(selected_data$GRADE == "A", 1, 0)

# Perform Logistic Regression (Gender and Grade)
#Finally, we perform logistic regression. Logistic regression is a statistical method used when the dependent variable is binary (in this case, "GRADE" after recoding). We model "GRADE" as a function of "gender." The family = binomial(link = "logit") argument specifies that we are using logistic regression with a logit link function.
logistic_model <- glm(GRADE ~ gender, data = selected_data, family = binomial(link = "logit"))

# Print results
cat("Chi-squared Test for Independence (Gender and Grade):\n")
```

    ## Chi-squared Test for Independence (Gender and Grade):

``` r
print(chi_square_test)
```

    ## 
    ##  Pearson's Chi-squared test
    ## 
    ## data:  selected_data$GRADE and selected_data$gender
    ## X-squared = 4.834, df = 3, p-value = 0.1844

``` r
cat("\nLogistic Regression (Gender and Grade):\n")
```

    ## 
    ## Logistic Regression (Gender and Grade):

``` r
summary(logistic_model)
```

    ## 
    ## Call:
    ## glm(formula = GRADE ~ gender, family = binomial(link = "logit"), 
    ##     data = selected_data)
    ## 
    ## Deviance Residuals: 
    ##        Min          1Q      Median          3Q         Max  
    ## -2.409e-06  -2.409e-06  -2.409e-06  -2.409e-06  -2.409e-06  
    ## 
    ## Coefficients:
    ##               Estimate Std. Error z value Pr(>|z|)
    ## (Intercept) -2.657e+01  6.396e+04       0        1
    ## gender0      2.390e-15  1.021e+05       0        1
    ## 
    ## (Dispersion parameter for binomial family taken to be 1)
    ## 
    ##     Null deviance: 0.0000e+00  on 50  degrees of freedom
    ## Residual deviance: 2.9588e-10  on 49  degrees of freedom
    ## AIC: 4
    ## 
    ## Number of Fisher Scoring iterations: 25

``` r
library(readr)
```
