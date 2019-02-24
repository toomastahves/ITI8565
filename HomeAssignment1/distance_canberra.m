function dist = distance_canberra(point1, point2)
    dist = sum(abs(point1 - point2) ./ (abs(point1) + abs(point2)));
end
