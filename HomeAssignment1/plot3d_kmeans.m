function [labels, means] = plot3d_kmeans(data, K)
    figure('Name',  'K-means');
    [labels, means] = cluster_kmeans(data, K);
    scatter3(data(:,1), data(:,2), data(:,3), 10, labels/3);
    hold on;
    scatter3(means(:,1),means(:,2),means(:,3), 100);
    xlabel('Feature 1');
    ylabel('Feature 2');
    zlabel('Feature 3');
    title('K-means')
end
