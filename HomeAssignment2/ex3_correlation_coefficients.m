% Calculates correlation coefficients for multicollinearity check
function corr_matrix = ex3_correlation_coefficients(X)
    N = size(X, 2);
    corr_matrix = zeros(N, N);
    for i=1:N
        for j=1:N
            numerator = sum((X(:,i) - mean(X(:,i))) .* (X(:,j) - mean(X(:,j))));
            denominator = sqrt(sum((X(:,i) - mean(X(:,i))).^2)) * sqrt(sum((X(:,j) - mean(X(:,j))).^2));
            corr_matrix(i, j) =  numerator / denominator;
        end
    end
end
