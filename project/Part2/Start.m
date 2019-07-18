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

% Last Modified by GUIDE v2.5 02-May-2019 08:37:20

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
% uiwait(handles.start);


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
delete(handles.start);
[file,path] = uigetfile('*.txt');
if isequal(file,0)
   disp('User selected Cancel');
   setappdata(0,'file', 0);
else
   disp(['User selected ', fullfile(path,file)]);
   [flag] = check(fullfile(path,file));
   if ~flag
   tic;
   [X,StepsA,StepsB,StepsLU,B,D,name,n] = readLinearEquations(fullfile(path,file));
   toc;
   elapsedtime = toc;
   setappdata(0,'elapsedtime',elapsedtime);
   setappdata(0,'file', 1);
   setappdata(0,'numOfEq',n);
   setappdata(0,'X',X);
   setappdata(0,'StepsA',StepsA);
   setappdata(0,'StepsB',StepsB);
   setappdata(0,'StepsLU',StepsLU);
   setappdata(0,'B',B);
   setappdata(0,'D',D);
   switch(name)
       case 'Gaussian-elimination'
           setappdata(0,'method','gaussian');
           Elimination
       case 'LU decomposition'
           LU_Decomposition
       case 'Gaussian-Jordan'
           setappdata(0,'method','Jordan');
           Elimination
       case 'Gauss-Seidel'
           Seidel
       case 'All'
           All_Method
   end
   else
       Inconsistent
   end
   
end

% --- Executes on button press in enterEquations.
function enterEquations_Callback(hObject, eventdata, handles)
% hObject    handle to enterEquations (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(handles.start);
setappdata(0,'file', 0);
EnterEquations2
