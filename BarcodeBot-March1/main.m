%% Barcode Generation

clear;
clc;

height = 1080;
width = 1920;
noise = 70;

num = input("Enter Number: ");

generateBarcode(num, noise, height, width);

%% Barcode Reading

clear;
clc;

data = readmatrix('6.csv');
data(1:2) = [];

value = readBarcode(data);

fprintf('The Barcode Value is %d \n', value);