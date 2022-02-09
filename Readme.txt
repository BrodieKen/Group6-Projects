MSE 110 Group 6
Line Tracking Robot
Brodie Milne
Prashant Kumar
Khail Alibhai

what can your robot do?
  In order to challenge ourselves, the team decided to line track using a PID loop instead of the simpler "jiggle" technique. We chose PID as it is a common algorithm found in
  engineering and none of us had ever used one before. Our Robot can effectively follow a line, tracking either the right or left edge while also picking up and delivering cargo 
  to a variety of destinations. THe robot Line tracks using a PID algorithm, taking error as the difference in color sensed off of the edge of black and white. To pick up cargo,
  the robot will drive in a straight line until it detects an object (crate) in front of it. It detects the object using a sonar sensor and lowers an arm to collect the cargo. The
  final destination for the cargo is to be placed in a red "end zone" where the same color sensor used during movment and PID waits until the color red is detected intiating a
  delivery sequence and ending the program. If the cargo needs to be delivered in any other zone, the user can define a distance using encoder values. The final thing the robot is 
  capable of doing is automatically determing the side of the line it should follow through a "calibration" mode. This calibration mode sweeps left and right growing its range of 
  view until it detects a black line that it can follow.
  
what can't your robot do?
  The Constants for the physical twin of the robot will need more fine tuning to eleiminate the large amount of jiggle currently seen.
  Dropping the box in the direct centre of the RED drop zone is not possible. However, it drops the box on the edge of the line perfectly

what have you observed as differences between the virtual and physical twin?
   The box Rolls in the virtual environment making moving it impossible/frusturating
   the virtual world is unrealistic and has no tolerance with sensors and motors
     this causes issues translating cutoff values in the virtual world to real world. specifically around the color sensor.
   PID control is "perfect" and never skews from the converged point after reaching it. real equivelent is very sensitive and contintues to jiggle without extensive fine tuning.

other comments you wish to forward to developers working on this project in the future, or users of your product.
  Before one uses this code base on there own EV3 lego mindstorms line tracking robot, they should do extensive testing to find adequet P I D constants. Without more intensive 
  testing, the robot will not acheive the smooth tracking characterized by  PID control. This may not be possible to create a perfectly smooth robot as the real motors used with 
  the lego mindstorms EV3 tend to have alot of backlash causing continuous error.
