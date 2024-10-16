clc 
clear all


% Load the MATLAB file containing the full rotation data
data = load('potdata1.mat'); % Adjust as necessary to point to the correct file

% Extract the voltage readings corresponding to a full circle
voltages_full_circle = data.potinputfull.signals.values;

% Identify the minimum, maximum, and a midpoint voltage
min_voltage = min(voltages_full_circle);
max_voltage = max(voltages_full_circle);
mid_voltage = (min_voltage + max_voltage) / 2;

% Corresponding angles for min, mid, and max voltages
angles = [0, 180, 360];  % 0 for min, 180 for mid, 360 for max

% Calculating K_p using these points
voltages = [min_voltage, mid_voltage, max_voltage];
p = polyfit(voltages, angles, 1);

% Output the slope K_p
K_p = p(1);
fprintf('The refined K_p is: %.2f degrees/Volt based on selected points\n', K_p);

% Generating fitted line data
fitted_x = linspace(min_voltage, max_voltage, 100); % Evenly spaced voltage values for the fit line
fitted_y = polyval(p, fitted_x);  % Apply the polynomial fit to get the corresponding angles

% Plotting the data and the fitted line
figure;
scatter(voltages, angles, 100, 'filled', 'DisplayName', 'Selected Calibration Points'); % Scatter plot of the selected data points
hold on;
plot(fitted_x, fitted_y, 'r-', 'LineWidth', 2, 'DisplayName', 'Linear Fit'); % Fitted line based on selected points
xlabel('Voltage (V)');
ylabel('Angle (degrees)');
title(sprintf('Calibration of Potentiometer (K_p = %.2f deg/V)', K_p));
legend('show');
grid on;
