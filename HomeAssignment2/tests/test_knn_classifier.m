% Generate data
[points, labels] = generate_labeled_data(100, 10, 0.7);
% Split data
[train_data, train_labels, test_data, test_labels] = split_data(points, labels);

% Implemented knn classifier result
predicted_labels = knn_classifier(train_data, train_labels, test_data, test_labels, 3);

% Built-in knn classifier result
Mdl = fitcknn(train_data, train_labels, 'NumNeighbors', 3);
predicted_labels_fitcknn = predict(Mdl, test_data);

% Compare arrays
if isequal(predicted_labels, predicted_labels_fitcknn) == 1
    disp('Arrays are equal');
else
    disp('Arrays are not equal');
end
