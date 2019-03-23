% Information gain between target and features
function gain = ex2_information_gain(X, Y)
    entropy_target = entropy_one_attribute(Y);
    gain = zeros(size(X,2), 2);
    for i=1:size(X,2)
        entropy_features = entropy_two_attributes(X(:,i), Y);
        gain(i,:) = [i, entropy_target - entropy_features];
    end
end

% One attribute entropy
function entropy = entropy_one_attribute(Y)
    % Count each unique Y value
    counts = arrayfun(@(x) length(Y(Y == x)), unique(Y));
    % Probability of each Y value
    P = counts ./ size(Y, 1);
    % Entropy formula
    entropy = sum(-P .* log2(P));
end

% Two attribute entropy
function entropy = entropy_two_attributes(X, Y)
    % Indexes grouped by unique X values
    indexes = arrayfun(@(x) find(X == x), unique(X), 'un', 0);
    % Probabilities of each unique X value groups
    P_X = arrayfun(@(x) length(Y(cell2mat(x))) / length(cell2mat(indexes)), indexes);
    % Entropies of each group of Y value
    Y_entropy = cell2mat(arrayfun(@(y) entropy_one_attribute(Y(cell2mat(y))), indexes, 'un', 0));
    % Entropy of two attributes formula
    entropy = sum(P_X .* Y_entropy);
end
