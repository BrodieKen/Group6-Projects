clc;
clear;

% define reference arrays for encoding the message plessey standard uses
% numbers only
barcodeLines = ["0000","1000","0100","1100","0010","1010","0110","1110","0001","1001","0101","1101","0011","1011","0111","1111"];

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


%first code spot

for i = 1:length(code)
    for j = 1:length(code(i))
        currentNum = code(i);
        
%         plot(x,y,'Linewidth',thinLine)
%            drawnow
%             x = x + totalLineSpace;


        if currentNum(j) == 0
            hold on
            plot(x,y,'Linewidth',thinLine)
            drawnow
            x = x + totalLineSpace;
        elseif  currentNum(j) == 1
            hold on
            plot(x,y,'Linewidth',thickLine)
            drawnow
            x = x + totalLineSpace;
        end


    end
end
