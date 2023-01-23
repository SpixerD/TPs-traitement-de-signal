close all
clear  
clc

% Partie 1

% 1-

% On prend differentes frequences

f1 = 50;
f2 = 100;
f3 = 200;

Te = 0.0005;  % On prend Te egal a 0.0001 au debut puis 0.0005. On remarque que pour 0.0001, le signal est plus lisse/regulier.
t = 0:Te:5-Te;

x = sin(2*pi*500*t) + sin(2*pi*400*t) + sin(2*pi*50*t);
    
Fe = 1 / Te;
N = length(t);
f = (0:N-1)*(Fe/N);
fshift = (-N/2 : (N-1)/2) * (Fe/N);
y = fft(x);

% -2 On remarque les 3 frequences que nous avons specifies

% subplot(3,1,1)
% plot(t,x);
% xlim([2.9 3])
% subplot(3,1,2)
% plot(f , abs(y));
% subplot(3,1,3)
% plot(fshift,fftshift(abs(y)));

%%           Transmitance complexe

K = 1;

W = 2*pi*f;  
Wc1 = 50;
Wc2 = 100;
Wc3 = 200;

H1 = ((K*1j*(W/Wc1)) ./ (1+1j*(W/Wc1))); 
H2 = ((K*1j*(W/Wc2)) ./ (1+1j*(W/Wc2))); 
H3 = ((K*1j*(W/Wc3)) ./ (1+1j*(W/Wc3))); 

% semilogx(f,abs(H1));

angle1 = angle(H1);
angle2 = angle(H2);
angle3 = angle(H3);

G1 = 20*log(abs(H1));
G2 = 20*log(abs(H2));
G3 = 20*log(abs(H3));

% On plot en utilisant la fonction semilogx() pour voir la partie basse frequence qui est annulee.

% 1- 2- 3- (le changement de fc deplace le diagramme de bode dur l'axe des frequences.)

%  grid on
%  subplot(2,2,1);
%  semilogx(f,G1,f,G2,f,G3);
%  subplot(2,2,2);
%  semilogx(f,angle1,f,angle2,f,angle3);
%  subplot(2,2,3);
%  semilogx(f,abs(H1),f,abs(H2),f,abs(H3));

%On code les filtres effectives:

Hpass=[H1(1:floor(N/2)),flip(H1(1:floor(N/2)))];

% On applique le filtre 

 Filtre1=y.*Hpass;


% On retourne a la fonction dans le domaine temporrelle

 x1=ifft(Filtre1,"symmetric");

%  plot(t,x1);
%  xlim([0,0.15])



%%  Deuxieme partie du TP
clear
clc


% Nous allons essayer d'appliquer un filtre pass bas de premier degres

 [x,fe]=audioread("test.wav");
 
 x = x.';

 Te=1/fe;
 N=length(x);
 
 t = 0:Te:(N-1)*Te;



%   plot(t,x)

  %On pose la fonction de filtrage:

  f = (0:N-1)* (fe/N);

  y = fft(x);
 
  fshift = (-N/2 : N/2-1) * (fe/N);

%    plot(fshift,fftshift(abs(y)));

  % On prend une frequence de coupure 4000

  fc = 1000;
  k = 4;

  H = k ./ (1+(1j*f/fc));

%   semilogx(f,20*log(H));
%   semilogx(f,angle(H));

  Hpass=[H(1:floor(N/2)+1),flip(H(1:floor(N/2)))];

  Filtre = y.*Hpass;
  Filtre_t = ifft(Filtre,"symmetric");

%   plot(fshift,fftshift(2*abs(fft(Filtre_t)/N)));

%   audiowrite ("filtre.wav",Filtre_t,fe);





