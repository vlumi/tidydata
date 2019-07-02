
library(dplyr)
main()

## Load subject data
load_subject_data <- function(root_dir, train_dir, test_dir) {
  message("Load subject data")
  train_lines <- as.numeric(readLines(file.path(train_dir, "subject_train.txt")))
  train <- data.frame(train_lines)
  colnames(train) <- c("subject")
  test_lines <- as.numeric(readLines(file.path(test_dir, "subject_test.txt")))
  test <- data.frame(test_lines)
  colnames(test) <- c("subject")
  
  rbind(train, test)
}

## Load activity data
load_activity_data <- function(root_dir, train_dir, test_dir) {
  message("Load activity data")
  # Activity labels
  labels <- read.csv(
    file.path(root_dir, "activity_labels.txt"),
    sep = " ",
    header = F,
    stringsAsFactors = F)
  colnames(labels) <- c("id", "activity")
  
  # Activity data
  train <- data.frame(as.integer(readLines(file.path(train_dir, "Y_train.txt"))))
  colnames(train) <- c("id")
  test <- data.frame(as.integer(readLines(file.path(test_dir, "Y_test.txt"))))
  colnames(test) <- c("id")
  combined <- rbind(train, test)
  
  df <- data.frame(inner_join(combined, labels, "id")$activity)
  colnames(df) <- c("activity")
  df
}

## Load the feature data
load_feature_data <- function(root_dir, train_dir, test_dir) {
  message("Load feature data")
  train <- read.fwf(file.path(train_dir, "X_train.txt"), rep(16, 561))
  test <- read.fwf(file.path(test_dir, "X_test.txt"), rep(16, 561))
  combined <- rbind(train, test)
  
  # Apply the labels
  labels <- read.csv(
    file.path(root_dir, "features.txt"),
    sep = " ",
    header = F,
    stringsAsFactors = F,
    col.names = c("id", "label"))$label
  # Column indices for the mean and std values
  target_indices <- grep("-(mean|std)\\(\\)", labels)
  
  # Tidy the label values
  labels <- gsub("\\(\\)", "", labels)
  labels <- gsub("([A-Z])", "_\\1", labels)
  labels <- tolower(labels)
  labels <- gsub("[^a-z0-9]+", "_", labels)
  
  # Expand abbreviations
  labels <- sub("^t_", "time_", labels)
  labels <- sub("^f_", "frequency_", labels)
  labels <- sub("_acc_", "_acceleration_", labels)
  labels <- sub("_mag_", "_magnitude_", labels)
  
  colnames(combined) <- labels
  
  # Only include mean and std data
  combined[target_indices]
}

tidy_data <- function(root_dir = ".") {
  train_dir <- file.path(root_dir, "train")
  test_dir <- file.path(root_dir, "test")
  
  subject <- load_subject_data(root_dir, train_dir, test_dir)
  activity <- load_activity_data(root_dir, train_dir, test_dir)
  feature <- load_feature_data(root_dir, train_dir, test_dir)
  
  cbind(subject, activity, feature)
}

write_summary <- function(data, root_dir = ".") {
  message("Write summary to output file")
  means <- data %>% group_by(subject, activity) %>%
    summarise_all(list(mean)) %>%
    arrange(subject, activity) %>%
    write.table(file.path(root_dir, "step5.txt"), row.names = F)
}

main <- function(root_dir = ".") {
  data <- tidy_data(root_dir)
  write_summary(data, root_dir)
}
