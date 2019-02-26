function varargout = GroundTruth(varargin)
% GROUNDTRUTH MATLAB code for GroundTruth.fig
%      GROUNDTRUTH, by itself, creates a new GROUNDTRUTH or raises the existing
%      singleton*.
%
%      H = GROUNDTRUTH returns the handle to a new GROUNDTRUTH or the handle to
%      the existing singleton*.
%
%      GROUNDTRUTH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GROUNDTRUTH.M with the given input arguments.
%
%      GROUNDTRUTH('Property','Value',...) creates a new GROUNDTRUTH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GroundTruth_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GroundTruth_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GroundTruth

% Last Modified by GUIDE v2.5 08-Sep-2018 22:39:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GroundTruth_OpeningFcn, ...
                   'gui_OutputFcn',  @GroundTruth_OutputFcn, ...
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

% --- Executes just before GroundTruth is made visible.
function GroundTruth_OpeningFcn(hObject, eventdata, handles, varargin)
global fns; %file data
global Templs; %template
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GroundTruth (see VARARGIN)

% Choose default command line output for GroundTruth
handles.output = hObject;

%clear figure
axes(handles.axes1);
cla reset;

% claer edit text
set(handles.stl_name,'string','');

% Update handles structure
guidata(hObject, handles);
buildTemplate;

%not to select the radio button
set(handles.DeleteCheck, 'Value', 0);
set(handles.AddCheck, 'Value', 0);

%clear figure
axes(handles.axes1);
cla reset;
% UIWAIT makes GroundTruth wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = GroundTruth_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in DeleteCheck.
function DeleteCheck_Callback(hObject, eventdata, handles)
% hObject    handle to DeleteCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of DeleteCheck
if get(handles.AddCheck, 'Value');
    set(handles.AddCheck, 'Value', 0);
else get(handles.check_delete_point, 'Value');
    set(handles.check_delete_point, 'Value', 0);
end

% --- Executes on button press in AddCheck.
function AddCheck_Callback(hObject, eventdata, handles)
% hObject    handle to AddCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of AddCheck
if get(handles.DeleteCheck, 'Value');
    set(handles.DeleteCheck, 'Value', 0);
else get(handles.check_delete_point, 'Value');
    set(handles.check_delete_point, 'Value', 0);
end

% --- Executes on button press in check_delete_point.
function check_delete_point_Callback(hObject, eventdata, handles)
% hObject    handle to check_delete_point (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of check_delete_point
if get(handles.DeleteCheck, 'Value');
    set(handles.DeleteCheck, 'Value', 0);
else get(handles.AddCheck, 'Value');
    set(handles.AddCheck, 'Value', 0);
end

% --- Executes on button press in load.
function load_Callback(hObject, eventdata, handles)
%param
global fns; global Templs; 
%output
global F; global V; global E; global ReliefLabels; global resSim; global addedLabelNum;
% hObject    handle to LoadJi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
F = []; V = []; E = []; ReliefLabels = []; resSim = []; addedLabelNum = [];

input_name = get(handles.stl_name,'string');
if isempty(input_name)
    return;
elseif ~(sum(strcmp(fns,input_name)))
    return;
end

set(handles.stl_name,'string','');

[F, V, E, ReliefLabels, resSim] = re_SIRules( input_name, Templs );
addedLabelNum = max(ReliefLabels);

axes(handles.axes1);
cla reset;
drawscatter( V, labelVertex2rgb(ReliefLabels) );



% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%param
global F; global V; global E; global ReliefLabels; global resSim; global firstPointFlag; global addedLabelNum;
%output
global points;

points = [];

pos = get(handles.axes1, 'View');
if (pos(1) ~= 90) || (pos(2) ~= 90)
    tempString = sprintf('align x,y');
    set(handles.Vertex_X, 'String', tempString);
    return;
end

%get current point to CP(currentPoint)
CP = get (gca, 'CurrentPoint'); %CurrentPoint
CP = CP(1,:);
    
ROIPoints_X = find(abs(V(:,1) - CP(1)) <= 0.15);
ROIPoints_Y = find(abs(V(:,2) - CP(2)) <= 0.15);

xcount = size(ROIPoints_X,1); %count x ROI points

for x = 1 : xcount
    idx = find(ROIPoints_Y == ROIPoints_X(x));
    if idx
        idx = ROIPoints_Y(idx);
        vertex = V(idx, :);
    break;
    end
end

tempString = sprintf('%0.5f', vertex(1));
set(handles.Vertex_X, 'String', tempString);
tempString = sprintf('%0.5f', vertex(2));
set(handles.Vertex_Y, 'String', tempString);
tempString = sprintf('%0.5f', vertex(3));
set(handles.Vertex_Z, 'String', tempString);
tempString = sprintf('%0.5f', ReliefLabels(idx));
set(handles.Vertex_Label, 'String', tempString);
tempString = sprintf('%0.5f', idx);
set(handles.index, 'String', tempString);

axes(handles.axes1); %get handel

if get(handles.DeleteCheck, 'Value') %delete
    CPL = ReliefLabels(idx); %current point Label
    if ~CPL 
        return;
    end
    sameLabelIndex = find(ReliefLabels == CPL);
    ReliefLabels(sameLabelIndex) = 0;
    cla reset;
    drawscatter( V, labelVertex2rgb(ReliefLabels) );
end

ROIPoints_X = []; ROIPoints_Y = []; xcount = 0; vertexes = [];

ROIPoints_X = find(abs(V(:,1) - CP(1)) <= 0.3);
ROIPoints_Y = find(abs(V(:,2) - CP(2)) <= 0.3);

xcount = size(ROIPoints_X,1); %count x ROI points

for x = 1 : xcount
    idx = find(ROIPoints_Y == ROIPoints_X(x));
    if idx
        idx = ROIPoints_Y(idx);
        vertexes(size(vertexes,1)+1,1) = idx;
    end
end

if get(handles.AddCheck, 'Value')
    ReliefLabels(vertexes) = addedLabelNum;
end

if get(handles.check_delete_point, 'Value')
    ReliefLabels(vertexes) = 0;
    cla reset;
    drawscatter( V, labelVertex2rgb(ReliefLabels) );
end

% --- Executes on button press in pushbutton_add.
function pushbutton_add_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_add (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global F; global V; global E; global ReliefLabels; global resSim; global firstPointFlag; global addedLabelNum;
cla reset;
drawscatter( V, labelVertex2rgb(ReliefLabels) );

function stl_name_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function stl_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
