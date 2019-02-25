% Test data
point1 = [-3.1, -2.1, -1.2];
point2 = [3.2, 1.2, 2.2];
point3 = [3.2, -5.7, -4.2];
point4 = [-0.9, 2.1, -8.1];
data = [point1; point2; point3; point4];

% Test Mahalanobis distance
d_mahal_my = distance_mahalanobis(data, point1, point2);
d_mahal_pdist = pdist(data, 'mahalanobis');
d_mahal_pdist2 = pdist2(data, point1, 'mahalanobis');
assert(round(d_mahal_my,3) == round(d_mahal_pdist(1),3))
assert(round(d_mahal_my,3) == round(d_mahal_pdist2(2),3))

% Test Cosine distance
d_cosine_my = distance_cosine(point1, point2);
d_cosine_matlab = pdist2(point1, point2, 'cosine');
assert(round(d_cosine_my,3) == round(d_cosine_matlab,3))

% Test Canberra distance
d_canberra_my = distance_canberra(point1, point2);
d_canberra_wolfram = 3; % Result obtained from Wolfram Mathematica
assert(round(d_canberra_my,3) == round(d_canberra_my,3))

% Test Manhattan  distance
d_manhattan_my = distance_minkowski(point1, point2, 1);
d_manhattan_matlab = pdist([point1; point2], 'minkowski', 1);
assert(round(d_manhattan_my,3) == round(d_manhattan_matlab,3))

% Test Euclidean distance
d_euclidean_my = distance_minkowski(point1, point2, 2);
d_euclidean_matlab = pdist([point1; point2], 'euclidean');
assert(round(d_euclidean_my,3) == round(d_euclidean_matlab,3))

% Test Chebyshev distance
d_chebyshev_my = distance_minkowski(point1, point2, Inf);
d_chebyshev_matlab = pdist([point1; point2], 'chebychev');
assert(round(d_chebyshev_my,3) == round(d_chebyshev_matlab,3))
