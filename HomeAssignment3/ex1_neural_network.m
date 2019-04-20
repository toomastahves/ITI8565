% Multi class neural network classifier
function [error_history, wh1, bh1, wh2, bh2, wo, bo] = ex1_neural_network(X, Y_in, epochs, rate)

    error_history = zeros(epochs, 2);

    % Neurons in each layer
    [N, input_neurons] = size(X);
    hidden1_neurons = 7;
    hidden2_neurons = 9;
    output_neurons = size(unique(Y_in), 1);

    % One hot encoder
    Y = zeros(N, output_neurons);
    for i = 1:N
        Y(i, Y_in(i)) = 1;
    end

    % Initial weights and biases from Gaussian distribution. Optimized with factor 1 / sqrt(N)
    wh1 = randn(input_neurons, hidden1_neurons) / sqrt(N);
    bh1 = randn(hidden1_neurons, 1)' / sqrt(N);
    wh2 = randn(hidden1_neurons, hidden2_neurons) / sqrt(N);
    bh2 = randn(hidden2_neurons, 1)' / sqrt(N);
    wo = randn(hidden2_neurons, output_neurons) / sqrt(N);
    bo = randn(output_neurons, 1)' / sqrt(N);

    for epoch = 1:epochs
        % Feedforward
        % input -> hidden1
        zh1 = X * wh1 + bh1;
        ah1 = sigmoid(zh1);
        % hidden1 -> hidden2
        zh2 = ah1 * wh2 + bh2;
        ah2 = sigmoid(zh2);
        % hidden2 -> output
        zo = ah2 * wo + bo;
        ao = softmax(zo);

        % Backpropagation
        % output -> hidden2
        dc_dzo = (ao - Y);
        dwo = ah2' * (sigmoid_derivative(zo) .* dc_dzo);
        dbo = (sigmoid_derivative(zo) .* dc_dzo);

        % hidden2 -> hidden1
        dc_zh2 = (dc_dzo * wo') .* sigmoid_derivative(zh2);
        dwh2 = ah1' * dc_zh2;
        dbh2 = dc_zh2;

        % hidden1 -> input
        dc_zh1 = (dc_zh2 * wh2') .* sigmoid_derivative(zh1);
        dwh1 = X' * dc_zh1;
        dbh1 = dc_zh1;

        % Update weights and biases
        wh2 = wh2 - rate * dwh2;
        bh2 = bh2 - rate * sum(dbh2, 1);
        wh1 = wh1 - rate * dwh1;
        bh1 = bh1 - rate * sum(dbh1, 1);
        wo = wo - rate * dwo;
        bo = bo - rate * sum(dbo, 1);

        % Calculate cross-entropy error after each iteration
        error = sum(-Y .* log(ao), 'all');
        error_history(epoch,:) = [epoch, error];
    end
end
