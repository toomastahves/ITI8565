% Test data
[X, Y] = linreg_generate_data(100, 2);

% Test correlation coeficients
corr_matrix = linreg_correlation_coefficients(X, Y);
corr_matrix_builtin = corrcoef([X, Y]);

if isequal(round(corr_matrix, 2), round(corr_matrix_builtin, 2))
    disp('Correlation coefficients OK');
else
    disp('Correlation coefficients not equal');
end

% Test mean squares
[slope, intercept] = linreg_mean_squares(X, Y);
slope_builtin = mvregress(X, Y);

if isequal(round(slope,3), round(slope_builtin,3))
    disp('Mean squares slopes OK');
else
    disp('Mean squares slopes not equal');
end

% Test coefficient of determination
R_squared = linreg_coefficient_of_determination(X, Y, slope, intercept)
mdl = fitlm(X,Y);
R_squared_builtin = mdl.Rsquared.Ordinary

% Not always equal, varies with random data. 
% Maybe built-in method uses modified formula or
% different floating point precision.
if isequal(round(R_squared, 2), round(R_squared_builtin, 2))
    disp('Coefficient of determination OK');
else
    disp('Coefficient of determination not equal');
end
