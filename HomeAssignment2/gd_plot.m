% Plotting gradient descent line movement
function [] = gd_plot(X, Y, history_slope, history_intercept)
    figure('Name',  'Gradient descent');
    scatter(X, Y)
    title('Gradient descent line search');
    xlabel('X');
    ylabel('Y');
    grid;
    axis equal
    hold on;
    x = linspace(-10, 10)';
    for i=1:size(history_slope,1)
        y = history_slope(i) * x + history_intercept(i);
        l = line(x, y);
        l.Color = [0,0,0,0.3];
        hold on;
    end
end
