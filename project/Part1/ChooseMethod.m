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

% Last Modified by GUIDE v2.5 09-May-2019 16:33:39

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
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ChooseMethod_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in bisection.
function bisection_Callback(hObject, eventdata, handles)
% hObject    handle to bisection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(0,'method','bisection');
delete(handles.figure1);
RequiredData
% Hint: get(hObject,'Value') returns toggle state of bisection

% --- Executes on button press in newtonRaphson.
function newtonRaphson_Callback(hObject, eventdata, handles)
% hObject    handle to newtonRaphson (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(0,'method','newtonRaphson');
delete(handles.figure1);
RequiredData
% Hint: get(hObject,'Value') returns toggle state of newtonRaphson

% --- Executes on button press in falsePosition.
function falsePosition_Callback(hObject, eventdata, handles)
% hObject    handle to falsePosition (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(0,'method','falsePosition');
delete(handles.figure1);
RequiredData
% Hint: get(hObject,'Value') returns toggle state of falsePosition

% --- Executes on button press in secant.
function secant_Callback(hObject, eventdata, handles)
% hObject    handle to secant (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(0,'method','secant');
delete(handles.figure1);
RequiredData
% Hint: get(hObject,'Value') returns toggle state of secant

% --- Executes on button press in fixedPoint.
function fixedPoint_Callback(hObject, eventdata, handles)
% hObject    handle to fixedPoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(0,'method','fixedPoint');
delete(handles.figure1);
RequiredData
% Hint: get(hObject,'Value') returns toggle state of fixedPoint

% --- Executes on button press in biergeVieta.
function biergeVieta_Callback(hObject, eventdata, handles)
% hObject    handle to biergeVieta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(0,'method','biergeVieta');
delete(handles.figure1);
RequiredData
% Hint: get(hObject,'Value') returns toggle state of biergeVieta

% --- Executes on button press in generalAlgorithm.
function generalAlgorithm_Callback(hObject, eventdata, handles)
% hObject    handle to generalAlgorithm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(0,'method','generalAlgorithm');
delete(handles.figure1);
GeneralGUI
% Hint: get(hObject,'Value') returns toggle state of generalAlgorithm

% --- Executes on button press in selecteAll.
function selecteAll_Callback(hObject, eventdata, handles)
% hObject    handle to selecteAll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(0,'method','all');
delete(handles.figure1);
RequiredData
% Hint: get(hObject,'Value') returns toggle state of selecteAll


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(handles.figure1);
EnterEquatain
