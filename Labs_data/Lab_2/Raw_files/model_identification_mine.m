
% Load data
%load(dataFilePath, 'ScopeData');
t = ScopeData.time;
sigs = ScopeData.signals.values;

% Extract signals
utrend = sigs(:,1); % Input_Signal
thetae = sigs(:,2); % Potentiometer_Signal
alpha = sigs(:,3);  % Strain_Gauge_Signal

% Constants for signal transformation
Kp = 35.3218;
Ke = -2.87; %------------------ % Could be changed 
ytrend = thetae * Kp + alpha * Ke;

% High-pass filter setup
af = 0.8;
Afilt = [1, -af];
Bfilt = (1-af) * [1, -1];

% Filtering and detrending
yf = filter(Bfilt, Afilt, ytrend);
u = detrend(utrend);  % Corrected from dtrend to detrend

% Prepare data for ARMAX modeling ( The number as stated in the pdf) 
z = [yf, u];
na = 3; % AR part
nc = na; % MA part
nb = 2; % X part
nk = 1; % pure delay
nn = [na, nb, nc, nk];

% ARMAX model estimation
th = armax(z, nn);

% Extract polynomial data and simulate response
[den1, num1] = polydata(th);
yfsim = filter(num1, den1, u);

% Plotting the comparison
figure(1); clf;
plot(t, yf, '-r', t, yfsim, '--g');
xlabel('Time [s]');
ylabel('Output');
legend('Filtered Data', 'Model Simulation');
title('Comparison of Filtered Data and ARMAX Model Simulation');

% Calculate error
error = sqrt(mean((yfsim - yf).^2));
disp(['Root Mean Square Error: ', num2str(error)]);

% Convert to state-space model
[num, den] = eqtflength(num1, conv(den1, [1, -1]));
[A, B, C, D] = tf2ss(num, den);

% % Optionally save the model parameters
% save('model_params.mat', 'A', 'B', 'C', 'D');
