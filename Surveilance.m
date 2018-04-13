
clc;
x=0;
while x==0
delete(instrfindall);

s=serial('COM6')
s.BaudRate = 9600
%s.Terminator = 

fopen(s)
%fprintf(s,'*IDN?')

out=fscanf(s)

pause(10.0)
if(out=='a')
    vid=videoinput('winvideo',1,'YUY2_320x240')
 
    preview(vid)
    
    pause(5.0)
    
end


pause(5.0)
clc;
if(out=='b')
    vid=videoinput('winvideo',1,'YUY2_320x240')
 
    preview(vid)
    
    pause(5.0)
    
    data=getsnapshot(vid)
    
    figure(1)
    
    detector=vision.CascadeObjectDetector;
    bbox=step(detector,data);
    out=insertObjectAnnotation(data,'rectangle',bbox,'detected');
    
    imshow(out)
    
    
    pause(15.0)
end




end