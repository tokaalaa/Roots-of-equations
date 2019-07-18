function varargout = Seidel(varargin)
% SEIDEL MATLAB code for Seidel.fig
%      SEIDEL, by itself, creates a new SEIDEL or raises the existing
%      singleton*.
%
%      H = SEIDEL returns the handle to a new SEIDEL or the handle to
%      the existing singleton*.
%
%      SEIDEL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SEIDEL.M with the given input arguments.
%
%      SEIDEL('Property','Value',...) creates a new SEIDEL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Seidel_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Seidel_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Seidel

% Last Modified by GUIDE v2.5 11-May-2019 06:36:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Seidel_OpeningFcn, ...
                   'gui_OutputFcn',  @Seidel_OutputFcn, ...
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


% --- Executes just before Seidel is made visible.
function Seidel_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Seidel (see VARARGIN)

% Choose default command line output for Seidel
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Seidel wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Seidel_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
flage = getappdata(0,'file');
n = getappdata(0,'numOfEq');
equations = getappdata(0,'equations');
if flage ~= 1
maxIterations = getappdata(0, 'maxI');
disp(maxIterations);
epsilon = getappdata(0,'error');
disp(epsilon);
initial = getappdata(0, 'initial');
[X,StepsA,StepsB,StepsLU,B,D] = SolveLinearEquations(n,equations,'Gauss-Seidel', maxIterations, epsilon, initial);
else
    X = getappdata(0,'X');
    StepsA = getappdata(0,'StepsA');
    StepsB = getappdata(0,'StepsB');
    B = getappdata(0,'B');
end
setappdata(0,'elapsedtime',B);
set(handles.time,'String', num2str(B));
set(handles.numIter,'String', num2str(X));
set(handles.num,'String', num2str(1));
setappdata(0,'i', 2);
set(handles.x,'String', StepsA(:,1));
set(handles.error,'String', StepsB(:,1));
% Get default command line output from handles structure
varargout{1} = handles.output;



function numIter_Callback(hObject, eventdata, handles)
% hObject    handle to numIter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numIter as text
%        str2double(get(hObject,'String')) returns contents of numIter as a double


% --- Executes during object creation, after setting all properties.
function numIter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numIter (see GCBO)
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



function num_Callback(hObject, eventdata, handles)
% hObject    handle to num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of num as text
%        str2double(get(hObject,'String')) returns contents of num as a double


% --- Executes during object creation, after setting all properties.
function num_CreateFcn(hObject, eventdata, handles)
% hObject    handle to num (see GCBO)
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
n = getappdata(0,'numOfEq');
equations = getappdata(0,'equations');
color = ['y','b','g','m','c','r','w','k'];
if flage ~= 1
maxIterations = getappdata(0, 'maxI');
epsilon = getappdata(0,'error');
initial = getappdata(0, 'initial');
[X,StepsA,StepsB,StepsLU,B,D] = SolveLinearEquations(n,equations,'Gauss-Seidel', maxIterations, epsilon, initial);
else
    X = getappdata(0,'X');
    StepsA = getappdata(0,'StepsA');
    StepsB = getappdata(0,'StepsB');
    B = getappdata(0,'B');
    D = getappdata(0,'D');
    StepsLU = getappdata(0,'StepsLU');
end
i = getappdata(0,'i');
if i < X
    setappdata(0,'i', i + 1);
    set(handles.num,'String', num2str(i));
    set(handles.x,'String', StepsA(:,i));
    set(handles.error,'String', StepsB(:,i));
elseif i == X
    set(handles.plot,'Visible','on');
    setappdata(0,'i', i + 1);
    set(handles.num,'String', num2str(i));
    set(handles.x,'String', StepsA(:,i));
    set(handles.error,'String', StepsB(:,i));
    set(handles.next,'Enable','off');
    hold(handles.plot,'on');
    axis (handles.plot,'manual');
    for m = 1:n
         plot(handles.plot,StepsA(m,:),StepsB(m,:),'-+','Color',color(m),'MarkerEdgeColor',color(m));
    end
    axis (handles.plot,'auto');
    hold(handles.plot,'off');
end

% --- Executes on selection change in x.
function x_Callback(hObject, eventdata, handles)
% hObject    handle to x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns x contents as cell array
%        contents{get(hObject,'Value')} returns selected item from x


% --- Executes during object creation, after setting all properties.
function x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in error.
function error_Callback(hObject, eventdata, handles)
% hObject    handle to error (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns error contents as cell array
%        contents{get(hObject,'Value')} returns selected item from error


% --- Executes during object creation, after setting all properties.
function error_CreateFcn(hObject, eventdata, handles)
% hObject    handle to error (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
