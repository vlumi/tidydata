# Peer-graded Assignment: Getting and Cleaning Data Course Project
This project contains an implementation for the peer-graded assignment of the Getting and Cleaning Data Course project. The implementation has been developed using R 3.6.0, and also required the dplyr library (developed using 0.8.1).

## Structure
The data tidying and summary collection are split into two top-level methods:

1. tidy_data reads the data from the file (by default relative to the current directory), and returns the tidy data as a data frame.
2. write_summary takes the tidy data frame, calculates the mean by activity and subject, and outputs the results to the output file `step5.txt` (by default to the current directory)

### tidy_data
The data collection and tidying is done in the following steps:

1. Load the subject data, combining the training data `subject_training.txt` and test data `subject_test.txt`.
2. Load the activity data, combining the training data `y_train.txt` and test data `y_test.txt`, mapping the numerical value to the more descriptive text value from `activity_labels.txt`.
3. Load the feature data, combining the training data `X_train.txt` and test data `X_test.txt`, as well as assigning the normalized labels from `features.txt`.
4. Combine and return the subject, activity, and feature data by columns.

### write_summary
The received data is grouped by the subject and activity columns, after which a mean on each column is applied. The resulting data is output to `step5.txt`.

## Running
By default, running the script will execute both steps of the program, assuming that the input data can be found relative to the current directory.

The default can be overriden to any directory, by running the `main` function manually, passing the desired directory as its sole parameter:
```
main("/path/to/the/data")
```

