% DBSCAN implementation
function labels = cluster_dbscan(data, eps, minpts)
    N = size(data, 1);
    C = 0; % Initiating cluster index
    labels = zeros(N, 1);
    for i = 1:N % Iterating over points
        p = data(i,:);
        if labels(i) == 0
            % Searching for points around p within distance eps
            neighbors = findNeighbors(data, p, eps);
            M = size(neighbors, 1);
            if M > minpts
                % Discovered new cluster
                C = C + 1;
                % Assigning all valid points to cluster C
                labels = buildCluster(C, i, data, neighbors, eps, minpts, labels);
            else
                % Mark as a noise
                labels(i) = -1;
            end
        end
    end
    disp('DBSCAN finished.');
end

function labels = buildCluster(C, core_i, points, neighbors, eps, minpts, labels)
    % C - current cluster
    % core_i - index of current core point in cluster C
    labels(core_i) = C;
    M = size(neighbors, 1);
    % Loop will grow dynamically as new neighbors are added to queue
    for i = 1:M
        M = size(neighbors, 1); % M changes dynamically
        np = neighbors(i, end); % Get index of a point
        if labels(np) == -1 % If it was noise then assign to cluster
            labels(np) = C;
        end
        if labels(np) == 0 % If it was unassigned then assign to cluster
            labels(np) = C;
            % Find neighbors of neighbor
            neighbors2 = findNeighbors(points, neighbors(i,1:end-1), eps); 
            [N,~] = size(neighbors2);
            if N > minpts
                neighbors = [neighbors; neighbors2]; % Add to queue
            end
        end
    end
end

function neighbors = findNeighbors(points, p, eps)
    neighbors = [];
    N = size(points, 1);
    for i = 1:N
        q = points(i,:);
        d = distance_minkowski(p, q, 2);
        q = [q, i];
        if d < eps
            neighbors = [neighbors; q]; % Last value is index
        end
    end
end
