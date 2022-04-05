MSE 110 Group 6
Project Line Maze - Maze Solving Robot
Brodie Milne
Prashant Kumar
Khail Alibhai


**What can your robot do?**

Firstly, our robot is able to configure and store the maze in memory, and solve it internally by finding the shortest path, given start and end points.
It is able to display this process on the screen, displaying the maze walls and the path the "virtual" robot takes while solving the maze (it shows the status of calculation of the shortest path).
It also is able to display the current position of the physical robot within the maze as it takes this shortest path.
Also, it plays sounds, displays messages, and lights up different colors to indicate the status of the stages of the process outlined above. 

Additionally, our physical robot is able to successfully traverse the maze along its calculated shortest path. 
It does this using a combination of line tracking with the light sensor and encoder counts, along with a P loop controlling the smoothness of the line tracking.
Overall, the robot can successfully locate itself and maneuver through the maze on its designated path, being able to locate the proper intersections and make the necessary turns.
The physical robot is also aware of when the colors of the maze lines change, and is able to make the appropriate adjustments. 


**What can't your robot do?**

The robot is able to successfully complete all desired objectives.
We initially had a much more complex mechanism/algorithm for navigating the physical maze, that would have worked flawlessly in theory.
However, parts of this mechanism/algorithm relied on the gyro, and in the real world, this proved to accumulate significant error and rendered our logic useless.

At this point, a full overhaul of our robot was needed, both mechanically and software wise. 
Mechanically, this included removing the scanning light sensor, the gyro, and making other significant changes in order to rely more accurately on encoder counts.
Software wise, this overhaul included a full revision of the algorithm used to navigate the maze, utilizing a stationary light sensor and encoder counts to navigate the maze.

Overall, both of our designs would work flawlessly and completely in theory. 
However, in the real world, our first design had some setbacks. 
Our revised design performs much closer to the theoretical performance in the real world, and is quite successful in attaining its desired objectives. 

**Other comments you wish to forward to developers working on this project in the future, or users of your product.**

Overall, this robot is successful in all aspects, and is able to solve the maze in memory and accurately navigate itself through the physical maze using the calculated shortest path. 
Changes to the physical movement code would need to be made if the size of the maze or the colors of the lines changed.
Significant changes to the solving algorithm would also need to be made if the maze were to have closed loops, islands, or more than one unique shortest solution from a starting point to a target point.
Also, our robot is designed for line mazes only. If the maze were to be walled, significant changes will be necessary. 