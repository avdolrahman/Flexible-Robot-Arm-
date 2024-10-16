% % Load data
% %load(dataFilePath, 'ScopeData');
% t = Input.time;
% sigs = Input.signals.values;
T = 60;
%f =0.4;
f = 0.6;
fs= 50;
t = 0:1/fs:T;




%u = square(2*pi*f*t);
%u = idinput(length(t), 'RBS' , [0.002 0.02]*f,[-1 1]);
u = idinput(length(t), 'RBS' , [0.002 0.02]*f,[-0.75 0.75]);








plot(t,u); 


%%
kp = 35.3218;
kb = 1;
t = Input.time;
sigs = Input.signals.values;
utrend = sigs(:,1); % input
thetae = sigs(:,2); % Potentiometer_Signal
alpha = sigs(:,3);  % Strain_Gauge_Signal


ytrend = kp * alpha + kb * thetae;


plot(t,utrend, 'b', t,thetae,'r', t,alpha, 'g');

% figure(2)
% hold on; 
% grid on; 
% plot(t,thetae, 'r' );
% plot(t,y, 'g' );
% % legend('y', 'Model Simulation');
% plot(t,utrend, 'b' );
% % plot(t,alpha);
