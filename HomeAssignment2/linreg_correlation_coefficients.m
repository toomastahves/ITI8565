% Calculate correlation coefficients for multicollinearity check
function corr_matrix = linreg_correlation_coefficients(X, Y)
    Z = [X, Y];
    N = size(Z, 2);
    corr_matrix = zeros(N, N);
    for i=1:N
        for j=1:N
            numerator = sum((Z(:,i) - mean(Z(:,i))) .* (Z(:,j) - mean(Z(:,j))));
            denominator = sqrt(sum((Z(:,i) - mean(Z(:,i))).^2)) * sqrt(sum((Z(:,j) - mean(Z(:,j))).^2));
            corr_matrix(i, j) =  numerator / denominator;
        end
    end
end
