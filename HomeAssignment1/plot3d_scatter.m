% 3D scatter plot for both K-means and DBSCAN
function [] = plot3d_scatter(data, labels, means, name)
    figure('Name',  name);
    scatter3(data(:,1), data(:,2), data(:,3), 10, labels/3);
    hold on;
    scatter3(means(:,1),means(:,2),means(:,3), 100);
    xlabel('Feature 1');
    ylabel('Feature 2');
    zlabel('Feature 3');
    title(name)
end
