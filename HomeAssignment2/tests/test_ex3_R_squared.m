clear

% 2D Test data
[X, Y] = ex3_generate_data(100, 2);
[slope, intercept] = ex3_mean_squares(X, Y);

% Test coefficient of determination
R_squared = ex3_R_squared(X, Y, slope, intercept);
mdl = fitlm(X,Y);
R_squared_builtin = mdl.Rsquared.Ordinary;

% Not always exactly equal, varies with random data. 
% Maybe built-in method uses modified formula or different floating point precision.
if isequal(round(R_squared, 2), round(R_squared_builtin, 2))
    disp('2D Coefficient of determination OK');
else
    disp('2D Coefficient of determination not equal');
end
disp(strcat('Built-in: ', num2str(R_squared_builtin), ' || Implemented: ', num2str(R_squared)));

% 3D Test data
[X, Y] = ex3_generate_data(100, 3);
[slope, intercept] = ex3_mean_squares(X, Y);

% Test coefficient of determination
R_squared = ex3_R_squared(X, Y, slope, intercept);
mdl = fitlm(X,Y);
R_squared_builtin = mdl.Rsquared.Ordinary;

% Not always exactly equal, varies with random data. 
% Maybe built-in method uses modified formula or different floating point precision.
if isequal(round(R_squared, 3), round(R_squared_builtin, 3))
    disp('3D Coefficient of determination OK');
else
    disp('3D Coefficient of determination not equal');
end
disp(strcat('Built-in: ', num2str(R_squared_builtin), ' || Implemented: ', num2str(R_squared)));
