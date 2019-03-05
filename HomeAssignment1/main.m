close all
clear
%rng default

% Generate data N = 100 in each cluster, total 3 * 100 = 300 points
data = generate_data(100);

% Calculate entropies and draw distributions plot
entropies = plot_distributions(data);

% Find best K value
K = find_k_value(data);
% Assign data to clusters using K-means
[labels1, means1] = cluster_kmeans(data, K);
% Draw 3D scatter plot
plot3d_scatter(data, labels1, means1, 'K-means');

% Assign eps and minpts values
minpts = 10;
eps = 20;
% Assign data to clusters using DBSCAN
[labels2, means2] = cluster_dbscan(data, eps, minpts);
% Draw 3D scatter plot
plot3d_scatter(data, labels2, means2, 'DBSCAN');
