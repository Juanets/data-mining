# Robot execution failures
Classifying the types of failures of robots.

## Attributes
This dataset contains force and torque measurements on a robot after failure detection. Each failure is characterized by 15 force/torque samples collected at regular time intervals. Measuring 3 force axis plus 3 torque axis (6 features in total) for 15 time intervals, gives us a total of 90 columns/attributes. Read more about it [here](https://archive.ics.uci.edu/ml/datasets/Robot+Execution+Failures).  

## Files
* **Robot_Train.csv:** the training set
* **Robot_Test.csv:** the testing set
* **Values.csv:** list of unique values in the dataset
* **Counting.m:** function that generates a frequency matrix
* **Normalize.m:** function that normalizes the frequency matrix
* **Prob.m:** function used to calculate a priori probabilities
* **main.m:** main file; implementation of naive bayes

## Disclosure
The algorithm was written for educational purposes only. 