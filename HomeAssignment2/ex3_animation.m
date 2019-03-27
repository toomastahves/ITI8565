close all
clear
%rng default

% Ex 3
[X, Y] = ex3_generate_data(100, 3);
% Calculations
[R_squared_performance, ~, ~, slope, intercept, history_slope, history_intercept] = ex3_stepwise_regression(X, Y, 20, 0.95, 0.02);

% Plotting points
fig = figure;
scatter3(X(:,1), X(:,2), Y);
axis equal
xlabel('X1');
ylabel('X2');
zlabel('Y');
set(gca,'XLim',[-10, 10],'YLim',[-10, 10],'ZLim',[-10, 10]);
title('Stepwise regression');
campos([ -166.2451  -39.4836   28.3483])
hold on

% Plane mesh
[x, y] = meshgrid(-10:0.1:10);

% Animation
N = size(history_slope, 1);
for i = 1:N
    % Plot current line
    z = history_slope(i,1)*x + history_slope(i,2)*y + history_intercept(i,:);
    s = surf(x,y,z, 'FaceAlpha',0.3);
    s.EdgeColor = 'none';
    
    % Plot info
    r_squared = strcat('R^2 = ', ' ', num2str(round(R_squared_performance(i,2),2)));
    iter_text = strcat('Iterations = ', ' ', num2str(i));
    title_text = strcat(iter_text, " ", r_squared);
    title(title_text);
    
    % Animation part
    frame = getframe(fig);
	im{i} = frame2im(frame);
    if i < N
        set(s,'visible','off');
    end
end

% Create gif
filename = 'stepwise_regression.gif';
gif_speed = 0.2;
for idx = 1:N
    [A,map] = rgb2ind(im{idx},256);
    if idx == 1
        % Create initial gif file
        imwrite(A,map,filename,'gif','LoopCount',Inf,'DelayTime',gif_speed);
    elseif idx == N
        % Hold last frame
        imwrite(A,map,filename,'gif','WriteMode','append','DelayTime', 3);
    else
        % Append frames to gif
        imwrite(A,map,filename,'gif','WriteMode','append','DelayTime',gif_speed);
    end
end
