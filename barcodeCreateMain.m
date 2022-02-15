clc;
clear;

% define reference arrays for encoding the message plessey standard uses
% numbers only
barcodeLines = ["20000","21000","20100","21100","20010","21010","20110","21110","20001","21001","20101","21101","20011","21011","20111","21111"];

% receive message from user
msg = input("Secret Message(numbers only): ","s") ;


%line width and spacing in units
thinLine = 1;   %represented as 0 in code
thickLine = 3*thinLine;  %represented as 1 in code
totalLineSpace = thinLine+thickLine; %total space allocated for a single part of a number



% seperate the message into indexed positons for each letter
code = 1:length(msg);
for l = 1:length(msg)
    code(l) = string(barcodeLines(str2double(msg(l))+1));   
end

y = [0,3];
x = [0,0];


%plot vertical lines for barcode
for i = 1:length(code)
    currentNum = num2str(code(i));
    for j = 2:length(currentNum)

        if currentNum(j) == '0'
%             plot([0,2],[2,3])
            hold on
            plot(x,y,'black','Linewidth',thinLine)
            drawnow
            x = x + totalLineSpace;
        elseif  currentNum(j) == '1'
%             plot([2,3],[0,2])
            hold on
            plot(x,y,'black','Linewidth',thickLine)
            drawnow
            x = x + totalLineSpace;
        end


    end
end
