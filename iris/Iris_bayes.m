load('Iris_Data.mat');

% separate classes
Setosa = Iris_Train(Iris_Train(:,5)==1,:);
Versicolor = Iris_Train(Iris_Train(:,5)==2,:);
Virginica = Iris_Train(Iris_Train(:,5)==3,:);

% a priori probability
Prob_setosa = Prob(Iris_Train, 5, 1);
Prob_versicolor = Prob(Iris_Train, 5, 2);
Prob_virginica = Prob(Iris_Train, 5, 3);

% unique values in the dataset
Values = unique(Iris_Train);

% indeces of the columns
Cols = 1:5;

% frequency table of unique values
Setosa_freq = Counting(Setosa, Cols, Values);
Versicolor_freq = Counting(Versicolor, Cols, Values);
Virginica_freq = Counting(Virginica, Cols, Values);

% normalized models
Setosa_norm = Normalize(Setosa_freq);
Versicolor_norm = Normalize(Versicolor_freq);
Virginica_norm = Normalize(Virginica_freq);

% predictions vector
predict = zeros(size(Iris_Test,1),1);

% calculate conditional probabilities
for i = 1:size(Iris_Test,1)
    probs_setosa = zeros(4,1);
    probs_versicolor = zeros(4,1);
    probs_virginica = zeros(4,1);
    
    for j = 1:4
        value = Iris_Test(i,j);
        idx = find(Values==value);
        probs_setosa(j) = Setosa_norm(idx,j);
        probs_versicolor(j) = Versicolor_norm(idx, j);
        probs_virginica(j) = Virginica_norm(idx, j);
    end
    
    setosa = prod(probs_setosa) * Prob_setosa;
    versicolor = prod(probs_versicolor) * Prob_versicolor;
    virginica = prod(probs_virginica) * Prob_virginica;
    
    % pick the highest probability
    probabilites = [setosa versicolor virginica];
    [M, I] = max(probabilites);
    predict(i) = I;
end

% test accuracy
corrects = sum(Iris_Test(:,5) == predict);
accuracy = (corrects * 100) / size(Iris_Test,1) % 100% accurate

    