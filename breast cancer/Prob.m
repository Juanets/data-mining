function [Prob] = Prob(Casos, Columna, valor)
    
    % Calculate probability that a value appears in certain column
    
    m = length(Casos(:, Columna));
    freq = sum(Casos(:, Columna) == valor);
    Prob = freq/m;

end
