% 2D data manual testing

% Generate 2D dataset
data = generate_2d_data(100);

% Calculate K-means clustering
K = find_k_value(data);
[labels1, means1] = cluster_kmeans(data, K);
plot2d_scatter(data, labels1, means1, 'K-means');

% Calculate DBSCAN clustering
minpts = 10;
eps = 20;
[labels2, means2] = cluster_dbscan(data, eps, minpts);
plot2d_scatter(data, labels2, means2, 'DBSCAN');
