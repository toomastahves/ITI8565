function dist = distance_mahalanobis(data, point1, point2)
    dist = sqrt((point2 - point1) * pinv(cov(data)) * (point2 - point1)');
end
