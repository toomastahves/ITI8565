% Generates uniform data in three clusters
function data = generate_data(N)
    mult = 10;
    off = 5;
    cluster1 = [(rand(N,1)-off)*mult, (rand(N,1))*mult, (rand(N,1))*mult];
    cluster2 = [(rand(N,1))*mult, (rand(N,1)-off)*mult, (rand(N,1))*mult];
    cluster3 = [(rand(N,1))*mult, (rand(N,1))*mult, (rand(N,1)-off)*mult];
    cluster4 = [(rand(N,1))*mult, (rand(N,1)-off)*mult, (rand(N,1)-off)*mult];
    data = vertcat(cluster1, cluster2, cluster3);
end
