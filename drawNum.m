function [xPos] = drawNum(x,currentNum,thickLine,thinLine,totalLineSpace)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    y = [0,3,3,0];

    for j = 2:length(currentNum)    %go through each line type in the current number
        %draw the current number, update new xPos for next line
        if currentNum(j) == '0' 
            %if a 0, thin line drawn
            fill([x,x,x + thinLine,x + thinLine],y,'k')
            x = x + totalLineSpace;

        elseif  currentNum(j) == '1'    
            %if a 1, thick line drawn
            fill([x,x,x + thickLine,x + thickLine],y,'k')
            x = x + totalLineSpace;
        end
    end
    xPos = x;

end

