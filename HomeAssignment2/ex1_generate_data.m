% Generates uniform data in three clusters
function [data, labels] = ex1_generate_data(N, mult, off)
    cluster1 = [(rand(N,1)-off)*mult, (rand(N,1))*mult, (rand(N,1))*mult];
    cluster2 = [(rand(N,1))*mult, (rand(N,1)-off)*mult, (rand(N,1))*mult];
    cluster3 = [(rand(N,1))*mult, (rand(N,1))*mult, (rand(N,1)-off)*mult];
    data = vertcat(cluster1, cluster2, cluster3);
    % Label values for each cluster
    labels = vertcat(ones(N,1), 2*ones(N,1), 3*ones(N,1));
end
