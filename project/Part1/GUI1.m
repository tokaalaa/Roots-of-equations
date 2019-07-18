function varargout = GUI1(varargin)
% GUI1 MATLAB code for GUI1.fig
%      GUI1, by itself, creates a new GUI1 or raises the existing
%      singleton*.
%
%      H = GUI1 returns the handle to a new GUI1 or the handle to
%      the existing singleton*.
%
%      GUI1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI1.M with the given input arguments.
%
%      GUI1('Property','Value',...) creates a new GUI1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI1

% Last Modified by GUIDE v2.5 04-May-2019 19:27:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI1_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI1_OutputFcn, ...
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


% --- Executes just before GUI1 is made visible.
function GUI1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI1 (see VARARGIN)

% Choose default command line output for GUI1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global index;
index = 1;
global steps;
global root;
global rows;
e = getappdata(0, 'equation');
syms x;
global equ;
equ = str2func(e);
method = getappdata(0,'method');
if strcmp('falsePosition',method)|| strcmp('bisection',method)
       steps = getappdata(0,'steps');
       root = getappdata(0,'root');
       iter = steps(index,1);
       xl = steps(index,2);
       xu = steps(index,3);
       xr = steps(index,4);
       f = steps(index,5);
       eps = steps(index,6);
       set(handles.stepText,'String',num2str(iter));
       set(handles.xlText,'String',num2str(xl));
       set(handles.xuText,'String',num2str(xu));
       set(handles.xrText,'String',num2str(xr));
       set(handles.fText,'String',num2str(f));
       set(handles.epsText,'String',num2str(eps));
       [r,c] = size(steps);
       rows = r;
       k = xl-10:(xu-xl)*.1:xu+10;
       y = equ(k);
       z = 0*k;
       plot(handles.axes1,k,y,'r',[xu xu],[-50 100],'b',[xl xl],[-50 100],'b',[xr xr],[-50 100],'y',k,z,'k');
        Ax = findall(0,'type','axes'); 
        axis(Ax,[xl-10 xu+10 -50 50]);
elseif strcmp('secant',method)
    disp(getappdata(0,'type'))
    if(strcmp(getappdata(0,'type'),'Root diverged') || strcmp(getappdata(0,'type'),'Divisio by zero !'))
    delete(handles.figure1);
    finalResult;
    end
      set(handles.text10, 'Visible', 'on');
      set(handles.edit7, 'Visible', 'on');
      set(handles.text5, 'String', 'x0');
      set(handles.text6, 'String', 'x1');
      set(handles.text7, 'String', 'f(x0)');
      set(handles.text8, 'String', 'f(x1)');
      steps = getappdata(0,'steps');
      root = getappdata(0,'root');
      iter = steps(index,1);
       x0 = steps(index,2);
       x1 = steps(index,3);
       fx0 = steps(index,4);
       fx1 = steps(index,5);
       x2 = steps(index,6);
       eps = steps(index,7);
       set(handles.stepText,'String',num2str(iter));
       set(handles.xlText,'String',num2str(x0));
       set(handles.xuText,'String',num2str(x1));
       set(handles.xrText,'String',num2str(fx0));
       set(handles.fText,'String',num2str(fx1));
       set(handles.edit7,'String',num2str(x2));
       set(handles.epsText,'String',num2str(eps));
       [r,c] = size(steps);
       rows = r;
       k = x0-10:x0*.01:x0+10;
       y = equ(k);
       z = 0*k;
       plot(handles.axes1,k,y,'r',k,z,'k');
       set(gca,'XLim',[x0-10 x0+10])
set(gca,'YLim',[fx0-50 fx0+50])
 xlim = get(gca,'XLim');
 A = [x0 x1]; 
B = [fx0 fx1];
m = (B(2)-B(1))/(A(2)-A(1));
n = B(2) - A(2)*m;
y1 = m*xlim(1) + n;
y2 = m*xlim(2) + n;
hold on
line([xlim(1) xlim(2)],[y1 y2])
hold off
      
