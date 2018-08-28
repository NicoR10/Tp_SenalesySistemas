function varargout = TRGui(varargin)
% TRGUI MATLAB code for TRGui.fig
%      TRGUI, by itself, creates a new TRGUI or raises the existing
%      singleton*.
%
%      H = TRGUI returns the handle to a new TRGUI or the handle to
%      the existing singleton*.
%
%      TRGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRGUI.M with the given input arguments.
%
%      TRGUI('Property','Value',...) creates a new TRGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TRGui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TRGui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TRGui

% Last Modified by GUIDE v2.5 06-Dec-2016 00:50:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TRGui_OpeningFcn, ...
                   'gui_OutputFcn',  @TRGui_OutputFcn, ...
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


% --- Executes just before TRGui is made visible.
function TRGui_OpeningFcn(hObject, eventdata, handles, varargin)
set(handles.text2,'String','')
set(handles.Grafcorte,'Visible','off')
set(handles.Grafico,'Visible','off')
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TRGui (see VARARGIN)

% Choose default command line output for TRGui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TRGui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TRGui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in Escuchar.
function Escuchar_Callback(hObject, eventdata, handles)

if get(handles.impulso,'Value') == 1
global impcort
global Fs
sound(impcort,Fs)
end

if get(handles.Ruidoint,'Value') == 1
    global ruicort
    global Fs
    sound(ruicort,Fs)
end


% hObject    handle to Escuchar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in CalcularTR.
function CalcularTR_Callback(hObject, eventdata, handles)
global impcort;
global ruicort;
%% filtrado
if get(handles.impulso,'Value') == 1
[yf1,yf2,yf3,yf4,yf5,yf6,yf7,yf8,yf9] = foctava (impcort);
end
if get(handles.Ruidoint,'Value') == 1
[yf1,yf2,yf3,yf4,yf5,yf6,yf7,yf8,yf9] = foctava (ruicort);
end
%% integral de schroeder
global Sdb6
[Sdb1,Sdb2,Sdb3,Sdb4,Sdb5,Sdb6,Sdb7,Sdb8,Sdb9] = Schroeder (yf1,yf2,yf3,yf4,yf5,yf6,yf7,yf8,yf9);

%% Hilbert suavizado con promedio movil
global Hfdb6
[Hfdb1,Hfdb2,Hfdb3,Hfdb4,Hfdb5,Hfdb6,Hfdb7,Hfdb8,Hfdb9] = HilbertSuav (yf1,yf2,yf3,yf4,yf5,yf6,yf7,yf8,yf9);

%% Cuadrados minimos (rectas)
global a6
global d36
[a1,b11,c21,d31] = cuadminTR(Sdb1);
[a2,b12,c22,d32] = cuadminTR(Sdb2);
[a3,b13,c23,d33] = cuadminTR(Sdb3);
[a4,b14,c24,d34] = cuadminTR(Sdb4);
[a5,b15,c25,d35] = cuadminTR(Sdb5);
[a6,b16,c26,d36] = cuadminTR(Sdb6);
[a7,b17,c27,d37] = cuadminTR(Sdb7);
[a8,b18,c28,d38] = cuadminTR(Sdb8);
[a9,b19,c29,d39] = cuadminTR(Sdb9);

%% calculo de TR para cada recta
%T30
[TR31] = tiempo30 (d31)
[TR32] = tiempo30 (d32)
[TR33] = tiempo30 (d33)
[TR34] = tiempo30 (d34)
[TR35] = tiempo30 (d35)
[TR36] = tiempo30 (d36)
[TR37] = tiempo30 (d37)
[TR38] = tiempo30 (d38)
[TR39] = tiempo30 (d39)

global T30
T30 = {TR32,TR33,TR34,TR35,TR36,TR37,TR38,TR39};

%%T20
[TR21] = tiempo20(c21)
[TR22] = tiempo20(c22)
[TR23] = tiempo20(c23)
[TR24] = tiempo20(c24)
[TR25] = tiempo20(c25)
[TR26] = tiempo20(c26)
[TR27] = tiempo20(c27)
[TR28] = tiempo20(c28)
[TR29] = tiempo20(c29)

global T20
T20 = {TR22,TR23,TR24,TR25,TR26,TR27,TR28,TR29};

%T10
[TR11] = tiempo10(b11)
[TR12] = tiempo10(b12)
[TR13] = tiempo10(b13)
[TR14] = tiempo10(b14)
[TR15] = tiempo10(b15)
[TR16] = tiempo10(b16)
[TR17] = tiempo10(b17)
[TR18] = tiempo10(b18)
[TR19] = tiempo10(b19)

global T10
T10 = {TR12,TR13,TR14,TR15,TR16,TR17,TR18,TR19};

%EDT
[EDT1] = tiempoEDT(a1)
[EDT2] = tiempoEDT(a2)
[EDT3] = tiempoEDT(a3)
[EDT4] = tiempoEDT(a4)
[EDT5] = tiempoEDT(a5)
[EDT6] = tiempoEDT(a6)
[EDT7] = tiempoEDT(a7)
[EDT8] = tiempoEDT(a8)
[EDT9] = tiempoEDT(a9)

global EDT
EDT = {EDT2,EDT3,EDT4,EDT5,EDT6,EDT7,EDT8,EDT9};
global dat
dat = [EDT;T10;T20;T30];
set(handles.tabla,'data',dat)
%% PLOTEO
global Fs
set(handles.Grafico,'Visible','on')
axes (handles.Grafico)
seg= (1:length(Sdb6))/Fs;
plot(seg,Sdb6,'b','LineWidth',2)
hold on
plot(seg,Hfdb6,'r','LineWidth',2)
hold on
plot(seg,a6,'k','LineWidth',1)
hold on
plot(seg,d36,'g','LineWidth',1.5)
hold on
set(handles.Grafico,'FontSize',8)
ylim([-80 0])
xlabel('Segundos','FontSize',8)
ylabel('dBfs')
legend('Int. Schroeder','Curva de decaimiento (Hilbert)','Regresión EDT','Regresión T30')
% hObject    handle to CalcularTR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Cargar.
function Cargar_Callback(hObject, eventdata, handles)
[nombre, ruta] = uigetfile('*.wav', 'Archivo de audio');
if isequal(nombre,0)
    return
end
global Fs
file = strcat(ruta, nombre);
[y, Fs] = audioread(file);
set(handles.text2,'String',nombre)
set(handles.Grafcorte,'Visible','on')

if get(handles.impulso,'Value') == 1
    global impcort
    impcort = corteimp (y);
    axes (handles.Grafcorte)
    c=(1:length(impcort))/Fs;
    plot(c,impcort)
    set(handles.Grafcorte,'FontSize',7)
end
if get(handles.Ruidoint,'Value') == 1
    global ruicort
    ruicort = corterui (y);
    axes (handles.Grafcorte)
    d=(1:length(ruicort))/Fs;
    plot(d,ruicort)
    set(handles.Grafcorte,'FontSize',7)
end
  
  
    
   
% hObject    handle to Cargar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Ruidoint.
function Ruidoint_Callback(hObject, eventdata, handles)
set(handles.impulso,'Value',0)
% hObject    handle to Ruidoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Ruidoint


% --- Executes on button press in impulso.
function impulso_Callback(hObject, eventdata, handles)
set(handles.Ruidoint,'Value',0)
% hObject    handle to impulso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of impulso


% --- Executes when figure1 is resized.
function figure1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
