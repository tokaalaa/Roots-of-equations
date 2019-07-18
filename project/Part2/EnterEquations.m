function varargout = EnterEquations(varargin)
% ENTEREQUATIONS MATLAB code for EnterEquations.fig
%      ENTEREQUATIONS, by itself, creates a new ENTEREQUATIONS or raises the existing
%      singleton*.
%
%      H = ENTEREQUATIONS returns the handle to a new ENTEREQUATIONS or the handle to
%      the existing singleton*.
%
%      ENTEREQUATIONS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ENTEREQUATIONS.M with the given input arguments.
%
%      ENTEREQUATIONS('Property','Value',...) creates a new ENTEREQUATIONS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EnterEquations_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EnterEquations_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EnterEquations

% Last Modified by GUIDE v2.5 02-May-2019 22:40:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EnterEquations_OpeningFcn, ...
                   'gui_OutputFcn',  @EnterEquations_OutputFcn, ...
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


% --- Executes just before EnterEquations is made visible.
function EnterEquations_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EnterEquations (see VARARGIN)

% Choose default command line output for EnterEquations
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EnterEquations wait for user response (see UIRESUME)
% uiwait(handles.equation);


% --- Outputs from this function are returned to the command line.
function varargout = EnterEquations_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function numberOfEquations_Callback(hObject, eventdata, handles)
% hObject    handle to numberOfEquations (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numberOfEquations as text
num = str2double(get(hObject,'String'));
setappdata(0,'numOfEq',num);
switch(num)
    case 1
      set(handles.equation1, 'Visible', 'on');
      set(handles.eq1, 'Visible', 'on');
      set(handles.equation2, 'Visible', 'off');
      set(handles.eq2, 'Visible', 'off');
      set(handles.equation3, 'Visible', 'off');
      set(handles.eq3, 'Visible', 'off');
      set(handles.equation4, 'Visible', 'off');
      set(handles.eq4, 'Visible', 'off');
      set(handles.equation5, 'Visible', 'off');
      set(handles.eq5, 'Visible', 'off');
    case 2
      set(handles.equation1, 'Visible', 'on');
      set(handles.eq1, 'Visible', 'on');
      set(handles.equation2, 'Visible', 'on');
      set(handles.eq2, 'Visible', 'on');
      set(handles.equation3, 'Visible', 'off');
      set(handles.eq3, 'Visible', 'off');
      set(handles.equation4, 'Visible', 'off');
      set(handles.eq4, 'Visible', 'off');
      set(handles.equation5, 'Visible', 'off');
      set(handles.eq5, 'Visible', 'off');
    case 3
      set(handles.equation1, 'Visible', 'on');
      set(handles.eq1, 'Visible', 'on');
      set(handles.equation2, 'Visible', 'on');
      set(handles.eq2, 'Visible', 'on');
      set(handles.equation3, 'Visible', 'on');
      set(handles.eq3, 'Visible', 'on');
      set(handles.equation4, 'Visible', 'off');
      set(handles.eq4, 'Visible', 'off');
      set(handles.equation5, 'Visible', 'off');
      set(handles.eq5, 'Visible', 'off');
    case 4
      set(handles.equation1, 'Visible', 'on');
      set(handles.eq1, 'Visible', 'on');
      set(handles.equation2, 'Visible', 'on');
      set(handles.eq2, 'Visible', 'on');
      set(handles.equation3, 'Visible', 'on');
      set(handles.eq3, 'Visible', 'on');
      set(handles.equation4, 'Visible', 'on');
      set(handles.eq4, 'Visible', 'on');
      set(handles.equation5, 'Visible', 'off');
      set(handles.eq5, 'Visible', 'off');
    case 5
      set(handles.equation1, 'Visible', 'on');
      set(handles.eq1, 'Visible', 'on');
      set(handles.equation2, 'Visible', 'on');
      set(handles.eq2, 'Visible', 'on');
      set(handles.equation3, 'Visible', 'on');
      set(handles.eq3, 'Visible', 'on');
      set(handles.equation4, 'Visible', 'on');
      set(handles.eq4, 'Visible', 'on');
      set(handles.equation5, 'Visible', 'on');
      set(handles.eq5, 'Visible', 'on');
end


% --- Executes during object creation, after setting all properties.
function numberOfEquations_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numberOfEquations (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function equation1_Callback(hObject, eventdata, handles)
% hObject    handle to equation1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
eq1 = get(hObject,'String');
setappdata(0,'eq1',eq1);

% --- Executes during object creation, after setting all properties.
function equation1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to equation1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function equation2_Callback(hObject, eventdata, handles)
% hObject    handle to equation2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
eq2 = get(hObject,'String');
setappdata(0,'eq2',eq2);


% --- Executes during object creation, after setting all properties.
function equation2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to equation2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function equation3_Callback(hObject, eventdata, handles)
% hObject    handle to equation3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
eq3 = get(hObject,'String');
setappdata(0,'eq3',eq3);

% --- Executes during object creation, after setting all properties.
function equation3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to equation3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function equation4_Callback(hObject, eventdata, handles)
% hObject    handle to equation4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
eq4 = get(hObject,'String');
setappdata(0,'eq4',eq4);


% --- Executes during object creation, after setting all properties.
function equation4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to equation4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function equation5_Callback(hObject, eventdata, handles)
% hObject    handle to equation5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
eq5 = get(hObject,'String');
setappdata(0,'eq5',eq5);


% --- Executes during object creation, after setting all properties.
function equation5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to equation5 (see GCBO)
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
n = getappdata(0,'numOfEq');
sym('x',[1 n]);
if n > 0
         equations = sym(getappdata(0,'eq1'));
end
switch(getappdata(0,'numOfEq'))
    case 2
         equations=[equations,sym(getappdata(0,'eq2'))];
    case 3
         equations=[equations,sym(getappdata(0,'eq2'))];
         equations=[equations,sym(getappdata(0,'eq3'))];
    case 4
         equations=[equations,sym(getappdata(0,'eq2'))];
         equations=[equations,sym(getappdata(0,'eq3'))];
         equations=[equations,sym(getappdata(0,'eq4'))];
    case 5
          equations=[equations,sym(getappdata(0,'eq2'))];
         equations=[equations,sym(getappdata(0,'eq3'))];
         equations=[equations,sym(getappdata(0,'eq4'))];
         equations=[equations,sym(getappdata(0,'eq5'))];
end
setappdata(0,'equations',equations);
delete(handles.equation);
ChooseMethod
