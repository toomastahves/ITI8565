% Plotting
function [] = knn_scatter3d(train_data, train_labels, test_data, predicted_labels)
    figure('Name',  'kNN');
    scatter3(train_data(:,1), train_data(:,2), train_data(:,3), [], train_labels);
    hold on
    scatter3(test_data(:,1), test_data(:,2), test_data(:,3), [], predicted_labels);
    title('Data with kNN predicted labels');
    xlabel('Feature 1');
    ylabel('Feature 2');
    zlabel('Feature 3');
end
