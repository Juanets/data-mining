% load data
load('Iris_Data.mat');

% merge train and test sets into one big dataset.
Iris = [Iris_Train; Iris_Test];

%  we know that there are 3 classes, so K equals 3.
K = 3;

% number of samples.
m = length(Iris);

% separate classes.
k1 = Iris(Iris(:,5)==1,1:4);
k2 = Iris(Iris(:,5)==2,1:4);
k3 = Iris(Iris(:,5)==3,1:4);

% fill initial centroids with random samples from each class.
centroids = zeros(3, 4);
centroids(1, :) = datasample(k1,1);
centroids(2, :) = datasample(k2,1);
centroids(3, :) = datasample(k3,1);

% classification vector.
c = zeros(m, 1); 

% store classifications from past iteration.
past_c = ones(m,1);

% repeat until convergence. K-means converges when the current and past 
% classifications/assignments are equal.
while not(isequal(c, past_c))
    past_c = c;
    
    % here we assign each sample to its closer centroid.
    for i = 1:m        
        % calculate euclidean distances.
        % idx is the index of the min value in the 3x1 matrix of distances.
        [~, idx] = min(sqrt(sum((Iris(i,1:4) - centroids) .^ 2, 2)));
        c(i) = idx;
    end
     
    % reassignment of centroids: calculate the means of samples assigned to each centroid.
    for j = 1:K
       % samples that were assigned to centroid j (1, 2 or 3)
       samples = Iris(c==j, 1:4);
       
       % the new centroids will be the mean of values in every column.
       centroids(j,:) =  mean(samples);
    end
end

% accuracy for each class
k1_accuracy = (sum(c(Iris(:, 5) == 1) == 1) / sum(Iris(:, 5) == 1)) * 100
k2_accuracy = (sum(c(Iris(:, 5) == 2) == 2) / sum(Iris(:, 5) == 2)) * 100
k3_accuracy = (sum(c(Iris(:, 5) == 3) == 3) / sum(Iris(:, 5) == 3)) * 100

% general accuracy
accuracy = (sum(Iris(:,5)==c)/m) * 100