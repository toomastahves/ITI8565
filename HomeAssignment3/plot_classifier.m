function [acc] = plot_classifier(X, Y, cost_history, test_data, test_labels, wh, bh, wo, bo)
    % Testing predictions
    for i=1:size(test_labels, 1)
        label_predicted = round(softmax((test_data(i,:) * wh + bh) * wo + bo));
        label_real = test_labels(i,:);
        [~, col] = find(label_predicted);
        accuracy(i,:) = label_real == col;
        predicted_labels(i,:) = col;
    end
    
    % Calculating accuracy
    acc = sum(accuracy) / size(accuracy, 1);
    
    % Plot cost function
    figure(1);
    plot(cost_history(1:100,1), cost_history(1:100,2));
    
    % Plot scatter
    figure(2);
    scatter(X(:,1), X(:,2), [], Y);
    hold on;
    false_predictions_idx = find(test_labels - predicted_labels ~= 0);
    scatter(test_data(false_predictions_idx,1), test_data(false_predictions_idx,2), 30, [1, 0, 0]);
    hold on;
    true_predictions_idx = find(test_labels - predicted_labels == 0);
    scatter(test_data(true_predictions_idx,1), test_data(true_predictions_idx,2), 30, [0, 1, 0]);
    grid on;
end
