function varargout = RequiredData(varargin)
% REQUIREDDATA MATLAB code for RequiredData.fig
%      REQUIREDDATA, by itself, creates a new REQUIREDDATA or raises the existing
%      singleton*.
%
%      H = REQUIREDDATA returns the handle to a new REQUIREDDATA or the handle to
%      the existing singleton*.
%
%      REQUIREDDATA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REQUIREDDATA.M with the given input arguments.
%
%      REQUIREDDATA('Property','Value',...) creates a new REQUIREDDATA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RequiredData_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RequiredData_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RequiredData

% Last Modified by GUIDE v2.5 07-May-2019 17:37:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RequiredData_OpeningFcn, ...
                   'gui_OutputFcn',  @RequiredData_OutputFcn, ...
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


% --- Executes just before RequiredData is made visible.
function RequiredData_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RequiredData (see VARARGIN)

% Choose default command line output for RequiredData
handles.output = hObject;
switch(getappdata(0,'method'))
    case 'newtonRaphson'
      set(handles.x2Value, 'Visible', 'off');
      set(handles.text3, 'Visible', 'off');
    case 'fixedPoint'
      set(handles.x2Value, 'Visible', 'off');
      set(handles.text3, 'Visible', 'off');
    case 'biergeVieta'
      set(handles.x2Value, 'Visible', 'off');
      set(handles.text3, 'Visible', 'off');
end
if (strcmp(getappdata(0,'method'),'all'))
    set(handles.text4, 'Visible', 'off');
    set(handles.moodgroup, 'Visible', 'off');
