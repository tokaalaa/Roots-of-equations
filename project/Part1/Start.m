function varargout = Start(varargin)
% START MATLAB code for Start.fig
%      START, by itself, creates a new START or raises the existing
%      singleton*.
%
%      H = START returns the handle to a new START or the handle to
%      the existing singleton*.
%
%      START('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in START.M with the given input arguments.
%
%      START('Property','Value',...) creates a new START or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Start_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Start_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Start

% Last Modified by GUIDE v2.5 26-Apr-2019 13:11:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Start_OpeningFcn, ...
                   'gui_OutputFcn',  @Start_OutputFcn, ...
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


% --- Executes just before Start is made visible.
function Start_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Start (see VARARGIN)

% Choose default command line output for Start
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Start wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Start_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in readFromFile.
function readFromFile_Callback(hObject, eventdata, handles)
% hObject    handle to readFromFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,path] = uigetfile('*.txt');
if isequal(file,0)
   disp('User selected Cancel');
else
   [equ,root,steps,name,numofitr,type,E, R,gdash,elapsedtime] = readEquation(fullfile(path,file));
   %disp(['User selected ', fullfile(path,file)]);
   disp(steps)
   disp(size(steps))
   setappdata(0,'method',name);
   setappdata(0,'equation',equ);
   switch name
       case'bisection'
           setappdata(0,'elapsedtime',elapsedtime);
           setappdata(0,'steps',steps);
           setappdata(0,'root',root);
           setappdata(0,'maxiter',numofitr);
           delete(handles.figure1);
           GUI1;
        case'falsePosition'
           setappdata(0,'elapsedtime',elapsedtime);
           setappdata(0,'steps',steps);
           setappdata(0,'root',root);
           delete(handles.figure1);
           GUI1; 
       case'secant'
           setappdata(0,'elapsedtime',elapsedtime);
           setappdata(0,'steps',steps);
           setappdata(0,'root',root);
           setappdata(0,'type',type);
           delete(handles.figure1);
           GUI1; 
       case'newtonRaphson'
           setappdata(0,'elapsedtime',elapsedtime);
           setappdata(0,'steps',steps);
           setappdata(0,'root',root);
           setappdata(0,'type',type);
           delete(handles.figure1);
           GUI2; 
       case'fixedPoint'
           setappdata(0,'elapsedtime',elapsedtime);
           setappdata(0,'gdash',gdash);
           setappdata(0,'steps',steps);
           setappdata(0,'root',root);
           setappdata(0,'type',type);
           setappdata(0,'iter',numofitr);
           delete(handles.figure1);
           GUI2; 
       case 'biergeVieta'
           setappdata(0,'elapsedtime',elapsedtime);
           setappdata(0,'steps',steps);
           setappdata(0,'root',root);
           setappdata(0,'roots',R);
           setappdata(0,'error',E);
           setappdata(0,'type',type);
           delete(handles.figure1);
           GUI3; 
   end
   
end

% --- Executes on button press in enterEquation.
function enterEquation_Callback(hObject, eventdata, handles)
% hObject    handle to enterEquation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(handles.figure1);
EnterEquatain
