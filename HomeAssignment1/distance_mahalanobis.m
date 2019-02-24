function dist = distance_mahalanobis(point1, point2)
    dist = sqrt((point2 - point1) * pinv(cov([point1; point2])) * (point2 - point1)');
end
