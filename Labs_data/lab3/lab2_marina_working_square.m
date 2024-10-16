%% Load data
clear; clc; close all
load Lab3newdata/amp1_5data_squarewave06Hz.mat
kp = 35.3218;
kb = 1.4;
t = Input.time;
sigs = Input.signals.values;
utrend = sigs(:,1); % input
thetae = sigs(:,2); % Potentiometer_Signal
alpha = sigs(:,3);  % Strain_Gauge_Signal


ytrend = kp * thetae + kb * alpha;


u=detrend(utrend);
y=detrend(ytrend);
%% Filtering data

af=0.8;

Afilt= [1 -af];
Bfilt= (1-af)*[1 -1];

yf=filter(Bfilt,Afilt,y);

% Afilt= 1;
% Bfilt= [1 -1];
% 
% yf1=filter(Bfilt,Afilt,ytrend);

%Delete first 10 sec

fs=50;
yf(1:10*fs)=[];
u(1:10*fs)=[];
t(1:10*fs)=[];

% figure(1)
% plot(t,yf)
% hold on
% plot(t,yf1)


%% Identification 

%ARMAX

z= [yf u];
na = 3; %AR part
nb= 2; %X part
nc=na; %MA part
nk=1; %pure delay

nn=[na nb nc nk];
th=armax(z, nn) 

% check results


[den1, num1]= polydata(th);
yfsim=filter(num1, den1,u); %use different u

figure(2)
plot(t,yf)
hold on
plot(t,yfsim,Color="r")
legend('yf', 'yfsim');


%Build pole-zero diagram
figure(3)
zplane(num1,den1) %not working idk why




%Add integrator

[num, den] = eqtflength(num1, conv(den1, [1 -1]));


poles=roots(den)
zeros=roots(num)

[A, B, C, D]= tf2ss(num,den);

[~,fit]=compare(z,th)