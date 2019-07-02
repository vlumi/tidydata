# Codebook
This file contains the codebook for the tidy data frames produced by the script "run_analysis.R".

## Variables

### Identifier Variables
Each row is identified by a test subject (a number) and a test activity (a factor of characters)

* subject
* activity

### Value Variables
Each value variable is named by normalizing the original name, from `features.txt`, to lower-case, snake-case, replacing non-alphanumeric characters by an underscore, and minimizing the number of consecutive underscores.

From the original data, only variables containing mean and standard deviation values are included.

The list of valua variables is as follows:

* t_body_acc_mean_x
* t_body_acc_mean_y
* t_body_acc_mean_z
* t_body_acc_std_x
* t_body_acc_std_y
* t_body_acc_std_z
* t_gravity_acc_mean_x
* t_gravity_acc_mean_y
* t_gravity_acc_mean_z
* t_gravity_acc_std_x
* t_gravity_acc_std_y
* t_gravity_acc_std_z
* t_body_acc_jerk_mean_x
* t_body_acc_jerk_mean_y
* t_body_acc_jerk_mean_z
* t_body_acc_jerk_std_x
* t_body_acc_jerk_std_y
* t_body_acc_jerk_std_z
* t_body_gyro_mean_x
* t_body_gyro_mean_y
* t_body_gyro_mean_z
* t_body_gyro_std_x
* t_body_gyro_std_y
* t_body_gyro_std_z
* t_body_gyro_jerk_mean_x
* t_body_gyro_jerk_mean_y
* t_body_gyro_jerk_mean_z
* t_body_gyro_jerk_std_x
* t_body_gyro_jerk_std_y
* t_body_gyro_jerk_std_z
* t_body_acc_mag_mean
* t_body_acc_mag_std
* t_gravity_acc_mag_mean
* t_gravity_acc_mag_std
* t_body_acc_jerk_mag_mean
* t_body_acc_jerk_mag_std
* t_body_gyro_mag_mean
* t_body_gyro_mag_std
* t_body_gyro_jerk_mag_mean
* t_body_gyro_jerk_mag_std
* f_body_acc_mean_x
* f_body_acc_mean_y
* f_body_acc_mean_z
* f_body_acc_std_x
* f_body_acc_std_y
* f_body_acc_std_z
* f_body_acc_jerk_mean_x
* f_body_acc_jerk_mean_y
* f_body_acc_jerk_mean_z
* f_body_acc_jerk_std_x
* f_body_acc_jerk_std_y
* f_body_acc_jerk_std_z
* f_body_gyro_mean_x
* f_body_gyro_mean_y
* f_body_gyro_mean_z
* f_body_gyro_std_x
* f_body_gyro_std_y
* f_body_gyro_std_z
* f_body_acc_mag_mean
* f_body_acc_mag_std
* f_body_body_acc_jerk_mag_mean
* f_body_body_acc_jerk_mag_std
* f_body_body_gyro_mag_mean
* f_body_body_gyro_mag_std
* f_body_body_gyro_jerk_mag_mean
* f_body_body_gyro_jerk_mag_std

