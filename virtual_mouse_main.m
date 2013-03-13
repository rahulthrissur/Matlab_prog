clc
clear all
vid=videoinput('winvideo',1,'YUY2_640X480');
%bin = zeros(480,640);

%.................
%# java code to interface local program with mouse couser


import java.awt.Robot;
import java.awt.event.*;
mouse = Robot;

%%%%    try it
%.....................

screenSize = get(0, 'screensize');
v = screenSize(3);
h = screenSize(4);
x1 = 384;y1 = 683;
x2 = 384;y2 = 683;
x3 = 384;y3 = 683;
x4 = 384;y4 = 683;
x5 = 384;y5 = 683;

x6 = 384;y6 = 683;
x7 = 384;y7 = 683;
x8 = 384;y8 = 683;
x9 = 384;y9 = 683;
x10 = 384;y10 = 683;

preview(vid);
%%
% x2 =0;
% y2 = 0;
pause(4);
mouse.mouseMove(963,87);                           %mouse move code
mouse.mousePress(InputEvent.BUTTON1_MASK);         %mouse click
mouse.mouseRelease(InputEvent.BUTTON1_MASK);
pause(1);
mouse.mouseMove(1276,9);
mouse.mousePress(InputEvent.BUTTON1_MASK);
mouse.mouseRelease(InputEvent.BUTTON1_MASK);
pause(1);
count=1;
% count2=0;
mouse.mouseMove(384,683);
while(count<=100)

    tmp = getsnapshot(vid);
    tmp = ycbcr2rgb(tmp);
%  .................................edited here.......................
for j=200:280
        for k =270:370
           if ((tmp(j,k,1)>=250) && (tmp(j,k,2)>=250) && (tmp(j,k,3)>=250))
                         bin(j-199,k-269) = 1;
            else
                          bin(j-199,k-269) = 0;
           end
                  
        end
end    

%................................................................................
bin=bwareaopen(bin,20);
se = strel('disk',2);
bin = imclose(bin,se);
bin = imfill(bin,'holes');
imshow(bin);
[B,L] = bwboundaries(bin,'noholes');          
stats = regionprops(L,'Area','Centroid');
if max(L(:))
n=1;
for k=2:max(L(:))
 if stats(k).Area>stats(n).Area               % get object with area maximum
    n=k;
 end
end


x10=x9;x9=x8;x8=x7;x7=x6;x6 = x5;
y10=y9;y9=y8;y8=y7;y7=y6;y6 = y5;

x5=x4;x4=x3;x3=x2;x2=x1;
y5=y4;y4=y3;y3=y2;y2=y1;


a2 = round(stats(n).Centroid(1));
b2 = round(stats(n).Centroid(2));
%%................. ................ edited here.....................
x1 = round(v-a2*13.5247);
y1 = round(b2*9.481);
mouse.mouseMove(x1,y1);
%%
if(count>10)
    
    if abs(x10-x1)<30
       if abs(y10-y1)<30 
           
%             mouse.mousePress(InputEvent.BUTTON3_MASK);   % right button
%             mouse.mouseRelease(InputEvent.BUTTON3_MASK);
            
            
            
%             pause(.3);
            mouse.mousePress(InputEvent.BUTTON1_MASK);   %left button
            mouse.mouseRelease(InputEvent.BUTTON1_MASK);
           
       end
    end
    
end
if(x2-x1)> 250                       % fast right motion.........
    beep;   
%             mouse.mouseMove(290,750);
%             mouse.mousePress(InputEvent.BUTTON3_MASK);
%             mouse.mouseRelease(InputEvent.BUTTON3_MASK);
%             pause(.3);
%             mouse.mousePress(InputEvent.BUTTON1_MASK);
%             mouse.mouseRelease(InputEvent.BUTTON1_MASK);
end


if(x2-x1)< -250                       % fast left motion.........
    beep;
    %             mouse.mouseMove(290,750);
%             mouse.mousePress(InputEvent.BUTTON3_MASK);
%             mouse.mouseRelease(InputEvent.BUTTON3_MASK);
%             pause(.3);
%             mouse.mousePress(InputEvent.BUTTON1_MASK);
%             mouse.mouseRelease(InputEvent.BUTTON1_MASK);
end
end


count=count+1;
pause(.1);
end
stoppreview(vid);
delete(vid);
