% Generates uniform data in four clusters
function [data, labels] = ex1_generate_data(N, dim)
    % Generate 2D dataset
    if dim == 2
        off = 0.4;
        cluster1 = [(rand(N,1)-off)*5, (rand(N,1)+off)*5];
        cluster2 = [(rand(N,1)+off)*5, (rand(N,1)+off)*5];
        cluster3 = [(rand(round(N/2),1)-off)*5, 2*(rand(round(N/2),1)-off)*3];
        cluster4 = [(rand(round(N/2),1)+1)*5, 2*(rand(round(N/2),1)-1)*3];
        data = vertcat(cluster1, cluster2, cluster3, cluster4);
        % Label values for each cluster
        labels = vertcat(ones(N,1), 2*ones(N,1), 3*ones(N/2,1), 4*ones(N/2,1));
    end
    % Generate 3D dataset
    if dim == 3
        mult = 5;
        off = 0.15;
        cluster1 = [(rand(N,1)-off)*mult, (rand(N,1)-off)*mult, 4*(rand(N,1)-3*off)*mult];
        cluster2 = [(rand(N,1)-off)*mult, (rand(N,1)-off)*mult, 4*(rand(N,1)+3*off)*mult];
        cluster3 = [(rand(N,1)-off)*mult, (rand(N,1)+2*off)*mult, 4*(rand(N,1)-4*off)*mult];
        cluster4 = [(rand(N,1)+2)*3, (rand(N,1))*3, (rand(N,1)+2)*3];
        data = vertcat(cluster1, cluster2, cluster3, cluster4);
        % Label values for each cluster
        labels = vertcat(ones(N,1), 2*ones(N,1), 3*ones(N,1), 4*ones(N,1));
    end
end
