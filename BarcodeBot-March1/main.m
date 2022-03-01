clear;
clc;

%% Barcode Generation
height = 1080;
width = 1920;
noise = 40;

num = input("Enter Number: ");

generateBarcode(num, noise, height, width);

%% Barcode Reading

%Insert Code for reading csv
demo = [3,1,3,1,3,1,3]; % 1111 = 15

for i = 1:length(demo)
    demo(i) = demo(i) + rand(1);
    demo(i) = demo(i)*200;
end

value = readBarcode(demo)