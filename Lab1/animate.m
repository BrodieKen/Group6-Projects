function [] = animate(theta2, theta3,theta4)
r1 = 7;
r2 = 3;
r3 = 8;
r4 = 6;

oX = 0;
oY = 0;

aY = r2*sin(theta2);
aX = r2*cos(theta2);

bY = r3*sin(theta3)+aY;
bX = r3*cos(theta3)+aX;

cY = 0;
cX = r1;


plot([oX,aX],[oY,aY],'-');
plot([aX,bX],[aY,bY],'-');
plot([bX,cX],[bY,cY],'-');
axis([-3 8 -6.5 6.5])
drawnow;

end

