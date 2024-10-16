%% Load data
clear; clc; close all
load ModelIdentificationDataFinal/prbs.mat
kp = 35.3218;
kb = 1.51;
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


%Delete first 10 sec

fs=50;
y(1:10*fs)=[];
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
yfsim1=filter(num1, den1,u); %use different u to compare

figure(2)
plot(t,yf)
hold on
plot(t,yfsim1,Color="r")
legend('Data', 'Model');
xlabel('Time (s)');
ylabel('Voltage(V)');
title('yf and yfsim comparison');



poles1=roots(den1);
zeros1=roots(num1);

%Build pole-zero diagram
figure(3)
zplane(num1,den1) 

%% Bode Plot and time response 

Ts = 0.002;
sys1 = tf(num1, den1, Ts); 

figure(4)
bode(sys1);
grid on; 
title('Bode Plots')


figure(5)
subplot(1,2,1);
step(sys1);
title('Step Response');
grid on; 

subplot(1,2,2);
impulse(sys1);
title('Impulse Response');
grid on; 


%% Add integrator --> STATE-SPACE

[num, den] = eqtflength(num1, conv(den1, [1 -1]));
figure;
zplane(num,den) 

poles=roots(den)
zeros=roots(num)

[A, B, C, D]= tf2ss(num,den);

save('model_params.mat', 'A', 'B', 'C', 'D','num','kp','den','kb');
[~,fit]=compare(z,th)



%% Final validation
y_dlsim= dlsim(A,B,C,D,u);



figure;
plot(t,y)
hold on
plot(t,y_dlsim,Color="r")
legend('y', 'ydlsim');
xlabel('Time (s)');
ylabel('Voltage(V)');
title('yf and y_dlsim comparison');

%% comparison 
load ModelIdentificationDataFinal/amp1_5data_squarewave06Hz.mat



kp = 35.3218;
kb = 1.4;
t2 = Input.time;
sigs2 = Input.signals.values;
utrend2 = sigs2(:,1); % input
thetae2 = sigs2(:,2); % Potentiometer_Signal
alpha2 = sigs2(:,3);  % Strain_Gauge_Signal


ytrend2 = kp * thetae2 + kb * alpha2;


u2=detrend(utrend2);
y2=detrend(ytrend2);



%% Filtering new data

af=0.8;

Afilt= [1 -af];
Bfilt= (1-af)*[1 -1];

yf2=filter(Bfilt,Afilt,y2);

u2=detrend(utrend2);


yfsim2=filter(num1, den1,u2);


z2= [yf2 u2];

fs=50;
yfsim2(1:10*fs)=[];
yf2(1:10*fs)=[];
u2(1:10*fs)=[];
t2(1:10*fs)=[];


figure;
plot(t2,yf2)
hold on
plot(t2,yfsim2,Color="r")
legend('Data', 'Model');
xlabel('Time (s)');
ylabel('Voltage(V)');
title('yf2 and yfsim2 comparison');

[~,fit2]=compare(z2,th)






