function [X, Y] = read_file()
    fileID = fopen('X.txt','r');
    formatSpec = '%f %f';
    sizeA = [2, Inf];
    X = fscanf(fileID,formatSpec,sizeA)';

    fileID = fopen('Y.txt','r');
    formatSpec = '%f';
    sizeA = [1, Inf];
    Y = fscanf(fileID,formatSpec,sizeA)';
    Y = round(Y) + 1;
end
