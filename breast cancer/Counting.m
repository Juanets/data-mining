function [A] = Counting( Matrix, Cols, values )

    % Count how many times a value appears on a column. This only works
    % when the range of values is the same for all the columns.
    
    % Matrix: the whole matrix of data
    % Cols: the columns on which we'll be counting
    % values: vector of unique values
    
    h = zeros(length(Cols));
    for i = 1:length(Cols)
        for j = 1:length(values)
            h(i, j) = sum(Matrix(:, i) == values(j));       
        end
    end
    A = h';
    
end