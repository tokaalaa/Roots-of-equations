function varargout = Data(varargin)
% DATA MATLAB code for Data.fig
%      DATA, by itself, creates a new DATA or raises the existing
%      singleton*.
%
%      H = DATA returns the handle to a new DATA or the handle to
%      the existing singleton*.
%
%      DATA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DATA.M with the given input arguments.
%
%      DATA('Property','Value',...) creates a new DATA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Data_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Data_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Data

% Last Modified by GUIDE v2.5 11-May-2019 05:15:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Data_OpeningFcn, ...
                   'gui_OutputFcn',  @Data_OutputFcn, ...
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


% --- Executes just before Data is made visible.
function Data_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Data (see VARARGIN)

% Choose default command line output for Data
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Data wait for user response (see UIRESUME)
% uiwait(handles.data);


% --- Outputs from this function are returned to the command line.
function varargout = Data_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in next.
function next_Callback(hObject, eventdata, handles)
% hObject    handle to next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Seidel
%delete(handles.data);


function numIteration_Callback(hObject, eventdata, handles)
% hObject    handle to numIteration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numIteration as text
maxI = str2double(get(hObject,'String'));
if get(hObject,'String') == ' '
    setappdata(0,'maxI', 50.0);
    disp('enter');
else
    setappdata(0,'maxI', maxI);
        disp('enter2');
end



% --- Executes during object creation, after setting all properties.
function numIteration_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numIteration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function error_Callback(hObject, eventdata, handles)
% hObject    handle to error (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of error as text
error = str2double(get(hObject,'String'));
if get(hObject,'String') == ' '
    setappdata(0,'error', 0.00001);
else 
    setappdata(0,'error', error);
end

% --- Executes during object creation, after setting all properties.
function error_CreateFcn(hObject, eventdata, handles)
% hObject    handle to error (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function initial_Callback(hObject, eventdata, handles)
% hObject    handle to initial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

str = get(hObject,'String');
newstr = strsplit(str,' ');
D = zeros();
for i = 1 : length(newstr)
    D(i) = str2double(newstr(i));
end
setappdata(0,'initial', D);


    
% --- Executes during object creation, after setting all properties.
function initial_CreateFcn(hObject, eventdata, handles)
% hObject    handle to initial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
