% kNN classifier
function predicted_labels = ex1_knn_classifier(train_data, train_labels, test_data, k, dist_param)
    N = size(test_data, 1);
    predicted_labels = zeros(N, 1);
    % Predicting labels
    for i=1:N
        predicted_labels(i,1) = get_predicted_label(train_data, train_labels, test_data(i,:), k, dist_param);
    end
    % Returning predicted labels
end

% Getting single predicted label
function predicted_label = get_predicted_label(train_data, train_labels, point, k, dist_param)
    % Calculate Euclidean distance to each point in train data, sums rows
    distances = zeros(size(train_data, 1), 1);
    for i=1:size(train_data, 1)
        distances(i,:) = ex1_distance_minkowski(train_data(i,:), point, dist_param);
    end
    
    
    % Sort and find indexes of k closest neighbors
    [~, neighbor_indexes] = mink(distances, k);
    % Calculate mode label value
    predicted_label = mode(train_labels(neighbor_indexes));
end

% Single line kNN classifier :)
% Not used, too slow
function predicted_labels = knn_classifier_single_line(train_data, train_labels, test_data, k)
    predicted_labels = (arrayfun(@(m) mode(train_labels(arrayfun(@(j) subsref(sortrows([(1:size(train_data, 1))', sum((train_data - test_data(m,:)).^2, 2)], 2), struct('type', '()', 'subs', {{j, 1}})), 1:k))), 1:size(test_data, 1)))';
end
