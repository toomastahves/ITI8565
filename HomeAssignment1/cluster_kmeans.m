% K-means++ implementation
function [clusters, means_new] = cluster_kmeans(data, K)
    [N, ~] = size(data);
    means_old = choose_best_means(data, K); % K-means++
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

% Finds and returns best mean values for clustering
function means = choose_best_means(data, K)
    [N, ~] = size(data);
    distances = zeros(N, 2);
    % 1. Choose random mean
    means(1,:) = data(randi(N),:);
    for j = 2:K
        % 2. Calculate distances to closest mean
        for i = 1:N
            distances(i, 1) = find_closest_center(means, data(i,:));
        end
        % 3. Choose next mean
        sum_d = sum(distances(:, 1));
        for i = 1:N
            distances(i, 2) = distances(i, 1) / sum_d;
        end
        [~, idx] = max(distances(:,2));
        means(j,:) = data(idx,:);
        % 4. Repeat 2. and 3.
    end
end

% Calculates distance to closest mean
function [min_dist] = find_closest_center(means, point)
    min_dist = Inf;
    [N, ~] = size(means);
    for i = 1:N
        dist = sum((means(i,:) - point).^2);
        if dist < min_dist
            min_dist = dist;
        end
    end
end
