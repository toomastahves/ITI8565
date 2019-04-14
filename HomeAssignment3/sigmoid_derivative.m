function s = sigmoid_derivative(z)
    s = sigmoid(z) .* (1 - sigmoid(z));
end
