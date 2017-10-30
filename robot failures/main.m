Test = csvread('Robot_Test.csv');
Train = csvread('Robot_Train.csv');
values = csvread('Values.csv');

% a priori probabilities
priori_normal = Prob(Train, 1, 1);
priori_bottom_col = Prob(Train, 1, 2);
priori_bottom_obs = Prob(Train, 1, 3);
priori_col_part = Prob(Train, 1, 4);
priori_col_tool = Prob(Train, 1, 5);

% column numbers
Cols = 1:91;

% separate data 
Normal = Train(Train(:, 1)==1, :);
Bottom_collision = Train(Train(:, 1)==2, :);
Bottom_obstruction = Train(Train(:, 1)==3, :);
Collision_part = Train(Train(:, 1)==4, :);
Collision_tool = Train(Train(:, 1)==5, :);

% frequency table of normal errors
Normal_freq = Counting(Normal, Cols, values);

% frequency table of bottom collision errors
Bottom_col_freq = Counting(Bottom_collision, Cols, values);

% frequency table of bottom obstruction errors
Bottom_obs_freq = Counting(Bottom_obstruction, Cols, values);

% frequency table of collision in part errors
Collision_part_freq = Counting(Collision_part, Cols, values);

% frequency table of collision in tool errors
Collision_tool_freq = Counting(Collision_tool, Cols, values);

% normalized normal errors 
Normal_norm = Normalize(Normal_freq);

% normalized bottom collision errors 
Bottom_col_norm = Normalize(Bottom_col_freq);

% normalized bottom obstruction errors 
Bottom_obs_norm = Normalize(Bottom_obs_freq);

% normalized collision in part errors 
Collision_part_norm = Normalize(Collision_part_freq);

% normalized collision in tool errors 
Collision_tool_norm = Normalize(Collision_tool_freq);

% predictions vector
Predict = zeros(size(Test, 1),1);

% calculate predictions
for i = 1:size(Test,1)
    col = 2:91;
    row = Test(i, col);
    
    % get unique value indexes (in Values matrix) for each value in the row
    [~,row_idx] = ismember(row,values);
    
    % translate each (row_idx, col) coordinate into an index
    idx = sub2ind(size(Normal_norm), row_idx, col);
    
    % indexing normalized matrices using idx vector
    prob_normal = Normal_norm(idx);
    prob_b_col = Bottom_col_norm(idx);
    prob_b_obs = Bottom_obs_norm(idx);
    prob_col_part = Collision_part_norm(idx);
    prob_col_tool = Collision_tool_norm(idx);

    is_normal = prod(prob_normal) * priori_normal;
    is_b_col = prod(prob_b_col) * priori_bottom_col;
    is_b_obs = prod(prob_b_obs) * priori_bottom_obs;
    is_col_part = prod(prob_col_part) * priori_col_part;
    is_col_tool = prod(prob_col_tool) * priori_col_tool;
    
    probabilities = [is_normal is_b_col is_b_obs is_col_part is_col_tool];
    [~, I] = max(probabilities);
    Predict(i) = I;

end


% test accuracy

corrects = sum(Test(:,1) == Predict);
accuracy = (corrects * 100) / size(Test,1)
