function varargout = LU_Decomposition(varargin)
% LU_DECOMPOSITION MATLAB code for LU_Decomposition.fig
%      LU_DECOMPOSITION, by itself, creates a new LU_DECOMPOSITION or raises the existing
%      singleton*.
%
%      H = LU_DECOMPOSITION returns the handle to a new LU_DECOMPOSITION or the handle to
%      the existing singleton*.
%
%      LU_DECOMPOSITION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LU_DECOMPOSITION.M with the given input arguments.
%
%      LU_DECOMPOSITION('Property','Value',...) creates a new LU_DECOMPOSITION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LU_Decomposition_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LU_Decomposition_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LU_Decomposition

% Last Modified by GUIDE v2.5 07-May-2019 11:34:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LU_Decomposition_OpeningFcn, ...
                   'gui_OutputFcn',  @LU_Decomposition_OutputFcn, ...
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


% --- Executes just before LU_Decomposition is made visible.
function LU_Decomposition_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LU_Decomposition (see VARARGIN)

% Choose default command line output for LU_Decomposition
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LU_Decomposition wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = LU_Decomposition_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n = getappdata(0,'numOfEq');
flage = getappdata(0,'file');
if flage ~= 1
equations = getappdata(0,'equations');
tic;
[X,StepsA,StepsB,StepsLU,B,D] = SolveLinearEquations(n,equations,'LU decomposition','5','5','5');
toc;
elapsedtime = toc;
setappdata(0,'elapsedtime',elapsedtime);
else
    StepsA = getappdata(0,'StepsA');
   StepsLU = getappdata(0,'StepsLU');
end
x = num2str(double(StepsA(:,:,1)));
set(handles.matrix1,'Max', n,'String', x);
a = double(StepsLU(:,:,1));
disp(a);
b(1,1) = 1;
for i = 2:n
    b(1,i) = 0;
end
for i = 2:n
   for j = 1:n
       a(i,j) = 0;
       if j == i
           b(i,j) = 1;
       else 
           b(i,j) = 0;
       end
   end
end
set(handles.matrix2,'Max', n,'String', num2str(b));
set(handles.matrix3,'Max', n,'String', num2str(a));
set(handles.nuStep,'String', num2str(1));
text = strcat('Decompose A into L and U step:1 / ' , num2str(size(StepsA,3)));
set(handles.textStep,'String', text);
set(handles.where,'String', 'Where [A] = [L][U]');
setappdata(0,'i', 2);
time = getappdata(0,'elapsedtime');
set(handles.time,'String', num2str(time));
% Get default command line output from handles structure
varargout{1} = handles.output;



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



function textStep_Callback(hObject, eventdata, handles)
% hObject    handle to textStep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textStep as text
%        str2double(get(hObject,'String')) returns contents of textStep as a double


% --- Executes during object creation, after setting all properties.
function textStep_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textStep (see GCBO)
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
i = getappdata(0,'i');
n = getappdata(0,'numOfEq');
flage = getappdata(0,'file');
if flage ~= 1
equations = getappdata(0,'equations');
[X,StepsA,StepsB,StepsLU,B,D] = SolveLinearEquations(n,equations,'LU decomposition','5','5','5');
else 
   X = getappdata(0,'X');
   StepsA = getappdata(0,'StepsA');
   StepsLU = getappdata(0,'StepsLU');
   B =  getappdata(0,'B');
   D = getappdata(0,'D');
end
s = size(StepsA,3) + 1;
if i < s
    x = num2str(double(StepsA(:,:,i)));
    set(handles.matrix1,'Max', n,'String', x);
    %a = num2str(double(StepsLU(:,:,i)));
    %set(handles.matrix2,'Max', n,'String', a);
    %b = num2str(double(StepsLU(:,:,i)));
    %set(handles.matrix3,'Max', n,'String', b);
    disp(StepsLU(:,:,i))
    a = double(StepsLU(:,:,i));
    b = double(StepsLU(:,:,i));
    b(1,1) = 1;
    for k = 2:n
    b(1,k) = 0;
    end
    for k = 2:n
         if k > i 
          a(k,:) = 0;
          b(k,:) = 0;
      end
      for j = 1:k
        if k ~= j
          a(k,j) = 0;
        end
      end
      for m = k:n
          if m == j
             b(k,m) = 1;
          else 
             b(k,m) = 0;
       end
      end
    end
     
    set(handles.matrix2,'Max', n,'String', num2str(b));
    set(handles.matrix3,'Max', n,'String', num2str(a));
    set(handles.nuStep,'String', num2str(1));
    text1 = strcat('Decompose A into L and U step:' , num2str(i));
    text2 = strcat(' / ' , num2str(size(StepsA,3)));
    text3 = strcat(text1, text2);
    set(handles.textStep,'String', text3);
    setappdata(0,'i', i + 1);
elseif i == s
    x = num2str(double(StepsLU(:,:,s-1)));
    set(handles.matrix1,'Max', n,'String', x);
    C = D.';
    a = num2str(double(C));
    set(handles.matrix2,'Max', n,'String', a);
    b = num2str(double(B));
    set(handles.matrix3,'Max', n,'String', b);
    set(handles.nuStep,'String', num2str(2));
    set(handles.m1,'String', '[L]');
    set(handles.m2,'String', '[D]');
    set(handles.m3,'String', '[B]');
    set(handles.where,'String', 'Where [L][D] = [B]');
    set(handles.textStep,'String', 'Compute D using forward substitution');
    setappdata(0,'i', i + 1);
elseif i == (s + 1)
    x = num2str(double(StepsLU(:,:,s-2)));
    set(handles.matrix1,'Max', n,'String', x);
    Cx = X.';
    a = num2str(double(Cx));
    set(handles.matrix2,'Max', n,'String', a);
    C2 = D.';
    b = num2str(double(C2));
    set(handles.matrix3,'Max', n,'String', b);
    set(handles.nuStep,'String', num2str(3));
    set(handles.m1,'String', '[U]');
    set(handles.m2,'String', '[X]');
    set(handles.m3,'String', '[D]');
    set(handles.where,'String', 'Where [U][X] = [D]');
    set(handles.textStep,'String', 'Compute X using back substitution');
    setappdata(0,'i', i + 1);
    set(handles.next,'Enable','off');
end


function matrix1_Callback(hObject, eventdata, handles)
% hObject    handle to matrix1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of matrix1 as text
%        str2double(get(hObject,'String')) returns contents of matrix1 as a double


% --- Executes during object creation, after setting all properties.
function matrix1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to matrix1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function matrix2_Callback(hObject, eventdata, handles)
% hObject    handle to matrix2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of matrix2 as text
%        str2double(get(hObject,'String')) returns contents of matrix2 as a double


% --- Executes during object creation, after setting all properties.
function matrix2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to matrix2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function matrix3_Callback(hObject, eventdata, handles)
% hObject    handle to matrix3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of matrix3 as text
%        str2double(get(hObject,'String')) returns contents of matrix3 as a double


% --- Executes during object creation, after setting all properties.
function matrix3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to matrix3 (see GCBO)
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
