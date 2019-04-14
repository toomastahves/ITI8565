function res = softmax(M)
    expM = exp(M);
    res = expM ./ sum(expM, 2);
end
