function x = readBarcode(encoderData)
%This Function takes csv data produced by the robotC datalog and solves the
%binary value presented through threshold comparison
%1 = thick line
%0 = thin line

    %Calculate Threshold Value by averaging the mean encoder value of each
    %bit pair except for the LSB.
    threshold = 0;
    for i = 1:2:(length(encoderData) - 1)
        threshold = threshold + (encoderData(i) +encoderData(i+1))/2;
    end
    threshold = threshold/((length(encoderData) - 1)/2); %Save final threshold value
    
    %Translate data to Binary Number by comparing first encoder value of
    %bit to the threshold.
    binValue = [];
    j = 1;
    for i = 1:2:(length(encoderData))
        if encoderData(i) > threshold   
            binValue(j) = 1;    %encoder length is thick
        else
            binValue(j) = 0;    %encoder length is thin
        end
        j = j+1;
    end
   
    binValue = flip(binValue);  %flip to binary

    %Convert binary value to decimal.
    x = uint8(bin2dec(sprintf('%d',binValue)));
end