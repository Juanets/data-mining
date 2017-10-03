load('CasosTrainTest.mat');
B = Train(Train(:, 11)==2, :);
M = Train(Train(:, 11)==4, :);

% concave points
figure(1);
subplot(1,2,1);
hist(B(:, 9));
title('Benign Concave points')
ylabel('Frequency')
subplot(1,2,2);
hist(M(:,9));
title('Malign Concave points')
ylabel('Frequency')
mean_concave_b = mean(B(:,9));
mean_concave_m = mean(M(:,9));
std_concave_b = std(B(:,9));
std_concave_m = std(M(:,9));
concave_points = [mean_concave_b, mean_concave_m; std_concave_b, std_concave_m];

% smoothness 
figure(2);
subplot(1,2,1);
hist(B(:, 6));
title('Benign Smoothness')
ylabel('Frequency')
subplot(1,2,2);
hist(M(:, 6));
title('Malign Smoothness')
ylabel('Frequency')
mean_smooth_b = mean(B(:,6));
mean_smooth_m = mean(M(:,6));
std_smooth_b = std(B(:,6));
std_smooth_m = std(M(:,6));
smoothness = [mean_smooth_b, mean_smooth_m; std_smooth_b, std_smooth_m]

% compactness
figure(3);
subplot(1,2,1);
hist(B(:, 7));
title('Benign Compactness')
ylabel('Frequency')
subplot(1,2,2);
hist(M(:,7));
title('Malign Compactness')
ylabel('Frequency')
mean_compact_b = mean(B(:,7));
mean_compact_m = mean(M(:,7));
std_compact_b = std(B(:,7));
std_compact_m = std(M(:,7));
compactness = [mean_compact_b, mean_compact_m; std_compact_b, std_compact_m];

% concavity
figure(4);
subplot(1,2,1);
hist(B(:, 8));
title('Benign Concavity')
ylabel('Frequency')
subplot(1,2,2);
hist(M(:, 8));
title('Malign Concavity')
ylabel('Frequency')
mean_concavity_b = mean(B(:,8));
mean_concavity_m = mean(M(:,8));
std_concavity_b = std(B(:,8));
std_concavity_m = std(M(:,8));
concavity = [mean_concavity_b, mean_concavity_m; std_concavity_b, std_concavity_m];

% symmetry
figure(5);
subplot(1,2,1);
hist(B(:, 10));
title('Benign Symmetry')
ylabel('Frequency')
subplot(1,2,2);
hist(M(:, 10));
title('Malign Symmetry')
ylabel('Frequency')
mean_symmetry_b = mean(B(:,10));
mean_symmetry_m = mean(M(:,10));
std_symmetry_b = std(B(:,10));
std_symmetry_m = std(M(:,10));
symmetry = [mean_symmetry_b, mean_symmetry_m; std_symmetry_b, std_symmetry_m];