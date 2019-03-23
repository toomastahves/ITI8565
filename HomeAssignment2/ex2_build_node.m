% Build single node
function node = ex2_build_node(X, Y, column_names, name, parent_max_gain_idx)
    % Removing current column and name from arrays before calculating gain
    if parent_max_gain_idx ~= 0
        X(:, parent_max_gain_idx) = [];
        column_names(:, parent_max_gain_idx) = [];
    end
    % Step 1: Information gain of targets
    gain = ex2_information_gain(X, Y);
    % Step 2: Find max gain column
    [max_gain, max_gain_idx] = max(gain(:, 2));
    % Step 3: Build node
    node.value = name;
    node.children = {};
    % If gain is 0, then return result
    if max_gain == 0
        node.max_gain_column = "";
        node.result = unique(Y);
        node.max_gain = max_gain;
        node.max_gain_idx = 0;
    else
        node.max_gain_column = column_names(max_gain_idx);
        node.result = "";
        node.max_gain = max_gain;
        node.max_gain_idx = max_gain_idx;
    end
    node.X = X;
    node.Y = Y;
    node.column_names = column_names;
end
