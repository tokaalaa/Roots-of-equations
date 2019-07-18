function varargout = EnterEquations2(varargin)
% ENTEREQUATIONS2 MATLAB code for EnterEquations2.fig
%      ENTEREQUATIONS2, by itself, creates a new ENTEREQUATIONS2 or raises the existing
%      singleton*.
%
%      H = ENTEREQUATIONS2 returns the handle to a new ENTEREQUATIONS2 or the handle to
%      the existing singleton*.
%
%      ENTEREQUATIONS2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ENTEREQUATIONS2.M with the given input arguments.
%
%      ENTEREQUATIONS2('Property','Value',...) creates a new ENTEREQUATIONS2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EnterEquations2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EnterEquations2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EnterEquations2

% Last Modified by GUIDE v2.5 03-May-2019 23:39:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EnterEquations2_OpeningFcn, ...
                   'gui_OutputFcn',  @EnterEquations2_OutputFcn, ...
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


% --- Executes just before EnterEquations2 is made visible.
function EnterEquations2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EnterEquations2 (see VARARGIN)

% Choose default command line output for EnterEquations2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EnterEquations2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = EnterEquations2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.next,'Enable','off')
setappdata(0,'i', 0);
% Get default command line output from handles structure
varargout{1} = handles.output;



function nuOfEq_Callback(hObject, eventdata, handles)
% hObject    handle to nuOfEq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
num = str2double(get(hObject,'String'));
setappdata(0,'numOfEq', num);


% --- Executes during object creation, after setting all properties.
function nuOfEq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nuOfEq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eq_Callback(hObject, eventdata, handles)
% hObject    handle to eq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
eq = get(hObject,'String');
setappdata(0,'eq',eq);

% --- Executes during object creation, after setting all properties.
function eq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in add.
function add_Callback(hObject, eventdata, handles)
% hObject    handle to add (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
i = getappdata(0,'i');
n = getappdata(0,'numOfEq');
sym('x',[1 n]);
c = n - 1;
if i == 0
    setappdata(0,'i', i + 1);
    equations = evalin(symengine,getappdata(0,'eq'));
    setappdata(0,'equations',equations);
    s = strcat('Equation_',num2str(i + 2));
    set(handles.textEq, 'String', s);
    set(handles.eq, 'String', '');
elseif i == c
    set(handles.add,'Enable','off');
     set(handles.next,'Enable','on');
    equations = getappdata(0,'equations');
    disp(equations)
    setappdata(0,'i', i + 1);
    equations = getappdata(0,'equations');
    equations = [equations,evalin(symengine,getappdata(0,'eq'))];
    setappdata(0,'equations',equations);
    s2 = strcat('Equation_',num2str(i + 2));
    set(handles.textEq, 'String', s2);
    set(handles.eq, 'String', '');
else
     setappdata(0,'i', i + 1);
    equations = getappdata(0,'equations');
    equations = [equations,evalin(symengine,getappdata(0,'eq'))];
    setappdata(0,'equations',equations);
    s2 = strcat('Equation_',num2str(i + 2));
    set(handles.textEq, 'String', s2);
    set(handles.eq, 'String', '');
end





% --- Executes on button press in next.
function next_Callback(hObject, eventdata, handles)
% hObject    handle to next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(handles.figure1);
n = getappdata(0,'numOfEq');
equations = getappdata(0,'equations');
sym('x',[1 n]);
var = sym('x',[1,n]);
[A,B] = equationsToMatrix(equations, var);
flag = checkInconsistent(A,B);
if ~flag
    ChooseMethod
else
    Inconsistent
end

