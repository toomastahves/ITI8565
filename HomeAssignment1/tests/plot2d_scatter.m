function [labels, means] = plot2d_scatter(data, labels, means, name)
    figure('Name', name);
    scatter(data(:,1), data(:,2), 10, labels/3);
    hold on;
    scatter(means(:,1),means(:,2), 100);
    xlabel('Feature 1');
    ylabel('Feature 2');
    title(name)
end
