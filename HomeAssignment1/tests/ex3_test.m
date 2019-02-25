% Load test data
load('data.mat')
eps = 20;
minpts = 10;
labels1 = cluster_dbscan(data, eps, minpts);
[labels2, ~] = dbscan_test(data, eps, minpts);
for i = 1:300
    assert(labels1(i) == labels2(i))
end
