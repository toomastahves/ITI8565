% Plotting 2D kNN
function [] = ex2_plot(train_data, train_labels, test_data, test_labels, predicted_labels)
    figure('Name',  'kNN');
    % Plot incorrect predictions
    false_predictions_idx = find(test_labels - predicted_labels ~= 0);
    scatter(test_data(false_predictions_idx,1), test_data(false_predictions_idx,2), 30, [1, 0, 0]);
    hold on
    % Plot correct predictions
    true_predictions_idx = find(test_labels - predicted_labels == 0);
    scatter(test_data(true_predictions_idx,1), test_data(true_predictions_idx,2), 30, [0, 1, 0]);
    hold on
    % Plot train data
    scatter(train_data(:,1), train_data(:,2), 10, train_labels);
    hold on
    % Plot test data
    scatter(test_data(:,1), test_data(:,2), 10, predicted_labels);
    hold on
    % Other
    title('Data with kNN predicted labels');
    legend('Incorrect prediction','Correct prediction');
    xlabel('Feature 1');
    ylabel('Feature 2');
    axis equal;
    grid;
end
