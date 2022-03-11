
#define NORTH 0
#define EAST 1
#define SOUTH 2
#define WEST 3

void drawMazeBorders();
void turnRight();
void drawBot();
void refreshScreen();
void turnLeft();
void goFwd();

const int screenHeight = 127;
const int screenWidth = 177;


int robotOrientation = NORTH; // 0 =N, 1 = E, 2 = S, 3 = W
int robotRow = 0;	//bottom row
int robotCol = 0;	//bottom column
task main()
{

	drawMazeBorders();

//turnLeft();
//turnRight();
//drawBot();
drawBot();
goFwd();
drawBot();


}

void refreshScreen(){
	sleep(1000);
	eraseDisplay();
}

void turnRight(){
	robotOrientation++;
	if (robotOrientation ==4){
		robotOrientation = 0;
	}
}

void turnLeft(){
	robotOrientation--;
	if (robotOrientation ==-1){
		robotOrientation = 3;
	}
}

void drawMazeBorders(){
	//draw borders
	drawLine(0, 0, screenWidth, 0);
	drawLine(screenWidth, 0, screenWidth, screenHeight);
	drawLine(screenWidth, screenHeight, 0, screenHeight);
	drawLine(0, screenHeight, 0, 0);
}

void drawBot(){

	switch(robotOrientation){
		case 0: displayBigStringAt(screenHeight/2, screenWidth/2, "A"); break;
		case 1: displayBigStringAt(screenHeight/2, screenWidth/2, ">"); break;
		case 2: displayBigStringAt(screenHeight/2, screenWidth/2, "V"); break;
		case 3: displayBigStringAt(screenHeight/2, screenWidth/2, "<"); break;
		default: displayBigStringAt(screenHeight/2, screenWidth/2, "Orientation ERRORTEXT");
	}
	refreshScreen();
}

void goFwd(){
	switch(robotOrientation){
		case 0: robotRow++; break;
		case 1: robotCol++; break;
		case 2: robotRow--; break;
		case 3: robotCol--; break;
		default: displayBigStringAt(screenHeight/2, screenWidth/2, "Position ERRORTEXT");
	}
}
