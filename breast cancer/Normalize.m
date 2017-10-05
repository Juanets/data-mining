function [N] = Normalize(Matrix)
    % laplace smoothing
    Matrix = Matrix + 1;
    
    % number of samples
    num = sum(Matrix(:,1));
    
    % divide every element of Matrix by num
    % returns normalized Matrix (frequencies / number of samples)
    N = Matrix / num;
end