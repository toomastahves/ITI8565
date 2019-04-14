function [cluster, labels] = get_multiclass_data(N)
    cluster1 = 1.5*randn(N, 2) + [0, -3];
    cluster2 = 1.5*randn(N, 2) + [3, 3];
    cluster3 = 1.5*randn(N, 2) + [-3, 3];
    cluster = [cluster1; cluster2; cluster3];
    labels = [1*ones(N,1); 2*ones(N,1); 3*ones(N,1)];
end
