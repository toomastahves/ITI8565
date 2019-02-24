function [] = plot3d_dbscan(data, eps, minpts)
    figure('Name', 'DBSCAN');
    labels = cluster_dbscan(data, eps, minpts);
    scatter3(data(:,1), data(:,2), data(:,3), 10, labels/3);
    xlabel('Feature 1');
    ylabel('Feature 2');
    zlabel('Feature 3');
    title('DBSCAN');
end
