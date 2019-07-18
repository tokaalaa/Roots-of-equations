function varargout = GUI2(varargin)
% GUI2 MATLAB code for GUI2.fig
%      GUI2, by itself, creates a new GUI2 or raises the existing
%      singleton*.
%
%      H = GUI2 returns the handle to a new GUI2 or the handle to
%      the existing singleton*.
%
%      GUI2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI2.M with the given input arguments.
%
%      GUI2('Property','Value',...) creates a new GUI2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI2

% Last Modified by GUIDE v2.5 05-May-2019 22:43:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI2_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI2_OutputFcn, ...
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


% --- Executes just before GUI2 is made visible.
function GUI2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI2 (see VARARGIN)

% Choose default command line output for GUI2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI2_OutputFcn(hObject, eventdata, handles) 
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
steps = getappdata(0, 'steps');
syms x;
global equ;
equ = str2func(e);
method = getappdata(0,'method');
if strcmp('newtonRaphson',method)
     iter = steps(index,1);
       xi = steps(index,2);
       f = steps(index,3);
       fd = steps(index,4);
       xnew = steps(index,5);
       eps = steps(index,6);
       set(handles.edit1,'String',num2str(iter));
       set(handles.edit2,'String',num2str(xi));
       set(handles.edit3,'String',num2str(f));
       set(handles.edit4,'String',num2str(fd));
       set(handles.edit5,'String',num2str(xnew));
       set(handles.edit6,'String',num2str(eps));
       [r,c] = size(steps);
       rows = r;
       k = xi-10:xi*.1:xi+10;
       y = equ(k);
       z = 0*k;
       plot(handles.axes1,k,y,'r',[xi xi],[-50 100],'b',[xnew xnew],[-50 100],'y',k,z,'k');
       set(gca,'XLim',[xi-10 xi+10])
set(gca,'YLim',[-50 100])
 xlim = get(gca,'XLim');
 A = [xi xnew]; 
B = [f 0];
m = (B(2)-B(1))/(A(2)-A(1));
n = B(2)- A(2)*m;
y1 = m*xlim(1) + n;
y2 = m*xlim(2) + n;
hold on
line([xlim(1) xlim(2)],[y1 y2])
hold off
elseif strcmp('fixedPoint',method)
    set(handles.text3,'visible','off');
    set(handles.text4,'visible','off');
    set(handles.text5,'visible','off');
    set(handles.edit3,'visible','off');
    set(handles.edit4,'visible','off');
    set(handles.edit5,'visible','off');
    iter = steps(index,1);
    xi = steps(index,2);
    eps = steps(index,3);
    set(handles.edit1,'String',num2str(iter));
    set(handles.edit2,'String',num2str(xi));
    set(handles.edit6,'String',num2str(eps));
       [r,c] = size(steps);
       rows = r;
    x1 = min(steps(index,2),steps(index+1,2));
    x2 = max(steps(index,2),steps(index+1,2));
    g = equ(x)+x;
    k = x1-10:(x2-x1)*0.1:x2+10;
    gx = subs(g,k);
    y = k;
    z= 0*k;
    plot(handles.axes1,k,y,'r',[xi xi],[-xi-10 xi+10],'b',k,gx,'y',k,z,'k');
    set(gca,'XLim',[x1-10 x2+10]);
    set(gca,'YLim',[-xi-10 xi+10]);
end
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
if strcmp('newtonRaphson',method)
    if(index <= rows)
         iter = steps(index,1);
       xi = steps(index,2);
       f = steps(index,3);
       fd = steps(index,4);
       xnew = steps(index,5);
       eps = steps(index,6);
       set(handles.edit1,'String',num2str(iter));
       set(handles.edit2,'String',num2str(xi));
       set(handles.edit3,'String',num2str(f));
       set(handles.edit4,'String',num2str(fd));
       set(handles.edit5,'String',num2str(xnew));
       set(handles.edit6,'String',num2str(eps));
       [r,c] = size(steps);
       rows = r;
       k = xi-1:.01:xi+1;
       y = equ(k);
       z = 0*k;
       plot(handles.axes1,k,y,'r',[xi xi],[-50 100],'b',[xnew xnew],[-50 100],'y',k,z,'k');
       set(gca,'XLim',[xi-1 xi+1])
set(gca,'YLim',[-50 100])
 xlim = get(gca,'XLim');
 
 A = [xi xi+1]; 
B = [f 0];
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
 elseif strcmp('fixedPoint',method)
     if(index <= rows)
    set(handles.text3,'visible','off');
    set(handles.text4,'visible','off');
    set(handles.text5,'visible','off');
    set(handles.edit3,'visible','off');
    set(handles.edit4,'visible','off');
    set(handles.edit5,'visible','off');
    iter = steps(index,1);
    xi = steps(index,2);
    eps = steps(index,3);
    set(handles.edit1,'String',num2str(iter));
    set(handles.edit2,'String',num2str(xi));
    set(handles.edit6,'String',num2str(eps));
       [r,c] = size(steps);
       rows = r;
       if(index < rows)
    x1 = min(steps(index,2),steps(index+1,2));
    x2 = max(steps(index,2),steps(index+1,2));
       else
    x1 = min(steps(index,2),steps(index-1,2));
    x2 = max(steps(index,2),steps(index-1,2));
       end
    syms x;
    g = equ(x)+x;
    k = x1-(x2-x1)*0.1:(x2-x1)*0.1:x2+(x2-x1)*0.1;
    gx = subs(g,k);
    y = k;
    z= 0*k;
    plot(handles.axes1,k,y,'r',[xi xi],[-xi-1 xi+1],'b',k,gx,'y',k,z,'k');
    set(gca,'XLim',[x1-(x2-x1)*0.1 x2+(x2-x1)*0.1]);
    set(gca,'YLim',[-xi-1 xi+1]);
     else
       delete(handles.figure1);
       finalResult
     end
end



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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
