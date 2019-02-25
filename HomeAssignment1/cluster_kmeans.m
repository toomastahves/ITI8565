% K-means implementation
function [clusters, means_new] = cluster_kmeans(data, K)
    [N, D] = size(data);
    % Creating random means within data range
    means_old = zeros(K, D);
    
    % If we select uniform random value as initial mean, then error rate 30%
    %for i = 1:D
    %    column = max(data(:,i)) - min(data(:,i)) * rand(K,1) + min(data(:,i));
    %    means_old(:,i) = column;
    %end
    
    % If we select random mean from initial dataset, then error rate 10%
    for i = 1:K
        means_old(:,i) = data(randi(N),:);
    end
    
    means_new = means_old; % Used to check ending condition
    clusters = zeros(N,1); % Initially data unclustered
    distances = Inf(N, 1); % Initial distance at infinity
    % Starting iterations to find means
    while(true)
        means_old = means_new;
        for i = 1:N % Iterating over points
            p = data(i,:);
            dist_old = distances(i);
            for j = 1:K % Iterate over means
                m = means_old(j,:);
                dist_new = distance_minkowski(p, m, 2); % Distance between point and mean
                % Searching for shortest distance
                if dist_new < dist_old
                    dist_old = dist_new;
                    clusters(i) = j; % Assign point into cluster
                    distances(i) = dist_old;
                end
            end
        end
        % Joining points and clusters
        pts_clst = horzcat(data, clusters);
        for j = 1:K % Iterating over means
            % Filtering points by cluster
            points_filtered = pts_clst(pts_clst(:,end) == j, :);
            M = size(points_filtered, 1);
            % Updating means
            if M == 0 || M == 1
                means_new(j,:) = means_old(j,:);
            else
                % Calculating new mean for current cluster
                new_mean = mean(points_filtered);
                % Removing last column because pts_clst last column is 'clusters'
                means_new(j,:) = new_mean(:,1:end-1);
            end
        end
        % If means do not change anymore, then stop
        if isequal(round(means_old,4), round(means_new,4))
            disp('K-means finished.');
            break;
        end
    end
end
