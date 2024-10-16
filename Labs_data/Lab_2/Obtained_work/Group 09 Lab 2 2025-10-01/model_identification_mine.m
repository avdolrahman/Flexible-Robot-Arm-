% Load data
%load(dataFilePath, 'ScopeData'); 

% You will need to open data_squarewave_0.4hz.mat
t = Input.time;
sigs = Input.signals.values;

% Extract signals
utrend = sigs(:,1); % Input_Signal
thetae = sigs(:,2); % Potentiometer_Signal
alpha = sigs(:,3);  % Strain_Gauge_Signal

% Constants for signal transformation
Kp = 35.3218;
Ke = -1.34; % Could be changed 
ytrend = thetae * Kp + alpha * Ke;

% High-pass filter setup
af = 0.8;
Afilt = [1, -af];
Bfilt = (1-af) * [1, -1];

% Filtering and detrending
yf = filter(Bfilt, Afilt, ytrend);
u = detrend(utrend);  % Corrected from dtrend to detrend

% Prepare data for ARMAX modeling
z = [yf, u];
na = 4; % AR part (number of expected poles)
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
xlabel('Time [Seconds]');
ylabel('Deflection [Degree]');
legend('Filtered Data', 'Model Simulation');
title('Comparison of Filtered Data and ARMAX Model Simulation');

% Calculate error
error = sqrt(mean((yfsim - yf).^2));
disp(['Root Mean Square Error: ', num2str(error)]);

% Convert to state-space model
[num, den] = eqtflength(num1, conv(den1, [1, -1]));
[A, B, C, D] = tf2ss(num, den);

% Optionally save the model parameters
save('model_params.mat', 'A', 'B', 'C', 'D');

% Model Identification (Computations)

% Plotting Parameters
plot_plant_data = true;
plot_comparison_data = true;
plot_pole_zero = true;
plot_visibility = 'on';

% Getting the input amplitude and frequency from the filename
amp = 2; % Example amplitude, adjust as needed
freq = 0.4; % Example frequency, adjust as needed
wave = 'square'; % Example waveform, adjust as needed

% Removing the first 5 seconds from the data (using array masking)
time_array = t(t >= 0);
signal_array = sigs(t >= 0, :);

% Signal Data
utrend = signal_array(:, 1); % Motor Excitation Signals
thetae = signal_array(:, 2); % Potentiometer Signals
alphae = signal_array(:, 3); % Strain Gage Signals

kp = 35.3218;
kb = -1.34; % Could be changed 

% Estimating bar tip position
ytrend = kp * thetae + kb * alphae;

% Plot the u, y, and alpha
if plot_plant_data
    fig = figure();

    subplot(3, 1, 1)
    plot(time_array, utrend)
    xlabel('Time [secs]')
    ylabel('u [V]')

    subplot(3, 1, 2)
    plot(time_array, thetae)
    xlabel('Time [secs]')
    ylabel('theta_e [V]')

    subplot(3, 1, 3)
    plot(time_array, alphae)
    xlabel('Time [secs]')
    ylabel('alpha [V]')

    sgtitle(sprintf('Amp = %.2fV Freq = %.2fHz %s Wave', amp, freq, wave))
    savefig(['ModelIdentificationPlots\diffrent_data_plots\a' num2str(amp) '_f' num2str(freq) '_wave_' wave '.fig'])
    set(fig, 'visible', plot_visibility);
end
