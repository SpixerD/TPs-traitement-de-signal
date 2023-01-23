clear ;
close all;
clc;

%% Jeux de mots 

% question 1

[xmono,fs] = audioread('audio.wav'); %chargement du fichier 

Te = 1/fs;
x = ones(length(xmono):1);
x = xmono(:,1);
N = length(x);
t = 0:Te:(N-1)*Te;

% question 2

%  plot(t,x) ; % plot du fichier en fonction du temps
%  sound(x,fs); 

% question 3

% sound(x,2*fs);  % compresion du spectre initial
% sound(x,fs/2); % dilatation du spectre initial

% question 4

% plot(x(1:N/2));  % plot                  

% question 5

Riennesertde = x(1:120000);  %vecteur contenant les 135000 premiers valeurs de x
%  sound(Riennesertde,fs); % 
 
%question 6

 courir = x(120000:185000);    %indice correspond au courir
%  sound(courir,fs);     % pour ecouter courir

 ilfaut=x(175000:207000);   %indice correspond au il faut
% sound(ilfaut,fs);     % pour ecouter il faut

partirapoint=x(200000:290000);   %indice correspond au partir a point
% sound(partirapoint,fs);   % pour ecouter partir a


% question 7

  Riennesertdepartirapointilfautcourir=[Riennesertde ; partirapoint ; ilfaut ; courir ];
   sound(Riennesertdepartirapointilfautcourir,fs);

 
%% exercice 2

% question 1

fe = 8192;
Te = 1/fe;
t = 0 : Te : 1;
 
DO1=262;
RE=294;
ME=330;
Fa=349;
SOL =392;
La=440;
Si=494;
DO2=523;


x1=sin(2*pi*DO1*t);
x2=sin(2*pi*RE*t);
x3=sin(2*pi*ME*t);
x4=sin(2*pi*Fa*t);
x5=sin(2*pi*SOL*t);
x6=sin(2*pi*La*t);
x7=sin(2*pi*Si*t);
x8=sin(2*pi*DO2*t);

x = [x1 x2 x3 x4 x5 x6 x7 x8];

% sound(x ,fe);

% question 2: On analyse le signal avec signalAnalyzer

% question 3

% s = spectrogram(x);

% plot(x);


% question 4

N = length(x);
f=(0:N-1)*(fe/N);
A=fft(x);
% plot(f,abs(A));

N=length(x);
fshift = (-N/2:N/2-1)*(fe/N);
y=abs(fft(x));
% plot(fshift,fftshift(mag2db(y)))