filename = 'single_collumn.txt';
fid = fopen(filename, 'r');


x = (2049960);

[date, time, voltage] = textread(filename, '%s %s %s', x);
% Need to parse 2049960 lines
fclose(fid);

new_volt = split(voltage, 'E');

array_time = 0.000004*(0:2049959);
array_voltage = str2double([new_volt(1:x)]);

%UNCOMMENT FOR THE TIMESERIES

% Define Time Series Variables
Fs = 250000; % Sampling Frequency
Ts = 1/250000; % Sample Period
t_env = 0:Ts:2049960/Fs-Ts; % Define the time values for the 8.2s time interval
% Create the time series using the voltage array data and their respective time values
ts = timeseries(array_voltage, t_env);
save('frequency_modulated_input', 'ts', '-v7.3'); % Save the timeseries as a .mat file

% x = [t_env_single,array_voltage_single];
t = 0.000004*(0:2049959);



%ts_single = timeseries(array_voltage_single, t_env_single);

plot(array_time, array_voltage);
xlim([0 8.20]);
xlabel('Time [s]'); 
ylabel('Signal Voltage [V e+0]');
