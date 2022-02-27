function x = readBarcode(encoderData)
    
    %Calculate Threshold Value by averaging the mean encoder value of each bit
    %except for the LSB.
    threshold = 0;
    for i = 1:2:(length(encoderData) - 1)
        threshold = threshold + (encoderData(i) +encoderData(i+1))/2;
    end
    threshold = threshold/((length(encoderData) - 1)/2);
    
    %Translate data to Binary Number by comparing first encoder value of
    %bit to the threshold.
    binValue = "";
    for i = 1:2:(length(encoderData) - 1)
        if encoderData(i) > threshold
            binValue = binValue + "1";
        else
            binValue = binValue + "0";
        end
    end

    %Check LSB
    if encoderData(end) > threshold
        binValue = binValue + "1";
    else
        binValue = binValue + "0";
    end

    %Convert binary value to decimal.
    x = bin2dec(flip(binValue));
end