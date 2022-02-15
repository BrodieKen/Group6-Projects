clc;
clear;

% define reference arrays for encoding the message plessey standard uses
% numbers only
barcodeLines = ["20000","21000","20100","21100","20010","21010","20110","21110","20001","21001","20101","21101","20011","21011","20111","21111"];

% receive message from user
msg = input("Secret Message(Hex Number): ","s") ;


%line width and spacing in units
thinLine = 1;   %represented as 0 in code
thickLine = 3*thinLine;  %represented as 1 in code
totalLineSpace = thinLine + thickLine; %total space allocated for a single part of a number



% seperate the message into indexed positons for each letter
%convert that number/letterr to its binary equivalent from lookup table
code = 1:length(msg);
for l = 1:length(msg)
    code(l) = string(barcodeLines(hex2dec(msg(l))+1));   
end


xPos = 0;

%% plot code
%plot vertical lines for barcode
for i = 1:length(code)  %for each number in the code
    currentNum = num2str(code(i));  % specify the current number
    hold on
    xPos = drawNum(xPos,currentNum,thickLine,thinLine,totalLineSpace);
end

print('barcode','-dpng') %save as an image


