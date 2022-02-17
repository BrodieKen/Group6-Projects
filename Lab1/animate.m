function [] = animate(theta2, theta3,theta4)
%this function returns nothing but takes in three angeles
%it will calucalte the points on a carteisan plane for each vertex
%of the four-bar mechanism

%define lengths of bars
r1 = 7;
r2 = 3;
r3 = 8;
r4 = 6;

%define origin point
oX = 0;
oY = 0;

%solve for first vertex point A
aY = r2*sin(theta2);
aX = r2*cos(theta2);

%solve for second vertex point B
bY = r3*sin(theta3)+aY;
bX = r3*cos(theta3)+aX;

%define last vertex point C
cY = oY;
cX = r1;


%plot vectors between each point and draw it
plot([oX,aX],[oY,aY],'-');
plot([aX,bX],[aY,bY],'-');
plot([bX,cX],[bY,cY],'-');
axis([-3 8 -6.5 6.5])
drawnow;

end

