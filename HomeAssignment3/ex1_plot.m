% Plot neural network results
function [acc] = ex1_plot(train_data, train_labels, test_data, test_labels, error_history, wh1, bh1, wh2, bh2, wo, bo)
    % Extract predicted labels. Compare to real labels, calculate accuracy.
    [acc, predicted_labels] = validate(test_data, test_labels, wh1, bh1, wh2, bh2, wo, bo);

    % Plot scatter
    dim = size(train_data, 2);
    if(dim == 2)
        plot2d(train_data, train_labels, test_data, test_labels, predicted_labels)
    end
    if(dim == 3)
        plot3d(train_data, train_labels, test_data, test_labels, predicted_labels)
    end
        
    % Plot error evolution
    figure('Name',  'Cross-entropy error evolution');
    plot(error_history(:,1), error_history(:,2));
    title('Cross-entropy error evolution');
    xlabel('Epochs');
    ylabel('Error');
    grid on;
    
end

function [] = plot2d(train_data, train_labels, test_data, test_labels, predicted_labels)
    figure('Name',  'Neural Network classifier');
    % Plot incorrect predictions
    false_predictions_idx = find(test_labels - predicted_labels ~= 0);
    scatter(test_data(false_predictions_idx,1), test_data(false_predictions_idx,2), 30, [1, 0, 0]);
    hold on;
    % Plot correct predictions
    true_predictions_idx = find(test_labels - predicted_labels == 0);
    scatter(test_data(true_predictions_idx,1), test_data(true_predictions_idx,2), 30, [0, 1, 0]);
    hold on;
    % Plot train data
    scatter(train_data(:,1), train_data(:,2), 10, train_labels);
    hold on
    % Plot test data
    scatter(test_data(:,1), test_data(:,2), 10, predicted_labels);
    hold on
    title('Neural Network classifier');
    legend('Incorrect prediction','Correct prediction');
    xlabel('Feature 1');
    ylabel('Feature 2');
    grid on;
end

function [] = plot3d(train_data, train_labels, test_data, test_labels, predicted_labels)
    figure('Name',  'Neural Network classifier');
    % Plot incorrect predictions
    false_predictions_idx = find(test_labels - predicted_labels ~= 0);
    scatter3(test_data(false_predictions_idx,1), test_data(false_predictions_idx,2), test_data(false_predictions_idx,3), 30, [1, 0, 0]);
    hold on;
    % Plot correct predictions
    true_predictions_idx = find(test_labels - predicted_labels == 0);
    scatter3(test_data(true_predictions_idx,1), test_data(true_predictions_idx,2), test_data(true_predictions_idx,3), 30, [0, 1, 0]);
    hold on;
    % Plot train data
    scatter3(train_data(:,1), train_data(:,2), train_data(:,3), 10, train_labels);
    hold on
    % Plot test data
    scatter3(test_data(:,1), test_data(:,2), test_data(:,3), 10, predicted_labels);
    hold on
    title('Neural Network classifier');
    xlabel('Feature 1');
    ylabel('Feature 2');
    zlabel('Feature 3');
    grid on;
end

function [acc, predicted_labels] = validate(test_data, test_labels, wh1, bh1, wh2, bh2, wo, bo)
    for i=1:size(test_labels, 1)
        label_predicted = round(softmax(((test_data(i,:) * wh1 + bh1) * wh2 + bh2) * wo + bo));
        label_real = test_labels(i,:);
        [~, col] = find(label_predicted);
        accuracy(i,:) = label_real == col;
        predicted_labels(i,:) = col;
    end
    acc = sum(accuracy) / size(accuracy, 1);
end
