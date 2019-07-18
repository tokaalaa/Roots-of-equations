function varargout = Elimination(varargin)
% ELIMINATION MATLAB code for Elimination.fig
%      ELIMINATION, by itself, creates a new ELIMINATION or raises the existing
%      singleton*.
%
%      H = ELIMINATION returns the handle to a new ELIMINATION or the handle to
%      the existing singleton*.
%
%      ELIMINATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ELIMINATION.M with the given input arguments.
%
%      ELIMINATION('Property','Value',...) creates a new ELIMINATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Elimination_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Elimination_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Elimination

% Last Modified by GUIDE v2.5 07-May-2019 11:29:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Elimination_OpeningFcn, ...
                   'gui_OutputFcn',  @Elimination_OutputFcn, ...
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


% --- Executes just before Elimination is made visible.
function Elimination_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Elimination (see VARARGIN)

% Choose default command line output for Elimination
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Elimination wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Elimination_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
flage = getappdata(0,'file');
n = getappdata(0,'numOfEq');
method  = getappdata(0,'method');
if strcmp(method, 'gaussian')
if flage ~= 1
equations = getappdata(0,'equations');
tic;
[X,StepsA,StepsB] = SolveLinearEquations(n,equations,'Gaussian-elimination','5','5','5');
toc;
elapsedtime = toc;
setappdata(0,'elapsedtime',elapsedtime);
else
   X = getappdata(0,'X');
   StepsA = getappdata(0,'StepsA');
   StepsB = getappdata(0,'StepsB');
end
cx = X(:,:).';
x = num2str(double(cx));
set(handles.matrixX,'Max', n,'String', x);
a = num2str(double(StepsA(:,:,1)));
set(handles.matrixA,'Max', n,'String', a);
b = num2str(double(StepsB(:,:,1)));
set(handles.matrixB,'Max', n,'String', b);
set(handles.nuStep,'String', num2str(1));
setappdata(0,'i', 2);
time = getappdata(0,'elapsedtime');
set(handles.time,'String', num2str(time));
else
if flage ~= 1
equations = getappdata(0,'equations');
[X,StepsA,StepsB,StepsLU,B,D] = SolveLinearEquations(n,equations,'Gaussian-Jordan','5','5','5');
else
X = getappdata(0,'X');
B = getappdata(0,'B');
StepsB = getappdata(0,'StepsB');
end
setappdata(0,'elapsedtime',X);
cx = B(:,:).';
x = num2str(double(cx));
set(handles.matrixX,'Max', n,'String', x);
a = num2str(double(StepsB(:,1:n,1)));
set(handles.matrixA,'Max', n,'String', a);
b = num2str(double(StepsB(:,n+1,1)));
set(handles.matrixB,'Max', n,'String', b);
set(handles.nuStep,'String', num2str(1));
setappdata(0,'i', 2);
time = getappdata(0,'elapsedtime');
set(handles.time,'String', num2str(time));   
end
% Get default command line output from handles structure
varargout{1} = handles.output;



function matrixX_Callback(hObject, eventdata, handles)
% hObject    handle to matrixX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of matrixX as text
%        str2double(get(hObject,'String')) returns contents of matrixX as a double


% --- Executes during object creation, after setting all properties.
function matrixX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to matrixX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function matrixA_Callback(hObject, eventdata, handles)
% hObject    handle to matrixA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of matrixA as text
%        str2double(get(hObject,'String')) returns contents of matrixA as a double


% --- Executes during object creation, after setting all properties.
function matrixA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to matrixA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function matrixB_Callback(hObject, eventdata, handles)
% hObject    handle to matrixB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of matrixB as text
%        str2double(get(hObject,'String')) returns contents of matrixB as a double


% --- Executes during object creation, after setting all properties.
function matrixB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to matrixB (see GCBO)
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
flage = getappdata(0,'file');
i = getappdata(0,'i');
n = getappdata(0,'numOfEq');
method  = getappdata(0,'method');
equations = getappdata(0,'equations');
if strcmp(method, 'gaussian')
if flage ~= 1
[X,StepsA,StepsB] = SolveLinearEquations(n,equations,'Gaussian-elimination','5','5','5');
else
   StepsA = getappdata(0,'StepsA');
   StepsB = getappdata(0,'StepsB');
end
s = size(StepsA,3);
if i < s
    a = num2str(double(StepsA(:,:,i)));
    set(handles.matrixA,'Max', n,'String', a);
    b = num2str(double(StepsB(:,:,i)));
    set(handles.matrixB,'Max', n,'String', b);
    set(handles.nuStep,'String', num2str(i));
    setappdata(0,'i', i + 1);
else 
    a = num2str(double(StepsA(:,:,s)));
    set(handles.matrixA,'Max', n,'String', a);
    b = num2str(double(StepsB(:,:,s)));
    set(handles.matrixB,'Max', n,'String', b);
    set(handles.nuStep,'String', num2str(s));
     set(handles.next,'Enable','off')
end
else
if flage ~= 1
[X,StepsA,StepsB,StepsLU,B,D] = SolveLinearEquations(n,equations,'Gaussian-Jordan','5','5','5');
setappdata(0,'elapsedtime',X);
else
X = getappdata(0,'X');
StepsA = getappdata(0,'StepsA');
StepsB = getappdata(0,'StepsB');
StepsLU = getappdata(0,'StepsLU');
end
s = size(StepsB,3);
if i < s
    a = num2str(double(StepsB(:,1:n,i)));
    set(handles.matrixA,'Max', n,'String', a);
    b = num2str(double(StepsB(:,n+1,i)));
    set(handles.matrixB,'Max', n,'String', b);
    set(handles.nuStep,'String', num2str(i));
    setappdata(0,'i', i + 1);
else 
    a = num2str(double(StepsLU(:,1:n)));
    set(handles.matrixA,'Max', n,'String', a);
    b = num2str(double(StepsLU(:,n+1)));
    set(handles.matrixB,'Max', n,'String', b);
    set(handles.nuStep,'String', num2str(s));
    set(handles.next,'Enable','off')
end
end

function nuStep_Callback(hObject, eventdata, handles)
% hObject    handle to nuStep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nuStep as text
%        str2double(get(hObject,'String')) returns contents of nuStep as a double


% --- Executes during object creation, after setting all properties.
function nuStep_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nuStep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function time_Callback(hObject, eventdata, handles)
% hObject    handle to time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of time as text
%        str2double(get(hObject,'String')) returns contents of time as a double


% --- Executes during object creation, after setting all properties.
function time_CreateFcn(hObject, eventdata, handles)
% hObject    handle to time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
