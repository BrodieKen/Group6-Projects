MSE 110 Group 6
Line Tracking Robot
Brodie Milne
Prashant Kumar
Khail Alibaih

what can your robot do?
  This robot can follow lines in two different methods. 
  method one follows the "jiggle" technique, where the robot turns towards the line until it sees it and then away until it doesnt and jiggles along the line. 
  This method was further optimized by having a third case where if the edge of the line is detected, then it drives straight at a higher speed
  Method 2 follows a PID control where it takes an error calculation from the line and adjusts both motor values at once proportional to its distance and direction from the line.
  This robot can detect a box and grab it using a sonar sensor. it will grab anything <3cm away from the robot
  Auto Calibration for which side of the line is being tracked. this functions on a sweeping motion, where each pass will grow its range 
  further until it finds the line, upon which it willbegint o follow the detected line
  Finally, it can also deliver the collected box in two ways.
  The first way uses RGB color values for detecting when a RED drop off location is found
  The second way uses a conversion from measured distance (in meters) to encoder values to drop the box at any point (split road)
  
what can't your robot do?
  PID control is very inconsistent in the real robot
  dropping the box in the direct centre of the RED drop zone is not possible

what have you observed as differences between the virtual and physical twin?
   The box Rolls in the virtual environment making moving it impossible/frusturating
   the virtual world is unrealistic and has no tolerance with sensors and motors
     this causes issues translating cutoff valuesin the virtual world to real world specifically around the color sensor
   PID control is "perfect" and never skews from the converged point after raeching it. real equivelent is very sensitive.

other comments you wish to forward to developers working on this project in the future, or users of your product.
  
