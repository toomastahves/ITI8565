function results = plot_distributions(data)
    figure('Name',  'Distributions');
    % Simple round function to create bins
    data = round(data);
    c = size(data, 2);
    results = zeros(c,1);
    % Calculate entropies
    for i = 1:c
        % Find unique values in each column
        values = unique(data(:,i));
        % Count unique values in each column and assign probabilities
        counts = cell2mat(arrayfun(@(x) length(find(data(:,i) == x)), values, 'Uniform', 0));
        probabilities = counts ./ size(data, 1);
        % Calculate entropies
        entropies = probabilities .* log2(probabilities) + (1 - probabilities) .* log2(1 - probabilities);
        e_sum = -sum(entropies);
        results(i,1) = e_sum;
        
        % Draw plot
        sgtitle('Distributions');
        subplot(1,c,i);
        bar(values, probabilities);
        title(strcat('Feature ', num2str(i)));
        xlabel('Unique values');
        ylabel('Probabilities');
        grid
    end
    disp('Entropy finished.');
end
