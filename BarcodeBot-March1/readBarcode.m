function x = readBarcode(encoderData)
    
    %Calculate Threshold Value by averaging the mean encoder value of each
    %bit pair except for the LSB.
    threshold = 0;
    for i = 1:2:(length(encoderData) - 1)
        threshold = threshold + (encoderData(i) +encoderData(i+1))/2;
    end
    threshold = threshold/((length(encoderData) - 1)/2);
    
    %Translate data to Binary Number by comparing first encoder value of
    %bit to the threshold.
    binValue = [];
    j = 1;
    for i = 1:2:(length(encoderData) - 1)
        if encoderData(i) > threshold
            binValue(j) = 1;
        else
            binValue(j) = 0;
        end
        j = j+1;
    end

    %Check LSB
    if encoderData(end) > threshold
        binValue(j) = 1;
    else
        binValue(j) = 0;
    end
    
    binValue = flip(binValue);

    %Convert binary value to decimal.
    x = uint8(bin2dec(sprintf('%d',binValue)));
end