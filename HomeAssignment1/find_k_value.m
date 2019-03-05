% This function returns best K value for K-means clustering
function K = find_k_value(data)
    % Iterating over different K values and calculating silhouette values
    % Testing K values from 2 to 10
    sil_means = zeros(9, 2);
    for i = 2:10
        labels = kmeans(data, i);
        si_values = silhouette(data, labels);
        sil_means(i,:) = [i mean(si_values)];
    end
    % Sorting by highest silhouette value
    sil_means = sortrows(sil_means, 2, 'descend');
    % Picking K value that has highest silhouette value
    K = sil_means(1,1);
end
