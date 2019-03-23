% Ugly solution, non-recursive tree, max 4 levels
function node1 = ex2_decision_tree(X, Y, column_names)
    % Define root node
    node1 = ex2_build_node(X, Y, column_names, "root", 0);

    % First level
    % Step 1: Check if it is ending node.
    if node1.result ~= ""
        disp('No significant gain. Stop here.');
    end
    % If not ending node, then step 2
    % Step 2: Get max gain column values and indexes
    [values1, indexes1] = ex2_get_max_gain_column_targets(node1.X, node1.max_gain_idx);
    % Step 3: Build level 1 children nodes
    for i=1:size(indexes1, 1)
        idx = cell2mat(indexes1(i));
        name1 = values1(i);
        subX1 = node1.X(idx, :);
        subY1 = node1.Y(idx, :);
        node2 = ex2_build_node(subX1, subY1, node1.column_names, name1, node1.max_gain_idx);

        % Second level
        % Step 1: Check if it is ending node.
        if node2.result ~= ""
            node2_array(i) = node2;
            continue;
        end
        % If not ending node, then step 2
        % Step 2: Get max gain column values and indexes
        [values2, indexes2] = ex2_get_max_gain_column_targets(node2.X, node2.max_gain_idx);
        % Step 3: Build level 2 children nodes
        for k=1:size(indexes2, 1)
            idx2 = cell2mat(indexes2(k));
            name2 = values2(k);
            subX2 = node2.X(idx2, :);
            subY2 = node2.Y(idx2, :);
            node3 = ex2_build_node(subX2, subY2, node2.column_names, name2, node2.max_gain_idx);

            % Third level
            % Step 2: Check if it is ending node.
            if node3.result ~= ""
                node3_array(k) = node3;
                continue;
            end

            % If not ending node, then step 2
            % Step 2: Get max gain column values and indexes
            [values3, indexes3] = ex2_get_max_gain_column_targets(node3.X, node3.max_gain_idx);
            % Step 3: Build level 2 children nodes
            for m=1:size(indexes3, 1)
                idx3 = cell2mat(indexes3(m));
                name3 = values2(k);
                subX3 = node3.X(idx3, :);
                subY3 = node3.Y(idx3, :);
                node4 = ex2_build_node(subX3, subY3, node3.column_names, name3, node3.max_gain_idx);

                % Fourth level
                % Step 1: Check if it is ending node.
                if node4.result ~= ""
                    node4_array(k) = node4;
                    continue;
                end
                % If not ending node, then step 2
                % Step 2: Not implemented

                % Step 4: Return 4th level children
                node4_array(k) = node4;

            end
            % Step 4: Return 3rd level children
            node3.children = node4_array;
            node3_array(k) = node3;
        end
        % Step 4: Return 2nd level children
        node2.children = node3_array;
        node2_array(i) = node2;
    end
    % Step 4: Return 1st level children
    node1.children = node2_array;
end

% Over max gain column, group unique target values and find indexes
function [values, indexes] = ex2_get_max_gain_column_targets(X, max_gain_idx)
    values = unique(X(:, max_gain_idx));
    indexes = arrayfun(@(x) find(X(:, max_gain_idx) == x), values, 'un', 0);
end
