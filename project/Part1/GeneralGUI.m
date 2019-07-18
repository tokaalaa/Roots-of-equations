function varargout = GeneralGUI(varargin)
% GENERALGUI MATLAB code for GeneralGUI.fig
%      GENERALGUI, by itself, creates a new GENERALGUI or raises the existing
%      singleton*.
%
%      H = GENERALGUI returns the handle to a new GENERALGUI or the handle to
%      the existing singleton*.
%
%      GENERALGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GENERALGUI.M with the given input arguments.
%
%      GENERALGUI('Property','Value',...) creates a new GENERALGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GeneralGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GeneralGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GeneralGUI

% Last Modified by GUIDE v2.5 15-May-2019 01:23:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GeneralGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GeneralGUI_OutputFcn, ...
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


% --- Executes just before GeneralGUI is made visible.
function GeneralGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GeneralGUI (see VARARGIN)

% Choose default command line output for GeneralGUI
handles.output = hObject;
disp('enter')
e = getappdata(0, 'equation');
display(['equation' e]);
maxIter = getappdata(0, 'iteration');
eps = getappdata(0, 'percision');
syms x;
equ = str2func(e);
y = equ(x);
root = GeneralMethod(y,eps,maxIter);
set(handles.edit1,'String',root);
k = root-10:0.1:root+10;
       f = equ(k);
       z = 0*k;
       plot(handles.axes1,k,f,'r',k,z,'k',[root root],[-50 100],'y');
       Ax = findall(0,'type','axes'); 
       axis(Ax,[root-10 root+10 -50 50]);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GeneralGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GeneralGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Previous.
function Previous_Callback(hObject, eventdata, handles)
% hObject    handle to Previous (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(handles.figure1);
Start