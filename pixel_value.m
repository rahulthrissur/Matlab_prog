%  This program is used to find the pixel information from snapshot image
% imtool fuction give information about the RGB values of the picture
% it also gave the information about pixel X,Y cordinates




vid=videoinput('winvideo',1,'YUY2_640X480');
%vid=videoinput('winvideo',2);
preview(vid);
pause(5);
i = getsnapshot(vid);
i =ycbcr2rgb(i);
imtool(i);
%imshow(i);
stoppreview(vid);
%imwrite(i,'shirt2.jpg');
 
