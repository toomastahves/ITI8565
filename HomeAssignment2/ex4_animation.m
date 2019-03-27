close all
clear

% Ex 4
% Get data for gradient descent
[X, Y] = ex4_generate_data(200);
iterations = 200;
rate = 0.01;
% Calculate parameters using gradient descent
[history_slope, history_intercept, history_cost] = ex4_gradient_descent(X, Y, iterations, rate);

% Plot scattered points
fig = figure;
scatter(X, Y);
title('Gradient descent line search');
xlabel('X');
ylabel('Y');
axis tight manual;
xlim([-10, 10])
ylim([-40, 20])
grid;
hold on;

% Plot real line
x = linspace(-10, 10)';
y2 = 3 * x - 10;
l2 = line(x, y2);
l2.Color = [1,0,0];
hold on;

% Animation
N = size(history_slope, 1);
for i = 1:N
    % Plot current line
    x = linspace(-10, 10)';
    y = history_slope(i) * x + history_intercept(i);
    l1 = line(x, y);
    xlim([-10, 10]);
    ylim([-40, 20]);
    l1.Color = [0,0,0,0.2];
    a_text = strcat('a = ', ' ', num2str(round(history_slope(i),2)));
    b_text = strcat('b = ', ' ', num2str(round(history_intercept(i),2)));
    title_text = {a_text, b_text};
    title(title_text);
    hold on;
    
    % Animation part
    frame = getframe(fig);
	im{i} = frame2im(frame);
end

% Create gif
filename = 'gradient_descent.gif';
gif_speed = 0.05;
for idx = 1:N
    [A,map] = rgb2ind(im{idx},256);
    if idx == 1
        % Create initial gif file
        imwrite(A,map,filename,'gif','LoopCount',Inf,'DelayTime',gif_speed);
    else
        % Append frames to gif
        imwrite(A,map,filename,'gif','WriteMode','append','DelayTime',gif_speed);
    end
end
