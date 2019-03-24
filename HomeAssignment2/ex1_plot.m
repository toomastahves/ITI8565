% Plotting points. Chooses between 2D and 3D depending on data.
function [] = ex1_plot(train_data, train_labels, test_data, test_labels, predicted_labels)
    dim = size(train_data, 2);
    if dim == 2
        scatter2d(train_data, train_labels, test_data, test_labels, predicted_labels)
    end
    if dim == 3
        scatter3d(train_data, train_labels, test_data, test_labels, predicted_labels)
    end
    if dim > 3
        disp('Too many dimensions to plot');
    end
end

% Plotting 2D kNN
function [] = scatter2d(train_data, train_labels, test_data, test_labels, predicted_labels)
    figure('Name',  'kNN');
    % Plot correct predictions
    false_predictions_idx = find(test_labels - predicted_labels ~= 0);
    scatter(test_data(false_predictions_idx,1), test_data(false_predictions_idx,2), 30, [1, 0, 0]);
    hold on
    % Plot incorrect predictions
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

% Plotting 3D kNN
function [] = scatter3d(train_data, train_labels, test_data, test_labels, predicted_labels)
    figure('Name',  'kNN');
    % Plot correct predictions
    false_predictions_idx = find(test_labels - predicted_labels ~= 0);
    scatter3(test_data(false_predictions_idx,1), test_data(false_predictions_idx,2), test_data(false_predictions_idx,3),50, [1, 0, 0]);
    hold on
    % Plot incorrect predictions
    true_predictions_idx = find(test_labels - predicted_labels == 0);
    scatter3(test_data(true_predictions_idx,1), test_data(true_predictions_idx,2), test_data(true_predictions_idx,3),50, [0, 1, 0]);
    hold on
    % Plot train data
    scatter3(train_data(:,1), train_data(:,2), train_data(:,3), 20, train_labels);
    hold on
    % Plot test data
    scatter3(test_data(:,1), test_data(:,2), test_data(:,3), 20, predicted_labels);
    hold on
    % Other
    title('Data with kNN predicted labels');
    xlabel('Feature 1');
    ylabel('Feature 2');
    zlabel('Feature 3');
end
