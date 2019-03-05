close all
clear
%rng default

% Generate data N = 100 in each cluster, total 3 * 100 = 300 points
data = generate_data(100);

% Calculate entropies and draw distributions plot
entropies = plot_distributions(data);

% Calculate K-means labels and draw plot for K = 3
K = find_k_value(data);
[labels1, means1] = plot3d_kmeans(data, K);

% Calculate DBSCAN labels and draw plot for eps = 20 and minpts = 10
[labels2, means2] = plot3d_dbscan(data, 20, 10);
