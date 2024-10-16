% % Load data
% %load(dataFilePath, 'ScopeData');
% t = Input.time;
% sigs = Input.signals.values;
T = 10;
f =0.4;
fs= 50;
t = 0:1/fs:T;




u = square(2*pi*f*t);
% % Extract signals
% utrend = sigs(:,1); % Input_Signal
% thetae = sigs(:,2); % Potentiometer_Signal
% alpha = sigs(:,3);  % Strain_Gauge_Signal



% % Constants for signal transformation
% Kp = 35.3218;
% Ke = 1; %------------------ % Could be changed 
% ytrend = thetae * Kp + alpha * Ke;


% u = detrend(utrend);  % Corrected from dtrend to detrend


plot(t,u); 


