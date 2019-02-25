% Load test data
load('data.mat')
% How to compare results:
% Calculate mean values using built-in function kmeans
% Calculate mean values using cluster_kmeans function
% Sort and round results
% Compare results and show percentage of how many results are the same
errors = 0;
N = 100;
for i = 1:N
    try
        [labels1, means1] = kmeans(data, 3);
        [labels2, means2] = cluster_kmeans(data, 3);
        means1 = round(sort(means1),1);
        means2 = round(sort(means2),1);
        assert(means1(1) == means2(1))
        assert(means1(2) == means2(2))
        assert(means1(3) == means2(3))
    catch
        errors = errors + 1;
    end
end
disp(strcat('Percent of results different: ', num2str(errors/N*100), '%'));
