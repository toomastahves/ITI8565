% Entry point for running linear regression functions
function [corr_matrix] = ex3_main(X, Y, max_iterations, R_squared_limit, alpha)
    % Calculate multicollinearity matrix
    corr_matrix = ex3_correlation_coefficients(X);
    % Running stepwise regression
    [R_squared_performance, X, Y, slope, intercept] = ex3_stepwise_regression(X, Y, max_iterations, R_squared_limit, alpha);
    % Plotting learning rate
    figure('Name',  'Learning rate');
    plot(R_squared_performance(:,1), R_squared_performance(:,2));
    title('Learning rate');
    xlabel('Iteration number');
    ylabel('R^2');
    grid;
    % Plotting final result
    figure('Name',  'Stepwise regression');
    linreg_plot(X, Y, slope, intercept)
end

% Plotting points and regression line depending on dimension
function [] = linreg_plot(X, Y, slope, intercept)
    [~, X_dim] = size(X);
    if X_dim == 1
        plot2d(X, Y, slope, intercept);
    end
    if X_dim == 2
        plot3d(X, Y, slope, intercept);
    end
    if X_dim >= 3
        disp('Too many dimensions to plot');
    end
end

% Plotting 2D plot
function [] = plot2d(X, Y, slope, intercept)
    scatter(X, Y);
    axis equal
    xlabel('X');
    ylabel('Y');
    hold on
    x = linspace(-10, 10)';
    y = intercept + slope * x;
    line(x, y, 'Color', 'red');
    title('Stepwise regression');
    grid;
end

% Plotting 3D plot
function [] = plot3d(X, Y, slope, intercept)
    scatter3(X(:,1), X(:,2), Y);
    axis equal
    xlabel('X1');
    ylabel('X2');
    zlabel('Y');
    set(gca,'XLim',[-10, 10],'YLim',[-10, 10],'ZLim',[-10, 10]);
    hold on

    [x, y] = meshgrid(-10:0.1:10);
    z = slope(1)*x + slope(2)*y + intercept;
    s = surf(x,y,z, 'FaceAlpha',0.5);
    s.EdgeColor = 'none';
    title('Stepwise regression');
end
