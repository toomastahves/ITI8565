close all
clear
%rng default

X = [[0,1,0];[0,0,1];[1,0,0];[1,1,0];[1,1,1]];
Y = [1;0;0;1;1];

w = [0.7; 0.6; 0.2];
b = 0.25;
rate = 0.05;

for i = 1:20000
    % Feedforward
    z = X * w + b;
    a = sigmoid(z);
    % Backpropagation
    dw = mtimes(X', 2 * (a - Y) .* sigmoid_derivative(z));
    db = 2 * (a - Y) .* sigmoid_derivative(z);
    % Update
    w = w - rate * dw;
    b = b - rate * sum(db);
end

% Testing
prediction = sigmoid([0, 1, 0] * w + b);