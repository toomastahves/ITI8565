function [x, y] = ex2_create_data()
    x = (1:150)';
    
    y1 = randi([0,20],10,1) / 10;
    y2 = randi([60,110],10,1) / 10;
    y3 = randi([120,150],10,1) / 10;
    y4 = randi([60,110],10,1) / 10;
    y5 = randi([0,20],10,1) / 10;
    
    y6 = randi([120,150],10,1) / 10;
    y7 = randi([170,210],10,1) / 10;
    y8 = randi([290,300],10,1) / 10;
    y9 = randi([170,210],10,1) / 10;
    y10 = randi([120,150],10,1) / 10;
    
    y11 = randi([0,20],10,1) / 10;
    y12 = randi([60,110],10,1) / 10;
    y13 = randi([120,150],10,1) / 10;
    y14 = randi([60,110],10,1) / 10;
    y15 = randi([0,20],10,1) / 10;
    
    y = [y1; y2; y3; y4; y5; y6; y7; y8; y9; y10; y11; y12; y13; y14; y15];
end
