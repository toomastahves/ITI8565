% Creating data with labels -1 and 1
function [cluster, labels] = ex2_create_data(N)
    cluster1 = 2*randn(N, 2) + [0, -3];
    cluster2 = 2*randn(N, 2) + [3, 3];
    cluster = [cluster1; cluster2];
    labels = [1*ones(N,1); -1*ones(N,1)];
end
