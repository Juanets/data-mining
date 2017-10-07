load('CasosTrainTest.mat');

% probability that a tumor is malignant or benign
prob_malign = Prob(Train, 11, 4);
prob_benign = Prob(Train, 11, 2);

% delete the first column (ids)
Train(:, 1) = [];
Test(:, 1) = [];
% vector of column numbers
Cols = [1:10];

% unique values in the whole dataset
values = unique(Train);

% separate data between malignant and benign tumors
M = Train(Train(:, 10)==4, :);
B = Train(Train(:, 10)==2, :);

% frequency table of malignant tumors
M_freq = Counting(M, Cols, values);

% frequency table of benign tumors
B_freq = Counting(B, Cols, values);

% normalized malignant tumors
M_norm = Normalize(M_freq);

% normalized benign tumors
B_norm = Normalize(B_freq);

% predictions vector
predict = zeros(length(Test),1);

% calculate predictions
for i = 1:length(Test)
    prob_m = zeros(9,1)';
    prob_b = zeros(9,1)';

    for j = 1:9
        value = Test(i, j);
        prob_m(j) = M_norm(value, j);
        prob_b(j) = B_norm(value, j);        
    end

    malignant = prod(prob_m) * prob_malign;
    benign = prod(prob_b) * prob_benign;

    if benign > malignant
        predict(i) = 2;
    else
        predict(i) = 4;
    end

end

% test accuracy

corrects = sum(Test(:,10) == predict);
accuracy = (corrects * 100) / length(Test); 

% the model is 98% accurate
