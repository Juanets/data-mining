load('CasosTrainTest.mat');

% probability that a tumor is malignant or benign
prob_malign = Prob(Train, 11, 4);
prob_benign = Prob(Train, 11, 2);

% delete the first column (ids)
Train(:, 1) = [];

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