end
clear index;
clear steps;
clear root;
% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in next.
function next_Callback(hObject, eventdata, handles)
% hObject    handle to next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global index;
global rows;
global steps;
global equ;
index = index + 1;
method = getappdata(0,'method');
if strcmp('falsePosition',method)|| strcmp('bisection',method)
    if(index <= rows)
       iter = steps(index,1);
       xl = steps(index,2);
       xu = steps(index,3);
       xr = steps(index,4);
       f = steps(index,5);
       eps = steps(index,6);
       set(handles.stepText,'String',num2str(iter));
       set(handles.xlText,'String',num2str(xl));
       set(handles.xuText,'String',num2str(xu));
       set(handles.xrText,'String',num2str(xr));
       set(handles.fText,'String',num2str(f));
       set(handles.epsText,'String',num2str(eps));
       [r,c] = size(steps);
       rows = r;
       k = xl-(xu-xl)/2:(xu-xl)/2:xu+(xu-xl)/2;
       y = equ(k);
       z = 0*k;
       plot(handles.axes1,k,y,'r',[xu xu],[-50 100],'b',[xl xl],[-50 100],'b',[xr xr],[-50 100],'y',k,z,'k');
        Ax = findall(0,'type','axes'); 
        axis(Ax,[xl-(xu-xl)/2 xu+(xu-xl)/2 -50 100]);
    else
        delete(handles.figure1);
        finalResult
    end
elseif strcmp('secant',method)
    if(index <= rows)
      iter = steps(index,1);
       x0 = steps(index,2);
       x1 = steps(index,3);
       fx0 = steps(index,4);
       fx1 = steps(index,5);
       x2 = steps(index,6);
       eps = steps(index,7);
       set(handles.stepText,'String',num2str(iter));
       set(handles.xlText,'String',num2str(x0));
       set(handles.xuText,'String',num2str(x1));
       set(handles.xrText,'String',num2str(fx0));
       set(handles.fText,'String',num2str(fx1));
       set(handles.edit7,'String',num2str(x2));
       set(handles.epsText,'String',num2str(eps));
       [r,c] = size(steps);
       rows = r;
       k = x0-1:x0*.01:x0+1;
       y = equ(k);
       z = 0*k;
       plot(handles.axes1,k,y,'r',k,z,'k');
       set(gca,'XLim',[x0-1 x0+1])
set(gca,'YLim',[fx0-50 fx0+50])
 xlim = get(gca,'XLim');
 A = [x0 x1]; 
B = [fx0 fx1];
m = (B(2)-B(1))/(A(2)-A(1));
n = B(2)*m - A(2);
y1 = m*xlim(1) + n;
y2 = m*xlim(2) + n;
hold on
line([xlim(1) xlim(2)],[y1 y2])
hold off 
    else
        delete(handles.figure1);
        finalResult
    end
end
clear index;
clear rows;


function stepText_Callback(hObject, eventdata, handles)
% hObject    handle to stepText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of stepText as text
%        str2double(get(hObject,'String')) returns contents of stepText as a double


% --- Executes during object creation, after setting all properties.
function stepText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to stepText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xlText_Callback(hObject, eventdata, handles)
% hObject    handle to xlText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xlText as text
%        str2double(get(hObject,'String')) returns contents of xlText as a double


% --- Executes during object creation, after setting all properties.
function xlText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xlText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xuText_Callback(hObject, eventdata, handles)
% hObject    handle to xuText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xuText as text
%        str2double(get(hObject,'String')) returns contents of xuText as a double


% --- Executes during object creation, after setting all properties.
function xuText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xuText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xrText_Callback(hObject, eventdata, handles)
% hObject    handle to xrText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xrText as text
%        str2double(get(hObject,'String')) returns contents of xrText as a double


% --- Executes during object creation, after setting all properties.
function xrText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xrText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fText_Callback(hObject, eventdata, handles)
% hObject    handle to fText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fText as text
%        str2double(get(hObject,'String')) returns contents of fText as a double


% --- Executes during object creation, after setting all properties.
function fText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function epsText_Callback(hObject, eventdata, handles)
% hObject    handle to epsText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of epsText as text
%        str2double(get(hObject,'String')) returns contents of epsText as a double


% --- Executes during object creation, after setting all properties.
function epsText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to epsText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
