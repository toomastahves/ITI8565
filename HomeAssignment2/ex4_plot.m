% Plotting gradient descent line movement
function [] = ex4_plot(X, Y, history_slope, history_intercept, history_cost, iterations)
    figure('Name',  'Gradient descent');
    scatter(X, Y)
    title('Gradient descent line search');
    xlabel('X');
    ylabel('Y');
    grid;
    hold on;
    x = linspace(-10, 10)';
    for i=1:size(history_slope,1)
        y = history_slope(i) * x + history_intercept(i);
        l1 = line(x, y);
        l1.Color = [0,0,0,0.3];
        hold on;
    end
    % Plot real line
    y2 = 3 * x - 10;
    l2 = line(x, y2);
    l2.Color = [1,0,0];
    legend(l2, 'Real line');
    
    % Cost plot
    %figure('Name',  'Gradient descent cost');
    %plot(1:iterations, history_cost);
    %title('Gradient descent cost');
    %xlabel('Iterations');
    %ylabel('Cost');
    %grid;
end
