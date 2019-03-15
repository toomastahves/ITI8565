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
    x = linspace(-2, 2)';
    y = intercept + slope * x;
    line(x, y)
    grid
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
end
