close all
clear

% Generate data N = 100 in each cluster, total 3 * 100 = 300 points
data = generate_data(100);

% Calculate entropies and draw distributions plot
entropies = plot_distributions(data);

% Calculate K-means labels and draw plot for K = 3
plot3d_kmeans(data, 3);

% Calculate DBSCAN labels and draw plot for eps = 20 and minpts = 10
plot3d_dbscan(data, 20, 10);
