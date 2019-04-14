% https://stackabuse.com/creating-a-neural-network-from-scratch-in-python-multi-class-classification
function [wh, bh, wo, bo, cost_history] = neural_network_classifier(X, Y_in, rate, epochs)
    N = size(X, 1);
    cost_history = zeros(epochs, 2);
    
    % Neurons in each layer
    input_neurons = size(X, 2);
    hidden_neurons = 4;
    output_neurons = 3;

    % Mapping labels to matrix for later matrix computation
    Y = zeros(N, output_neurons);
    for i = 1:N
        Y(i, Y_in(i)) = 1;
    end
    
    % Random initial weights and biases
    wh = rand(input_neurons, hidden_neurons);
    bh = randn(hidden_neurons, 1)';
    wo = rand(hidden_neurons, output_neurons);
    bo = randn(output_neurons, 1)';

    for epoch = 1:epochs
        % Feedforward
        % input -> hidden
        zh = X * wh + bh;
        ah = sigmoid(zh);
        
        % hidden -> output
        zo = ah * wo + bo;
        ao = softmax(zo);

        % Backpropagation
        % output -> hidden
        dwo = ah' * (ao - Y);
        dbo = ao - Y;

        % hidden -> output
        dwh = mtimes(X', sigmoid_derivative(zh) .* ((ao - Y) * wo'));
        dbh = ((ao - Y) * wo') .* sigmoid_derivative(zh);

        % Update weights and biases
        wh = wh - rate * dwh;
        bh = bh - rate * sum(dbh, 1);
        wo = wo - rate * dwo;
        bo = bo - rate * sum(dbo, 1);

        % Calculate cross-entropy
        cost = sum(-Y .* log(ao), 'all');
        cost_history(epoch,:) = [epoch, cost];
    end
end
