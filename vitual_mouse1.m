%it is not a good virtual mouse program, it has some dis advantagees



clc
clear all
vid=videoinput('winvideo',1,'YUY2_640X480');
bin = zeros(480,640);
import java.awt.Robot;
import java.awt.event.*;
mouse = Robot;
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
x2 =0;
y2 = 0;
pause(4);
mouse.mouseMove(963,87);
mouse.mousePress(InputEvent.BUTTON1_MASK);
mouse.mouseRelease(InputEvent.BUTTON1_MASK);
pause(1);
mouse.mouseMove(1276,9);
mouse.mousePress(InputEvent.BUTTON1_MASK);
mouse.mouseRelease(InputEvent.BUTTON1_MASK);
pause(1);
%%
count=1;
count2=0;
mouse.mouseMove(666,744);    % select power point
mouse.mousePress(InputEvent.BUTTON1_MASK);
mouse.mouseRelease(InputEvent.BUTTON1_MASK);
pause(1);

mouse.mouseMove(1155,716);    % slide show
mouse.mousePress(InputEvent.BUTTON1_MASK);
mouse.mouseRelease(InputEvent.BUTTON1_MASK);
pause(.25);
% while(count<=150)
%%
    tmp = getsnapshot(vid);
    imshow(tmp);
    tmp = ycbcr2rgb(tmp);
    figure,imshow(tmp);
    dim = size(tmp);
    width =dim(2);
    height = dim(1);
    %%
for j=1:height
        for k =1:width
           if ((tmp(j,k,1)>=250) && (tmp(j,k,2)>=250) && (tmp(j,k,3)>=250))
                         bin(j,k) = 1;
            else
                          bin(j,k) = 0;
           end
                  
        end
end
figure,imshow(bin);
%%
bin=bwareaopen(bin,20);
se = strel('disk',2);
bin = imclose(bin,se);
bin = imfill(bin,'holes');
figure,imshow(bin);
%%
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

x1 = round(v-a2*2.134375);
y1 = round(b2*1.6);
mouse.mouseMove(x1,y1);
%%
% if(count>10)
%     
%     if abs(x5-x1)<30
%        if abs(y5-y1)<30 
%            
% %             mouse.mousePress(InputEvent.BUTTON3_MASK);   % right button
% %             mouse.mouseRelease(InputEvent.BUTTON3_MASK);
%             
%             
%             
% %             pause(.3);
%             mouse.mousePress(InputEvent.BUTTON1_MASK);   %left button
%             mouse.mouseRelease(InputEvent.BUTTON1_MASK);
%            
%        end
%     end
%     
% end
if(x2-x1)> 250                       % fast right motion.........
    beep;   
            mouse.mouseMove(316,746);
            mouse.mousePress(InputEvent.BUTTON1_MASK);
            mouse.mouseRelease(InputEvent.BUTTON1_MASK);
            
%             pause(.3);
%             mouse.mousePress(InputEvent.BUTTON1_MASK);
%             mouse.mouseRelease(InputEvent.BUTTON1_MASK);
end


if(x2-x1)< -250                       % fast left motion.........
    beep;
            mouse.mouseMove(216,748);
            mouse.mousePress(InputEvent.BUTTON3_MASK);
            mouse.mouseRelease(InputEvent.BUTTON3_MASK);
%             pause(.3);
%             mouse.mousePress(InputEvent.BUTTON1_MASK);
%             mouse.mouseRelease(InputEvent.BUTTON1_MASK);
end
end


%count=count+1;
pause(.1);
% end
stoppreview(vid);
delete(vid);
