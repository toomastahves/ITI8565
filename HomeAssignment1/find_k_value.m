% This function returns best K value for K-means clustering
function K = find_k_value(data)
    sil_means = [];
    % Iterating over different K values and calculating silhouette values
    for i = 1:10
        labels = kmeans(data, i);
        si_values = silhouette(data, labels);
        sil_means(i,:) = [i mean(si_values)];
    end
    % Hack to get rid of NaN values
    sil_means(isnan(sil_means)) = -Inf;
    % Sorting by highest silhouette value
    sil_means = sortrows(sil_means, 2, 'descend');
    % Picking cluster value that has highest silhouette value
    K = sil_means(1,1);
end
