function res = softmax(X)
    exps = exp(X - max(X));
    res = exps ./ sum(exps, 2);
end
