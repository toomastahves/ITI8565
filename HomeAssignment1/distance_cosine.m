function dist = distance_cosine(point1, point2)
    dist = 1 - dot(point1, point2) / (norm(point1) * norm(point2));
end
