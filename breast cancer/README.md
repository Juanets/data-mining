# Breast cancer
Predicting the dangerousness of a tumour using naive bayes.

## Attributes
Nine real-valued features are computed for each tumour (columns 2-10): 

1. ID number 
2. radius 
3. texture
4. perimeter 
5. area 
6. smoothness
7. compactness
8. concavity
9. concave points
10. symmetry 
11. diagnosis

## Files
* **DatosTrainTest.mat:** the dataset divided into train and test
* **Counting.m:** function that generates a frequency matrix
* **Normalize.m:** function that normalizes the frequency matrix
* **Prob.m:** function used to calculate a priori probabilities
* **analysis.m:** script used for my exploratory data analysis
* **bayes.m:** main file; implementation of naive bayes

## Acknowledgements
Thanks to the people that donated the data in 1995.  
For full documentation on this dataset go [here](https://archive.ics.uci.edu/ml/datasets/Breast+Cancer+Wisconsin+(Diagnostic)).

## Disclosure
The code was written for educational purposes only. It propably requires optimization and stuff so... don't use in production.  
There are better ways to implement naive bayes in real life situations.