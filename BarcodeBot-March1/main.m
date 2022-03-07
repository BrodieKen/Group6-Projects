%% Barcode Generation
%Run this Code chuck to make jpg files for different numbers
clear;
clc;

%define resolution and noise of image
height = 1080;
width = 1920;
noise = 70;

%ask for users desired number
num = input("Enter Number: ");

generateBarcode(num, noise, height, width);

%% Barcode Reading
%Run this code chunk to decode data produced by the barcode scanner
clear;
clc;

%import data from csv file into a data array
data = readmatrix('11.csv');     %name of file saved from robot goes here
data(1:2) = []; %clear junk/labels from robotC datalog


value = readBarcode(data);

fprintf('The Barcode Value is %d \n', value);