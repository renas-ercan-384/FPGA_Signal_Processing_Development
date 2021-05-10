filename = 'single_collumn.txt';
fid = fopen(filename, 'r');

x = (2049960);

[date, time, voltage] = textread(filename, '%s %s %s', x);
% Need to parse 2049960 lines
fclose(fid);

new_volt = split(voltage, 'E');
%new_time = split(time, ':')


%array_time = str2double([new_time(((x*2)+1):x*3)]);
array_time = 0.000001*(0:2049959);
array_voltage = str2double([new_volt(1:x)]);

%plot(array_time, array_voltage);
%xlim([0 2.05]);
%xlabel('Time [s]'); 
%ylabel('Signal Voltage [V e+0]');

% Plot the FFT
Fs = 250000; % Sampling Frfidequency
T = 1/Fs; % Sampling Period
L = 2049960;
t = (0:L-1)*T; %8.2s

Y = fft(array_voltage);
[Y_HDL] = dsp.HDLFFT(array_voltage, 1);

%Compute the two-sided spectrum P2. Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L.
P2 = abs(Y_HDL/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

%Define the frequency domain f and plot the single-sided amplitude spectrum
%P1.

f = Fs*(0:(L/2))/L;
line(f,P1)
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')