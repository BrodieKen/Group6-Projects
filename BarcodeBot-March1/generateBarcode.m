function generateBarcode(intValue, noise, height, width)
    % 0 is narrow bar with large white
    % 1 is thick bar with thin white

    binValue = flip(dec2bin(intValue, 4));

    path = sprintf('%d.jpg', intValue);

    A = zeros(height, width); %Create a Black Image
    
    noise = noise / 100;

    x = 0;
    totalLineSpace = floor(width/length(binValue));
    thinLine = floor(totalLineSpace/4);
    thickLine = floor(totalLineSpace-thinLine);
    
    for i = 1:length(binValue)
        if binValue(i) == '0'
            A(:,x+thinLine:x+totalLineSpace) = 1; %White
        elseif binValue(i) == '1'
            A(:,x+thickLine:x+totalLineSpace) = 1; %White
        end
        x = x+totalLineSpace;
    end

    A = A + noise*randn(height, width);
    
    

    imwrite(A, path);

end