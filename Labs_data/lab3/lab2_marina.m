%% Load data
clear; clc; close all
load Lab3newdata/prbs.mat
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

af=0.8; %if increase worst pq no aproxima igual de bien y si baja tbn mal pq los polos desaparecen, hay que encontrar termino medio

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
yfsim1=filter(num1, den1,u); %use different u

figure(2)
plot(t,yf)
hold on
plot(t,yfsim1,Color="r")
legend('yf', 'yfsim');


%Build pole-zero diagram
figure(3)
zplane(num1,den1) 



%Add integrator

[num, den] = eqtflength(num1, conv(den1, [1 -1]));


poles=roots(den)
zeros=roots(num)

[A, B, C, D]= tf2ss(num,den);

[~,fit]=compare(z,th)

%% comparison 
load Lab3newdata/amp1_5data_squarewave06Hz.mat

%[~,fit]=compare(z,th)

kp = 35.3218;
kb = 1.4;
t = Input.time;
sigs2 = Input.signals.values;
utrend2 = sigs2(:,1); % input
thetae2 = sigs2(:,2); % Potentiometer_Signal
alpha2 = sigs2(:,3);  % Strain_Gauge_Signal


ytrend2 = kp * thetae2 + kb * alpha2;


u2=detrend(utrend2);
y2=detrend(ytrend2);
%% Filtering data


af=0.8;

Afilt= [1 -af];
Bfilt= (1-af)*[1 -1];

yf2=filter(Bfilt,Afilt,y2);

u2=detrend(utrend2);


yfsim2=filter(num1, den1,u2);


z2= [yf2 u2];



figure(4)
plot(t,yf2)
hold on
plot(t,yfsim2,Color="r")
legend('yf2', 'yfsim2');

[~,fit2]=compare(z2,th)