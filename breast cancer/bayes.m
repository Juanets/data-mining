load('CasosTrainTest.mat');

% a priori probabilities
priori_malign = Prob(Train, 11, 4);
priori_benign = Prob(Train, 11, 2);

% delete the first column (ids)
Train(:, 1) = [];
Test(:, 1) = [];

% column numbers
Cols = 1:10;

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
    col = 1:9;    
    row = Test(i,col);
    idx = sub2ind(size(M_norm), row, col);
    
    probs_m = M_norm(idx);
    probs_b = B_norm(idx);
    
    is_malignant = prod(probs_m) * priori_malign;
    is_benign = prod(probs_b) * priori_benign;

    if is_benign > is_malignant
        predict(i) = 2;
    else
        predict(i) = 4;
    end
end

% test accuracy
corrects = sum(Test(:,10) == predict);
accuracy = (corrects * 100) / length(Test)

% benign accuracy
b_corrects = sum(predict(Test(:, 10) == 2) == 2);
b_accuracy = b_corrects / sum(Test(:, 10) == 2) * 100

% malignant accuracy
m_corrects = sum(predict(Test(:, 10) == 4) == 4);
m_accuracy = m_corrects / sum(Test(:, 10) == 4) * 100