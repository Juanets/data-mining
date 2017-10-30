function [N] = Normalize(Matrix)
    % number of samples
    m = sum(Matrix(:,1));
    
    % divide every element of Matrix by num
    % returns normalized Matrix (frequencies / number of samples)
    N = (Matrix + 1) / m;
end