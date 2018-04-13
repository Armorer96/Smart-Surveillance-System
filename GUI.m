function varargout = mini_project(varargin)
% MINI_PROJECT MATLAB code for mini_project.fig
%      MINI_PROJECT, by itself, creates a new MINI_PROJECT or raises the existing
%      singleton*.
%
%      H = MINI_PROJECT returns the handle to a new MINI_PROJECT or the handle to
%      the existing singleton*.
%
%      MINI_PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MINI_PROJECT.M with the given input arguments.
%
%      MINI_PROJECT('Property','Value',...) creates a new MINI_PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mini_project_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mini_project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mini_project

% Last Modified by GUIDE v2.5 24-Mar-2017 03:26:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mini_project_OpeningFcn, ...
                   'gui_OutputFcn',  @mini_project_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT






% --- Executes just before mini_project is made visible.
function mini_project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mini_project (see VARARGIN)

% Choose default command line output for mini_project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mini_project wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mini_project_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in import.
function import_Callback(hObject, eventdata, handles)
% hObject    handle to import (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1)
x=imread('new.png');
imshow(x);


% --- Executes on button press in gray.
function gray_Callback(hObject, eventdata, handles)
% hObject    handle to gray (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1)
x=imread('new.png');
y=rgb2gray(x);
imshow(y);

% Hint: get(hObject,'Value') returns toggle state of gray


% --- Executes on button press in Trigger.
function Trigger_Callback(hObject, eventdata, handles)
% hObject    handle to Trigger (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data dt
vid =videoinput('winvideo',1,'YUY2_320x240')  
vid.framespertrigger=1;
preview(vid); 
start(vid);
data=getsnapshot(vid)
imshow(data)
imwrite(data,'new.png')
c=imread('new.png')

% --- Executes on button press in BNW.
function BNW_Callback(hObject, eventdata, handles)
% hObject    handle to BNW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1)
x=imread('new.png');
imshow(im2bw(x)); 


% --- Executes on button press in Zoom.
function Zoom_Callback(hObject, eventdata, handles)
% hObject    handle to Zoom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=imread('new.png');
z=imresize(x,2);
figure,imshow(z);
figure,imread(z),colormap(gray);


% --- Executes on button press in Reset.
function Reset_Callback(hObject, eventdata, handles)
% hObject    handle to Reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=imread('new.png');
imshow(x);


% --- Executes on button press in Exit.((
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('THANKS FOR USING SMART SURVEILLANCE MODULE');
pause(10)
close();
close();


% --- Executes on button press in Histogram.
function Histogram_Callback(hObject, eventdata, handles)
% hObject    handle to Histogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=imread('new.png');
y=rgb2gray(x);
axes(handles.axes2)
imhist(y);


% --- Executes on button press in Distance.
function Distance_Callback(hObject, eventdata, handles)
% hObject    handle to Distance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
l=imdistline();
msgbox('Measured in pixels')
dist=getDistance(l) 


% --- Executes on button press in Red.
function Red_Callback(hObject, eventdata, handles)
% hObject    handle to Red (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=imread('new.png');
red=x;
red(:,:,2:3)=0;
axes(handles.axes1);
imshow(red);



% --- Executes on button press in Blue.
function Blue_Callback(hObject, eventdata, handles)
% hObject    handle to Blue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=imread('new.png');
blue=x;
blue(:,:,1)=0;
blue(:,:,2)=0;
axes(handles.axes1);
imshow(blue);



% --- Executes on button press in Green.
function Green_Callback(hObject, eventdata, handles)
% hObject    handle to Green (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=imread('new.png');
green=x; 
green(:,:,3)=0;
axes(handles.axes1);
imshow(green);


% --- Executes on button press in anticlk.
function anticlk_Callback(hObject, eventdata, handles)
% hObject    handle to anticlk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=imread('new.png');
I = mat2gray(I);
J = imrotate(I,90,'bilinear','crop');
axes(handles.axes1);
imshow(I) 
title('Original Image')
axes(handles.axes2);
imshow(J)
title('Rotated Image')


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=imread('new.png');
I = mat2gray(I);
J = imrotate(I,-90,'bilinear','crop');
axes(handles.axes1);
imshow(I) 
title('Original Image')
axes(handles.axes2);
imshow(J)
title('Rotated Image')


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=imread('new.png');
I = mat2gray(I);
J = imrotate(I,180,'bilinear','crop');
axes(handles.axes1);
imshow(I) 
title('Original Image')
axes(handles.axes2);
imshow(J)
title('Rotated Image')


% --- Executes on button press in Horizontal.
function Horizontal_Callback(hObject, eventdata, handles)
% hObject    handle to Horizontal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=imread('new.png');
I2=flip(I,2);
axes(handles.axes2);
imshow(I2);


% --- Executes on button press in vertical.
function vertical_Callback(hObject, eventdata, handles)
% hObject    handle to vertical (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=imread('new.png');
I2=flip(I,1);
axes(handles.axes2);
imshow(I2);



% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=imread('new.png');
I2=flip(I,2);
I3=flip(I,1);
I4=flip(I3,2);
axes(handles.axes2);
imshow(I4);

% --- Executes on button press in complement.
function complement_Callback(hObject, eventdata, handles)
% hObject    handle to complement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=imread('new.png');
I2=imcomplement(I);
axes(handles.axes2);
imshow(I2); 




% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=imread('new.png');
I=rgb2gray(I);
BW2=edge(I,'canny');
axes(handles.axes2);
imshow(BW2);


% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=imread('new.png');
I=rgb2gray(I);
BW2=edge(I,'sobel');
axes(handles.axes2);
imshow(BW2);
