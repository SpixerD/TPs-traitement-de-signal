clear 
close all
clc

%% Représentation temporelle et fréquentielle

fe = 10000;      % Frequence d'echatillonage
Te = 1/fe;       % Periode d'echantillonage
N = 5000;        % Nombre d'echantillons

t = 0: Te: (N -1)*Te;     % Variable du temps avec un pas de Te et de longueur de sorte a ce que la variable t ait 5000 echantillons 
x = 1.2*cos(2*pi*440*t + 1.2) + 3*cos(2*pi*550*t) + 0.6*cos(2*pi*2500*t);    % Fonction du signal x(t)
 
%% 1- plot de la fonction x

%  plot(t,x)
%  title('Plot du signal x(t)')        
%  xlabel('Time')
%  ylabel('Amplitude')


f = (0:N-1)*(fe/N);   % Vecteur correspondant à l'échantillonnage du signal dans l'espace fréquentiel avec 5000 echantillons et frequence de 0 a 9998    
y= fft(x);   % Application de la transforme de fourier rapide

%% 2- plot du spectre d'amplitude de x

% plot(f,abs(y))
% title("Plot du spectre d'amplitude de x(t) par la fft")
% xlabel("Frequence")
% ylabel("Amplitude")

fshift = (-N/2:N/2-1) * (fe/N);   % Vecteur de frequence pour fftshift

%% 3- plot de la fft avec decalage

% plot(fshift,fftshift(abs(y)));   
% title("Transformé de fourier en amplitude avec decalage de la donction fftshift")
% xlabel("Frequence")
% ylabel("Amplitude")


xnoise = x + 2*randn(size(x));   % On introduit un bruit gaussien 2*randn

%% 4- plot du signal avec bruit

% plot(t,xnoise);
% title("Visualisation de xnoise")
% xlabel(pl3,"Frequence")
% ylabel(pl3,"Amplitude")

%% 5- difference entre x et xbruit

% sound(x);
                %On peut clairement remarque l'introduction du bruit    
% sound(xnoise);


ynoise = abs(fft(xnoise)); % Calcul de la transforme de fourier du signal bruite en amplitude

%% 6- plot du spectre d'amplitude du signal avec bruit

% plot(fshift,fftshift(ynoise)) % Visualisation du signal bruit avec decalage centre sur 0
% On remargue que le bruit est encore discernable de l'information

xnoise2 = x + 20*randn(size(x)); % On introduit un bruit gaussien 20*randn
ynoise2 = abs(fft(xnoise2)); % On recalcule fft amplitude avec un bruit plus important

%% 7- plot du spectre d'amplitude du signal avec un bruit important

% plot(fshift,fftshift(ynoise2)) % Visualisation du signal avec un bruit important
% On remargue que l'infomation commence a etre confondu avec le bruit

%% Analyse fréquentielle du chant du rorqual bleu


% 1- chargement du signal

% [x,fs]= audioread('bluewhale.au');%charger et lire le fichier %bluewhale.au%

%% 2- ecout et visualisation du signal

% sound(x,fs);    

x = x.';
Te=1/fs;
N=length(x);
t = 0:Te:(N-1)*Te;

% plot(t,x);
% title('signal de blue ');

%% 3- tracage la densité spectrale
 xx= x(2.45e4:3.10e4);        %Le son à récupérer correspond aux indicesallant de 2.45e4 à 3.10e4.
 sound(xx,4000)               %ecouter le chant du rorqual blue
 figure(1);                   
 N=length(xx);                
 y=abs(fft(xx)).^2/N;
 fshift=(-N/2: N/2-1)*(fs/N)/10;
 plot(fshift,fftshift(y));

%% 4- a fréquence fondamentale du gémissement de rorqual bleu







