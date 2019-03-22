% kNN regression
function predicted_labels = knn_regression(train_data, train_labels, test_data, k)
    

    for i=1:size(test_data, 1)
        [~, neighbor_indexes] = mink(sum((train_data - train_data(i,:)).^2, 2), k);
        predicted_labels(i,1) = mean(train_labels(neighbor_indexes));
    end
end
