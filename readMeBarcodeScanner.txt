MSE 110 Group 6
Line Tracking Robot
Brodie Milne
Prashant Kumar
Khail Alibhai


what can your robot do?

Firstly, our barcode generator is able to produce barcodes of any value, with no limitation (any size integer can be inputted and the program will be able to generate the associated barcode). 
Our robot is able to successfully scan and store barcode values as binary bits and convert to decimal numbers. 
Our robot is able to do this by successfully differentiating between black and white in the barcode, and as it goes across the barcode, it can measure the lengths of each bar.
It stores the data of the length of each bar in a vector. 
Using this length data, it is able to mathematically categorize which bars are long and short, corresponding to a 1 or 0 in binary. 
It then stores this binary data as another vector.
This binary vector can then be exported to matlab to be converted to decimal numbers.
The robot is also able to do this internally, and display the correct decimal number on the screen. 

what can't your robot do?

The robot is able to successfully complete all desired objectives, as well as onboard integer calculation and displaying the result on the robot immediately after scanning the barcode.
One thing we did not do, was change the design of the mechanical robot itself, or change gear ratios, as we deemed this unnecessary for the purpose, and the previous robot's design was sufficient to accomplish the task.
Given this, we did change the attachment arm for the color sensor, in order to orient the sensor perpendicular to the driving direction, so that the light sensor is able to pick up thin bars in the barcode. 

what have you observed as differences between the virtual and physical twin?



other comments you wish to forward to developers working on this project in the future, or users of your product.