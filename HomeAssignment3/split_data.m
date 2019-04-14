function [train_data, train_labels, test_data, test_labels] = split_data(points, labels)
    cv = cvpartition(size(points,1), 'HoldOut', 0.3);
    idx = cv.test;
    train_data = points(~idx,:);
    train_labels = labels(~idx,:);
    test_data  = points(idx,:);
    test_labels  = labels(idx,:);
end
