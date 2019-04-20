close all
clear

[X, Y] = ex2_create_data(1000);
[train_data, train_labels, test_data, test_labels] = split_data(X, Y);
predicted_labels = ex2_knn_classifier(train_data, train_labels, test_data, 10);
ex2_plot(train_data, train_labels, test_data, test_labels, predicted_labels)

N = size(test_labels, 1);
weights = 1/N * ones([N,1]);

for i=1:100
    et = sum(weights .* (test_labels ~= predicted_labels));
    if et > 0.5
        weights = -weights;
        et = sum(weights .* (test_labels ~= predicted_labels));
    end
    
    alpha = 0.5 * log((1-et)/et);
    weights = weights .* exp(-alpha * test_labels .* predicted_labels);
    weights = weights / sum(weights);
end

Hx = sign(sum(alpha*predicted_labels));
