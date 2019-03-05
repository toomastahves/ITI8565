function dist = distance_mahalanobis(point1, point2, data)
    dist = sqrt((point2 - point1) * pinv(cov(data)) * (point2 - point1)');
end
