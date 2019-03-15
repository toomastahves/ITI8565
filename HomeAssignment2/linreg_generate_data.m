% Generates linear data with normally distributed noise
function [X, Y] = linreg_generate_data(N, dim)
    if dim == 2
        [X, Y] = linreg_generate_data_2d(N);
    end
    if dim == 3
        [X, Y] = linreg_generate_data_3d(N);
    end
end

function [X, Y] = linreg_generate_data_2d(N)
    b = 2;
    
    X = randn(N, 1)*.5;
    Y = b*X +2 + randn(N, 1)*.5;
end

function [X, Y] = linreg_generate_data_3d(N)
    w1 = 2;
    w2 = 4;

    X1 = randn(N, 1)*.5;
    X2 = X1 + randn(N, 1);
    X3 = randn(N, 1);
    
    X = [X1, X2];
    Y = w1*X1 + w2*X2 + 2*randn(N, 1);
end
