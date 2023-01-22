clear all
close all 
clc

% 1-

load('ecg.mat')  % On charge le fichier ecg
Fe=500;  % Frequence d'echantillonage
Te=1/Fe;
N=length(ecg);

t = 0:Te:(N-1)*Te;  % Vecteur de l'axe temporel

% 2-

% plot(t,ecg)  % On plot le signal par rapport au temps 
% grid on
% title(" représentation graphique de l’activation électrique du cœur")
% xlabel("t")
% ylabel("ECG")
% xlim([0.5 1.5]);

% -3

f=(0:N-1)*(Fe/N);  % Vecteur de l'espace frequentiel
y = fft(ecg);  % Calcul de la fft de ecg

% plot(f,fftshift(abs(y)));

% grid on
% title(" représentation graphique de la transformée de fourier du signal ECG")
% xlabel("f")
% ylabel("Tfd")

% conception du filtre

pass_haut=ones(size(ecg));
fc=0.5;
index_fc= ceil((fc*N)/Fe);
pass_haut(1:index_fc)= 0;
pass_haut(N-index_fc+1:N) = 0;

% plot(f,pass_haut);

% Filtrage

ecg1_freq = pass_haut.*y; 
ecg1 = ifft(ecg1_freq,"symmetric");

% 4-

% plot(t,ecg1) % signal apres filtrage 
% hold on
% plot(t,ecg+3) % signal d'origine
% hold on 
% plot(t,ecg-ecg1+1.5) % difference entre les deux signaux

% 5-

pass_notch=ones(size(ecg));
fc2=50;
index_fc2= ceil((fc2*N)/Fe)+1;
pass_notch(index_fc2)= 0;
pass_notch(N-index_fc2+1) = 0;

% 6- 

ecg2_freq = pass_notch.*fft(ecg1); 
ecg2 = ifft(ecg2_freq,"symmetric");

% subplot(311)
% plot(t,ecg1) % signal d'origine
% subplot(312)
% plot(t,ecg1-ecg2) % difference entre les deux signaux
% subplot(313)
% plot(t,ecg2) % signal apres filtrage 


% Filtrage pass_bas 

pass_bas=zeros(size(ecg));
fc3 = 35;
index_fc3 = ceil((fc3*N)/Fe);   
pass_bas(1:index_fc3)= 1;
pass_bas(N-index_fc3+1:N) = 1;


%% Filtrage 2 

ecg3_freq = pass_bas.*fft(ecg2); 
ecg3 = ifft(ecg3_freq,"symmetric");

% subplot(311) 
% plot(t,ecg2) % signal d'origine
% subplot(312)
% plot(t,ecg3) % signal apres filtrage 
% subplot(313)
% plot(t,ecg2-ecg3) % difference entre les deux signaux

% 8- On peut identifier approximativement chacune des ondes 

% plot(t,ecg3);
% xlim([5 6]);

% 9-

 [c,lags] = xcorr(ecg3,ecg);
%  stem(lags/Fe,c)

% 10- On trouve la correlation au niveau de x = 0

