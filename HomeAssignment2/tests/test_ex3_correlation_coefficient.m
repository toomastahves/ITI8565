clear

% 2D Test data
[X, ~] = ex3_generate_data(100, 2);

% Test correlation coeficients
corr_matrix = ex3_correlation_coefficients(X);
corr_matrix_builtin = corrcoef(X);

if isequal(round(corr_matrix, 2), round(corr_matrix_builtin, 2))
    disp('2D Correlation coefficients OK');
else
    disp('2D Correlation coefficients not equal');
end

% 3D Test data
[X, ~] = ex3_generate_data(100, 3);

% Test correlation coeficients
corr_matrix = ex3_correlation_coefficients(X);
corr_matrix_builtin = corrcoef(X);

if isequal(round(corr_matrix, 2), round(corr_matrix_builtin, 2))
    disp('3D Correlation coefficients OK');
else
    disp('3D Correlation coefficients not equal');
end
