clear

N = 100;
count = 0;
% Run test for N times with different datasets.
for i=1:N
    % Generate data
    [points, labels] = ex1_generate_data(100, 2);
    % Split data
    [train_data, train_labels, test_data, test_labels] = ex1_split_data(points, labels);

    % Implemented knn classifier result
    predicted_labels = ex1_knn_classifier(train_data, train_labels, test_data, 3, 2);

    % Built-in knn classifier result
    Mdl = fitcknn(train_data, train_labels, 'NumNeighbors', 3);
    predicted_labels_fitcknn = predict(Mdl, test_data);

    % Count how many times arrays are different
    if isequal(predicted_labels, predicted_labels_fitcknn) == 1
        count = count + 1;
    end
end

disp(strcat('Percent of results different:  ', num2str(count/N*100), '%'));
