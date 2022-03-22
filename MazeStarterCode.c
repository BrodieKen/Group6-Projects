
const int screenHeight = 127;
const int screenWidth  = 177;
const int numOfRows = 4;
const int numOfCols = 6;

int startRow = 3;
int startCol = 5;
int targetRow = 0;
int targetCol = 0;
int robHeading = 0; // 0=North, 1=East, 2=South, 3=West
int robRow = startRow;
int robCol = startCol;


typedef struct{
	int nWall;  // 0 = door, 1 = wall
	int eWall;
	int sWall;
	int wWall;
}cell;

cell maze[numOfRows][numOfCols];



void buildOuterBorders();
void gridDraw();
void drawBot();
void turnRight();
void turnLeft();
void goFwd();
void MazeSim();
void refreshScreen();
void solveMaze();

task main(){

	buildOuterBorders();
	MazeSim();
	refreshScreen();
	while(robRow!= targetRow || robCol != targetCol){
		solveMaze();
		refreshScreen();
		sleep(250);
	}
	refreshScreen();

}

void solveMaze(){
	// solve the maze using RWF method. for LWF swap left and right turns
	turnRight();
	bool moved = false;
	while(moved == false){
		switch (robHeading){
			case 0: if(maze[robRow][robCol].nWall == 0){goFwd();moved = true;}else {turnLeft();} break;
			case 1: if(maze[robRow][robCol].eWall == 0){goFwd();moved = true;}else {turnLeft();}break;
			case 2:	if(maze[robRow][robCol].sWall == 0){goFwd();moved = true;}else {turnLeft();}break;
			case 3:	if(maze[robRow][robCol].wWall == 0){goFwd();moved = true;}else {turnLeft();}break;
			default: break;
		}
	}
}



void MazeSim(){
	maze[0][0].eWall = maze[0][1].wWall = 1;
	maze[2][0].eWall = maze[2][1].wWall = 1;
	maze[3][0].eWall = maze[3][1].wWall = 1;

	maze[1][1].eWall = maze[1][2].wWall = 1;
	maze[3][1].eWall = maze[3][2].wWall = 1;

	maze[0][2].eWall = maze[0][3].wWall = 1;
	maze[1][3].eWall = maze[1][4].wWall = 1;

	maze[3][4].eWall = maze[3][5].wWall = 1;

	maze[0][1].nWall = maze[1][1].sWall = 1;
	maze[1][2].nWall = maze[2][2].sWall = 1;
	maze[2][2].nWall = maze[3][2].sWall = 1;
	maze[0][4].nWall = maze[1][4].sWall = 1;
	maze[1][4].nWall = maze[2][4].sWall = 1;
	maze[1][5].nWall = maze[2][5].sWall = 1;
}



void refreshScreen(){
	eraseDisplay();
	gridDraw();
	drawBot();
}


void goFwd(){

	//wait1Msec(1000);  // waste some time to simulate motion

	if (robHeading==0)	{   // Going Fwd North
		robRow++;
	}
	else if (robHeading==1)	{   // Going Fwd East
		robCol++;
	}
	else if (robHeading==2)	{   // Going Fwd South
		robRow--;
	}
	else if (robHeading==3)	{   // Going Fwd West
		robCol--;
	}
	else {
		robRow = 99;
		robCol = 99;
	}

}


void turnRight(){
	if (robHeading < 3){
		robHeading++;
	}
	else robHeading=0;
}


void turnLeft(){
	if (robHeading > 0){
		robHeading--;
	}
	else robHeading=3;
}



void buildOuterBorders(){
	for(int col=0; col<numOfCols; col++){
		maze[0][col].sWall = 1;
		maze[numOfRows-1][col].nWall = 1;
	}

	for(int row=0; row<numOfRows; row++){
		maze[row][0].wWall = 1;
		maze[row][numOfCols-1].eWall = 1;
	}
}



//=====================================================================
void gridDraw(){
	int XStart=0;
	int YStart=0;
	int XEnd  =0;
	int YEnd  =0;
	for(int i=0;i<numOfRows;i++){
		for(int j=0;j<numOfCols;j++){
			if(maze[i][j].nWall==1){
					XStart= j   *screenWidth/numOfCols;
					YStart=(i+1)*screenHeight/numOfRows;
					XEnd  =(j+1)*screenWidth/numOfCols;
					YEnd  =(i+1)*screenHeight/numOfRows;
					drawLine(XStart,YStart,XEnd,YEnd);
			}
			if (maze[i][j].eWall==1){
					XStart=(j+1)*screenWidth/numOfCols;
					YStart=(i)*screenHeight/numOfRows;
					XEnd  =(j+1)*screenWidth/numOfCols;
					YEnd  =(i+1)*screenHeight/numOfRows;
					drawLine(XStart,YStart,XEnd,YEnd);
			}
			if (maze[i][j].wWall==1){
					XStart= j   *screenWidth/numOfCols;
					YStart=(i)*screenHeight/numOfRows;
					XEnd  =(j)*screenWidth/numOfCols;
					YEnd  =(i+1)*screenHeight/numOfRows;
					drawLine(XStart,YStart,XEnd,YEnd);
			}
			if(maze[i][j].sWall==1){
				XStart= j   *screenWidth/numOfCols;
				YStart=(i)*screenHeight/numOfRows;
				XEnd  =(j+1)*screenWidth/numOfCols;
				YEnd  =(i)*screenHeight/numOfRows;
				drawLine(XStart,YStart,XEnd,YEnd);
			}
		}
	}
}

//=====================================================================
void drawBot(){
	int RobotXpixelPos=0;
	int RobotYpixelPos=0;

	if(robCol==0){
			RobotXpixelPos=screenWidth/12;
	}
	else{
		RobotXpixelPos=(2*robCol+1)*screenWidth/12;
	}

	if(robRow==0){
			RobotYpixelPos=screenHeight/8;
	}
	else{
		RobotYpixelPos=(2*robRow+1)*screenHeight/8;
	}

	switch(robHeading){
			case 0: displayStringAt(RobotXpixelPos,RobotYpixelPos,"^");	break; // Facing North
			case 1: displayStringAt(RobotXpixelPos,RobotYpixelPos,">"); break; // Facing East
			case 2: displayStringAt(RobotXpixelPos,RobotYpixelPos,"V"); break; // Facing South
			case 3: displayStringAt(RobotXpixelPos,RobotYpixelPos,"<"); break; // Facing West
			default: break;
	}
}
