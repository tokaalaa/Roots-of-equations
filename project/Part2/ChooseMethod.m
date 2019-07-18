function varargout = ChooseMethod(varargin)
% CHOOSEMETHOD MATLAB code for ChooseMethod.fig
%      CHOOSEMETHOD, by itself, creates a new CHOOSEMETHOD or raises the existing
%      singleton*.
%
%      H = CHOOSEMETHOD returns the handle to a new CHOOSEMETHOD or the handle to
%      the existing singleton*.
%
%      CHOOSEMETHOD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHOOSEMETHOD.M with the given input arguments.
%
%      CHOOSEMETHOD('Property','Value',...) creates a new CHOOSEMETHOD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ChooseMethod_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ChooseMethod_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ChooseMethod

% Last Modified by GUIDE v2.5 02-May-2019 22:40:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ChooseMethod_OpeningFcn, ...
                   'gui_OutputFcn',  @ChooseMethod_OutputFcn, ...
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


% --- Executes just before ChooseMethod is made visible.
function ChooseMethod_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ChooseMethod (see VARARGIN)

% Choose default command line output for ChooseMethod
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ChooseMethod wait for user response (see UIRESUME)
% uiwait(handles.method);


% --- Outputs from this function are returned to the command line.
function varargout = ChooseMethod_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on button press in gaussian.
function gaussian_Callback(hObject, eventdata, handles)
% hObject    handle to gaussian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(0,'method','gaussian');
Elimination
delete(handles.method);


% --- Executes on button press in lu.
function lu_Callback(hObject, eventdata, handles)
% hObject    handle to lu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(0,'method','lu');
LU_Decomposition
delete(handles.method);


% --- Executes on button press in jordan.
function jordan_Callback(hObject, eventdata, handles)
% hObject    handle to jordan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(0,'method','jordan');
Elimination
delete(handles.method);


% --- Executes on button press in gauss.
function gauss_Callback(hObject, eventdata, handles)
% hObject    handle to gauss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(0,'method','gauss');
Data
delete(handles.method);


% --- Executes on button press in all.
function all_Callback(hObject, eventdata, handles)
% hObject    handle to all (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(0,'method','all');
Data
All_Method
delete(handles.method);

