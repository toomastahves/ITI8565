% Create data in 3 clusters
function [cluster, labels] = ex1_create_data(N, dim)
    if(dim == 2)
        cluster1 = 1.5*randn(N, 2) + [0, -3];
        cluster2 = 1.5*randn(N, 2) + [3, 3];
        cluster3 = 1.5*randn(N, 2) + [-3, 3];
        cluster = [cluster1; cluster2; cluster3];
        labels = [1*ones(N,1); 2*ones(N,1); 3*ones(N,1)];
    end
    if(dim == 3)
        cluster1 = 2.5*randn(N, 3) + [0, -3, -3];
        cluster2 = 2.5*randn(N, 3) + [3, 3, 3];
        cluster3 = 2.5*randn(N, 3) + [-3, 3, 0];
        cluster = [cluster1; cluster2; cluster3];
        labels = [1*ones(N,1); 2*ones(N,1); 3*ones(N,1)];
    end
end
