function varargout = keti2(varargin)
% KETI2 MATLAB code for keti2.fig
%      KETI2, by itself, creates a new KETI2 or raises the existing
%      singleton*.
%
%      H = KETI2 returns the handle to a new KETI2 or the handle to
%      the existing singleton*.
%
%      KETI2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KETI2.M with the given input arguments.
%
%      KETI2('Property','Value',...) creates a new KETI2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before keti2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to keti2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help keti2

% Last Modified by GUIDE v2.5 29-Dec-2020 19:42:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @keti2_OpeningFcn, ...
                   'gui_OutputFcn',  @keti2_OutputFcn, ...
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


% --- Executes just before keti2 is made visible.
function keti2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to keti2 (see VARARGIN)

% Choose default command line output for keti2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes keti2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = keti2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%ͼƬ����
[FileName,PathName] = uiputfile({'*.*';'*.jpg';'*.bmp';'*.gif';'*.png';'*.tif'});
if FileName==0
    return;
else
    h=getframe(handles.axes2);
    imwrite(h.cdata,[PathName,FileName]);
end;

% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname] = uigetfile({'*.*';'*.jpg';'*.bmp';'*.gif';'*.png';'*.tif'});
im = imread([pathname,filename]);

axes(handles.axes1)
imshow(im)

axes(handles.axes2)
imshow(im)            %����ͼƬ

handles.end=im;
guidata(hObject,handles);

global x ;
x=[pathname,filename];


% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes1,'reset');
cla(handles.axes2,'reset'); %���ͼƬ


% --------------------------------------------------------------------
function Untitled_5_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x
im=imread(x);

axes(handles.axes1)
imshow(im)
axes(handles.axes2)
imshow(im) %����ͼƬ����


% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit1,'visible','on');




function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(hObject, 'String');
num = str2double(str);
%���ȵ���
[m,n,~]=size(handles.end);%��ȡͼƬ��С
hsv=rgb2hsv(handles.end);%��ɫ�ռ�ת��
for i=1:m%����ÿһ�����ص�
    for j=1:n 
        hsv(i,j,3)=num*hsv(i,j,3);%1.5Ϊ��Ҫ���ӵı���
    end
end
im=hsv2rgb(hsv);%תΪRGB������ʾ
axes(handles.axes2)
imshow(im)
set(handles.edit1,'visible','off')
handles.end=im;%��ͼƬ����handles��
guidata(hObject,handles);%��������



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


% --------------------------------------------------------------------
function Untitled_7_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% ͼƬ��ת
set(handles.edit2,'visible','on')



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(hObject, 'String');
y = str2double(str);
%��תͼƬ
T=imrotate(handles.end,y);
axes(handles.axes2);
imshow(T)
set(handles.edit2,'visible','off')
handles.end=T;
guidata(hObject,handles);

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


% --------------------------------------------------------------------
function Untitled_8_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x;
a=imread(x);%����ԭͼ��ɫͼ��
b=rgb2gray(a);%ת���ɻҶ�ͼ��
c=handles.end;%���봦����ͼƬ��ɫͼ��
d=rgb2gray(c);%ת���ɻҶ�ͼ��

figure(1)
%��ʾԭͼ�Լ�ԭͼ�ĻҶ�ͼ����ֱ��ͼ
subplot(2,3,1);imshow(a);
subplot(2,3,2);imshow(b);
subplot(2,3,3);imhist(b);
%��ʾ������ͼƬ����Ҷ�ͼ����ֱ��ͼ
subplot(2,3,4);imshow(c);
subplot(2,3,5);imshow(d);
subplot(2,3,6);imhist(d);


% --------------------------------------------------------------------
function Untitled_9_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit3,'visible','on')
%��ӽ�������


function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

str = get(hObject, 'String');
num = str2double(str);
im=imnoise(handles.end,'salt & pepper',num); %���뽷������
axes(handles.axes2)
imshow(im)
set(handles.edit3,'visible','off')
handles.end=im;
guidata(hObject,handles)
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


% --------------------------------------------------------------------
function Untitled_10_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%��ֵ�˲�����
kernel_size = [4 4];
img_cpy = handles.end(:, :, :);
img_cpy(:, :, 1)=medfilt2(handles.end(:,:,1),kernel_size); 
img_cpy(:, :, 2)=medfilt2(handles.end(:,:,2),kernel_size); 
img_cpy(:, :, 3)=medfilt2(handles.end(:,:,3),kernel_size);
axes(handles.axes2);
imshow(img_cpy);
handles.end=img_cpy;
guidata(hObject,handles)


% --------------------------------------------------------------------
function Untitled_11_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%�����˳�����
clc;
close all;
close(gcf);
clear;
