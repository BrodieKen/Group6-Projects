MSE 110 Group 6
Line Tracking Robot
Brodie Milne
Prashant Kumar
Khail Alibhai

What can your robot do?
  In order to challenge ourselves, the team decided to line track using a PID loop instead of the simpler "jiggle" technique. We chose PID as it is a common algorithm found in
  engineering and none of us had ever used one before. Our Robot can effectively follow a line, tracking either the right or left edge while also picking up and delivering cargo 
  to a variety of destinations. The robot Line tracks using a PID algorithm, taking error as the difference in color sensed off of the edge of black and white. To pick up cargo,
  the robot will drive in a straight line until it detects an object (crate) in front of it. It detects the object using a sonar sensor and lowers an arm to collect the cargo. The
  final destination for the cargo is to be placed in a red "end zone" where the same color sensor used during movement and PID waits until the color red is detected, then 
  initiates a delivery sequence and ends the program. If the cargo needs to be delivered in any other zone, the user can define a distance using encoder values. 
  The final thing the robot is capable of doing is automatically determing the side of the line it should follow through a "calibration" mode. This calibration mode 
  sweeps left and right growing its range of view until it detects a black line that it can follow.
  
What can't your robot do?
  The PID Constants for the physical twin of the robot will need more fine tuning to eliminate the residual amount of jiggle currently seen.
  Dropping the box in the direct centre of the RED drop zone sometimes does not occur. However, it will drop the box on the edge of the RED drop zone at the worst.

What have you observed as differences between the virtual and physical twin?
   - The box "rolls" in the virtual environment making moving it impossible/frustrating
   - The virtual world is unrealistic as it has no tolerances or "play" with sensors and motors
      - This causes issues when translating cutoff/identification values in the virtual world to the real world, specifically around the color sensor.
   - PID control in virtual worlds is "perfect", incredibly smooth, and never skews from the converged point after reaching it. 
     The real world equivalent is more sensitive and continues to jiggle throughout the run, without converging with extensive fine tuning. 

Other comments you wish to forward to developers working on this project in the future, or users of your product.
  Before one uses this code base on their own EV3 lego mindstorms line tracking robot, they should do extensive testing to find appropriate PID constants. Without more intensive 
  testing, the robot will not achieve the smoothest tracking characterized by PID control. It may not be possible to create a perfectly smooth robot as the real motors used with 
  the Lego Mindstorms EV3 tend to have a lot of backlash/tolerance, causing continuous error.
