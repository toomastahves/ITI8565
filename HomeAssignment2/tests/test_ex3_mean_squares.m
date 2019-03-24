clear

% 2D Test data
[X, Y] = ex3_generate_data(100, 2);

% Test mean squares
[slope, ~] = ex3_mean_squares(X, Y);
slope_builtin = mvregress(X, Y);

if isequal(round(slope,3), round(slope_builtin,3))
    disp('2D Mean squares slopes OK');
else
    disp('2D Mean squares slopes not equal');
end

% 3D Test data
[X, Y] = ex3_generate_data(100, 3);

% Test mean squares
[slope, ~] = ex3_mean_squares(X, Y);
slope_builtin = mvregress(X, Y);

if isequal(round(slope,3), round(slope_builtin,3))
    disp('3D Mean squares slopes OK');
else
    disp('3D Mean squares slopes not equal');
end
