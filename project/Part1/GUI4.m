function varargout = GUI4(varargin)
% GUI4 MATLAB code for GUI4.fig
%      GUI4, by itself, creates a new GUI4 or raises the existing
%      singleton*.
%
%      H = GUI4 returns the handle to a new GUI4 or the handle to
%      the existing singleton*.
%
%      GUI4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI4.M with the given input arguments.
%
%      GUI4('Property','Value',...) creates a new GUI4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI4

% Last Modified by GUIDE v2.5 09-May-2019 19:47:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI4_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI4_OutputFcn, ...
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


% --- Executes just before GUI4 is made visible.
function GUI4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI4 (see VARARGIN)

% Choose default command line output for GUI4
handles.output = hObject;
stepsbis = getappdata(0,'stepsbis');
stepsreg= getappdata(0,'stepsreg');
stepssec = getappdata(0,'stepssec');
stepsnew = getappdata(0,'stepsnew');
stepsfix = getappdata(0,'stepsfix');

errorbis = stepsbis(:,6);
errorreg = stepsreg(:,6);
errorsec = stepssec(:,7);
errornew = stepsnew(:,6);
errorfix = stepsfix(:,3);
errorbir = getappdata(0,'errorbir');

rootbis = stepsbis(:,4);
rootreg = stepsreg(:,4);
rootsec = stepssec(:,6);
rootnew = stepsnew(:,5);
rootfix = stepsfix(:,2);
rootbir= getappdata(0,'rootbir');
z = size(rootbir);
       iterbir =1:1:z;   
iterbis = stepsbis(:,1);
iterreg = stepsreg(:,1);
itersec = stepssec(:,1);
iternew = stepsnew(:,1);
iterfix = stepsfix(:,1);
plot(handles.axes1,iterbis,errorbis,'-o','Color','r','MarkerEdgeColor','r');
hold(handles.axes1,'on');
axis (handles.axes1,'manual');
plot(handles.axes1,iterreg,errorreg,'-s','Color','y','MarkerEdgeColor','y');
plot(handles.axes1,itersec,errorsec,'-*','Color','b','MarkerEdgeColor','b');
plot(handles.axes1,iternew,errornew,'-+','Color','g','MarkerEdgeColor','g');
plot(handles.axes1,iterfix,errorfix,'-x','Color','c','MarkerEdgeColor','c');
plot(handles.axes1,iterbir,errorbir,'-d','Color','m','MarkerEdgeColor','m');
axis (handles.axes1,'auto');
hold(handles.axes1,'off');

plot(handles.axes2,iterbis,rootbis,'-o','Color','r','MarkerEdgeColor','r');
hold(handles.axes2,'on');
axis (handles.axes2,'manual');
plot(handles.axes2,iterreg,rootreg,'-s','Color','y','MarkerEdgeColor','y');
plot(handles.axes2,itersec,rootsec,'-*','Color','b','MarkerEdgeColor','b');
plot(handles.axes2,iternew,rootnew,'-+','Color','g','MarkerEdgeColor','g');
plot(handles.axes2,iterfix,rootfix,'-x','Color','c','MarkerEdgeColor','c');
plot(handles.axes2,iterbir,rootbir,'-d','Color','m','MarkerEdgeColor','m');
axis (handles.axes2,'auto');
hold(handles.axes2,'off');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI4_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(handles.figure1);
Start


% --- Executes on button press in ZoomInbutton.
function ZoomInbutton_Callback(hObject, eventdata, handles)
% hObject    handle to ZoomInbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
zoom(handles.axes1, 'on');
zoom(handles.axes2, 'on');

% --- Executes on button press in ZoomOutbutton.
function ZoomOutbutton_Callback(hObject, eventdata, handles)
% hObject    handle to ZoomOutbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
zoom(handles.axes1, 'out');
zoom(handles.axes2, 'out');

% --- Executes on button press in panbutton.
function panbutton_Callback(hObject, eventdata, handles)
% hObject    handle to panbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pan(handles.axes1, 'on');
pan(handles.axes2, 'on');