% Plotting data and model
function [] = ex2_plot(error_history, X, Y, Y_hat)
    % Plotting data and model
    figure('Name',  'Plotting data and boosted model');
    scatter(X, Y);
    hold on
    plot(X, Y_hat);
    title('Plotting data and boosted model');
    xlabel('X');
    ylabel('Y');
    grid on;
    
    % Plotting error evolution
    figure('Name',  'Error evolution over epochs');
    plot(1:50, error_history);
    xlabel('Epochs');
    ylabel('Error');
    grid on;
end