end
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes RequiredData wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = RequiredData_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in evaluate.
function evaluate_Callback(hObject, eventdata, handles)
% hObject    handle to evaluate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
e = getappdata(0, 'equation');
display(['equation' e]);
maxIter = getappdata(0, 'iteration');
eps = getappdata(0, 'percision');
syms x;
equ = str2func(e);
y = equ(x);
selectcondtype=get(handles.moodgroup,'SelectedObject'); %conductor tupe
mood=get(selectcondtype,'String');
switch(getappdata(0,'method'))
    case 'falsePosition'
    xl = get(handles.x1Value,'String');
    xu = get(handles.x2Value,'String');
    tic;
    [root,steps,type] = RegFalsi(y,str2double(xl),str2double(xu),eps,maxIter);
    toc;
    elapsedtime = toc;
    setappdata(0,'elapsedtime',elapsedtime);
    setappdata(0,'steps',steps);
    setappdata(0,'root',root);
    setappdata(0,'type',type);
    switch mood
        case 'Single Step Mood'
          delete(handles.figure1);
          GUI1; 
        case'Final Result Mood'
          delete(handles.figure1);
          finalResult; 
    end
    case 'bisection'
    xl = get(handles.x1Value,'String');
    xu = get(handles.x2Value,'String');
    tic;
    [root1,steps,maxiter,type] = bisectionMethod(y,str2double(xl),str2double(xu),eps,maxIter);
    toc;
    elapsedtime = toc;
    setappdata(0,'elapsedtime',elapsedtime);
    setappdata(0,'steps',steps);
    setappdata(0,'root',root1);
    setappdata(0,'maxiter',maxiter);
    setappdata(0,'type',type);
    switch mood
        case 'Single Step Mood'
          delete(handles.figure1);
          GUI1; 
        case'Final Result Mood'
          delete(handles.figure1);
          finalResult; 
    end
    case 'secant'
    xl = get(handles.x1Value,'String');
    xu = get(handles.x2Value,'String');
    tic;
    [root,steps,type] = Secant(y,str2double(xl),str2double(xu),eps,maxIter);
    toc;
    elapsedtime = toc;
    setappdata(0,'elapsedtime',elapsedtime);
    setappdata(0,'steps',steps);
    setappdata(0,'root',root);
    setappdata(0,'type',type);
    switch mood
        case 'Single Step Mood'
          delete(handles.figure1);
          GUI1; 
        case'Final Result Mood'
          delete(handles.figure1);
          finalResult; 
    end
    case'newtonRaphson'
      xl = get(handles.x1Value,'String');
      tic;
      [root,steps,type] = NewtonRaphson(y,str2double(xl),eps,maxIter);
      toc;
      elapsedtime = toc;
      setappdata(0,'elapsedtime',elapsedtime);
      setappdata(0,'steps',steps);
      setappdata(0,'root',root);
      setappdata(0,'type',type);
        switch mood
            case 'Single Step Mood'
                delete(handles.figure1);
                GUI2; 
            case'Final Result Mood'
                delete(handles.figure1);
                finalResult; 
        end
    case'fixedPoint'
      xl = get(handles.x1Value,'String');
      tic;
      [root, steps, type, iter, gdash] = fixed_point(y,str2double(xl),eps,maxIter);
      toc;
      elapsedtime = toc;
      setappdata(0,'elapsedtime',elapsedtime);
      setappdata(0,'gdash',gdash);
      setappdata(0,'steps',steps);
      setappdata(0,'root',root);
      setappdata(0,'type',type);
      setappdata(0,'iter',iter);
      switch mood
        case 'Single Step Mood'
          delete(handles.figure1);
          GUI2; 
        case'Final Result Mood'
          delete(handles.figure1);
          finalResult; 
      end
    case 'biergeVieta'
         xl = get(handles.x1Value,'String');
      tic;
      [root, steps, E, R,type] = BirgeVieta(y,str2double(xl),eps,maxIter);
      toc;
      elapsedtime = toc;
      setappdata(0,'elapsedtime',elapsedtime);
      setappdata(0,'steps',steps);
      setappdata(0,'root',root);
      setappdata(0,'roots',R);
      setappdata(0,'error',E);
      setappdata(0,'type',type);
       switch mood
        case 'Single Step Mood'
          delete(handles.figure1);
          GUI3; 
        case'Final Result Mood'
          delete(handles.figure1);
          finalResult; 
       end
    case 'all'
        xl = get(handles.x1Value,'String');
        xu = get(handles.x2Value,'String');
        [rootbis,stepsbis,maxiter] = bisectionMethod(y,str2double(xl),str2double(xu),eps,maxIter);
        [rootreg,stepsreg,type]= RegFalsi(y,str2double(xl),str2double(xu),eps,maxIter);
        [rootbir, stepsbir,E,R,type]  = BirgeVieta(y,str2double(xl),eps,maxIter);
        [rootsec,stepssec,type] = Secant(y,str2double(xl),str2double(xu),eps,maxIter);
        [rootnew,stepsnew,type] = NewtonRaphson(y,xl,eps,maxIter);
        [rootfix, stepsfix, type, iter] = fixed_point(y,xl,eps,maxIter);
        setappdata(0,'stepsbis',stepsbis);
      setappdata(0,'rootbis',rootbis);
      setappdata(0,'stepsreg',stepsreg);
      setappdata(0,'rootreg',rootreg);
     setappdata(0,'stepsbir',stepsbir);
      setappdata(0,'rootbir',R);
      setappdata(0,'errorbir',E);
      setappdata(0,'stepssec',stepssec);
      setappdata(0,'rootsec',rootsec);
      setappdata(0,'stepsnew',stepsnew);
      setappdata(0,'rootnew',rootnew);
      setappdata(0,'stepsfix',stepsfix);
      setappdata(0,'rootfix',rootfix);
        delete(handles.figure1);
         GUI4;
end



function x1Value_Callback(hObject, eventdata, handles)
% hObject    handle to x1Value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x1Value as text
%        str2double(get(hObject,'String')) returns contents of x1Value as a double


% --- Executes during object creation, after setting all properties.
function x1Value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x1Value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x2Value_Callback(hObject, eventdata, handles)
% hObject    handle to x2Value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x2Value as text
%        str2double(get(hObject,'String')) returns contents of x2Value as a double


% --- Executes during object creation, after setting all properties.
function x2Value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x2Value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in prevbutton.
function prevbutton_Callback(hObject, eventdata, handles)
% hObject    handle to prevbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(handles.figure1);
ChooseMethod
