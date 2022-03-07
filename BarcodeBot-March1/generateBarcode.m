function generateBarcode(intValue, noise, height, width)
%This function generates a plessey image for the given decimal number
% 0 = thin line thick white
% 1 =  thick line thin white

    %convert input number to plessey
    binValue = flip(dec2bin(intValue, 4));
    
    path = sprintf('%d.jpg', intValue); %gereate file

    A = zeros(height, width); %Create a Black Image
    
    noise = noise / 100;

    %define thick and thin line sizes from total image space
    x = 0;
    totalLineSpace = floor(width/length(binValue));
    thinLine = floor(totalLineSpace/4);
    thickLine = floor(totalLineSpace-thinLine);
    
    
    for i = 1:length(binValue) 
        if binValue(i) == '0'
            A(:,x+thinLine:x+totalLineSpace) = 1; %set thick white section
        elseif binValue(i) == '1'
            A(:,x+thickLine:x+totalLineSpace) = 1; %set thin white section
        end
        x = x+totalLineSpace;   %step to next bit area
    end

    A = A + noise*randn(height, width); %add noise to image
     
    imwrite(A, path);

end