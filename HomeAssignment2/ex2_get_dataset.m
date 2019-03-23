% Returns dataset
function [X, Y, predictor_names] = ex2_get_dataset(n)
    if n == 1
        % From lecture 5
        predictor_names = ["Outlook","Temperature","Humidity","Wind"];
        [X, Y] = dt_dataset1();
    end
    if n == 2
        % From https://medium.com/@rakendd/building-decision-trees-and-its-math-711862eea1c0
        predictor_names = ["Taste","Temperature","Texture"];
        [X, Y] = dt_dataset2();
    end
    if n == 3
        % From https://www.saedsayad.com/decision_tree.htm
        predictor_names = ["Outlook","Temp","Humidity","Windy"];
        [X, Y] = dt_dataset3();
    end
end

function [X, Y] = dt_dataset1()
    outlook = ["sunny","sunny","rain","rain","rain","sunny","sunny","sunny","rain","sunny","rain","sunny","rain"];
    temperature = ["warm","warm","warm","cool","cool","cool","warm","cool","warm","warm","warm","warm","warm"];
    humidity = ["high","high","high","normal","normal","normal","high","normal","normal","normal","high","normal","high"];
    wind = ["high","normal","high","high","normal","normal","high","high","high","normal","normal","high","normal"];
    labels = ["no","no","yes","yes","no","yes","no","yes","yes","yes","yes","yes","no"];
    X = [outlook; temperature; humidity; wind]';
    Y = labels';
end

function [X, Y] = dt_dataset2()
    taste = ["salty","spicy","spicy","spicy","spicy","sweet","salty","sweet","spicy","salty"];
    temperature = ["hot","hot","hot","cold","hot","cold","cold","hot","cold","hot"];
    texture = ["soft","soft","hard","hard","hard","soft","soft","soft","soft","hard"];
    labels = ["no","no","yes","no","yes","yes","no","yes","yes","yes"];
    X = [taste; temperature; texture]';
    Y = labels';
end

function [X, Y] = dt_dataset3()
    outlook = ["Rainy","Rainy","Overcast","Sunny","Sunny","Sunny","Overcast","Rainy","Rainy","Sunny","Rainy","Overcast","Overcast","Sunny"];
    temp = ["Hot","Hot","Hot","Mild","Cool","Cool","Cool","Mild","Cool","Mild","Mild","Mild","Hot","Mild"];
    humidity = ["High","High","High","High","Normal","Normal","Normal","High","Normal","Normal","Normal","High","Normal","High"];
    windy = ["False","True","False","False","False","True","True","False","False","False","True","True","False","True"];
    labels = ["No","No","Yes","Yes","Yes","No","Yes","No","Yes","Yes","Yes","Yes","Yes","No"];
    X = [outlook; temp; humidity; windy]';
    Y = labels';
end
