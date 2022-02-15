%% create a specificed size image
% 0 is narrow bar with large white
% 1 is thick bar with thin white

height = 1080;
width = 1920;
clarity = 0;

A = rand(height, width); %create a random image of specificed size (matrix)
num = flip(dec2bin(input("Enter Number: "),4));
x = 1;
totalLineSpace = width/4;
thinLine = totalLineSpace/4;
thickLine = totalLineSpace-thinLine;


for i = 1:length(num)
    if num(i) == '0'
        A(:,x:x+thinLine) = (clarity)*rand;
        A(:,x+thinLine:x+totalLineSpace) = 1;
        x = x+totalLineSpace;
    elseif num(i) == '1'
        A(:,x:x+thickLine) = (clarity)*rand;
        A(:,x+thickLine:x+totalLineSpace) = 1;
        x = x+totalLineSpace;
    end
    
end

A(1:10,:) = clarity;
A(height-10:height,:) = clarity;
A(:,1:10) = clarity;
A(:,width-20:width) = clarity;

imwrite(A,'code.jpg')
