function [A] = Counting( Matrix, Cols, values )

    % Count how many times a value appears on a column. This only works
    % when the range of values is the same for all the columns.
    
    % Matrix: the whole matrix of data
    % Cols: the columns on which we'll be counting
    % values: vector of unique values
    
    A = zeros(length(values), length(Cols));
    
    for i = 1:length(values)
        A(i,:) = sum(Matrix(:,:)==values(i));
    end
    
end