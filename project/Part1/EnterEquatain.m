function varargout = EnterEquatain(varargin)
% ENTEREQUATAIN MATLAB code for EnterEquatain.fig
%      ENTEREQUATAIN, by itself, creates a new ENTEREQUATAIN or raises the existing
%      singleton*.
%
%      H = ENTEREQUATAIN returns the handle to a new ENTEREQUATAIN or the handle to
%      the existing singleton*.
%
%      ENTEREQUATAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ENTEREQUATAIN.M with the given input arguments.
%
%      ENTEREQUATAIN('Property','Value',...) creates a new ENTEREQUATAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EnterEquatain_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EnterEquatain_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EnterEquatain

% Last Modified by GUIDE v2.5 11-May-2019 21:39:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EnterEquatain_OpeningFcn, ...
                   'gui_OutputFcn',  @EnterEquatain_OutputFcn, ...
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


% --- Executes just before EnterEquatain is made visible.
function EnterEquatain_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EnterEquatain (see VARARGIN)

% Choose default command line output for EnterEquatain
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EnterEquatain wait for user response (see UIRESUME)
% uiwait(handles.data);


% --- Outputs from this function are returned to the command line.
function varargout = EnterEquatain_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function enteredEquation_Callback(hObject, eventdata, handles)
% hObject    handle to enteredEquation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of enteredEquation as text


% --- Executes during object creation, after setting all properties.
function enteredEquation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to enteredEquation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function numberOfIteration_Callback(hObject, eventdata, handles)
% hObject    handle to numberOfIteration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numberOfIteration as text



% --- Executes during object creation, after setting all properties.
function numberOfIteration_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numberOfIteration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function percision_Callback(hObject, eventdata, handles)
% hObject    handle to percision (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of percision as text


% --- Executes during object creation, after setting all properties.
function percision_CreateFcn(hObject, eventdata, handles)
% hObject    handle to percision (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in next.
function next_Callback(hObject, eventdata, handles)
% hObject    handle to next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
p = get(handles.percision,'String');
if isempty(p)
     p = 0.00001; 
   setappdata(0, 'percision',0.00001);
else
    setappdata(0,'percision',str2double(p));
end

i = get(handles.numberOfIteration,'String');
if isempty(i)
   i = 50; 
   setappdata(0, 'iteration',50);
else
   setappdata(0,'iteration',str2double(i));
end
eq = get(handles.enteredEquation,'String');
eq = strcat('@(x)',eq);
equation = expstring(eq);
setappdata(0,'equation',equation);
delete(handles.data);
ChooseMethod


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(handles.data);
Start
