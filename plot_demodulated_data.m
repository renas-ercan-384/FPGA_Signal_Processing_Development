filename = 'multi_collumn.txt';
fid = fopen(filename, 'r');


x = (20500);

[date, time, voltage1, voltage2 ,voltage3 ,voltage4 ,voltage5 ,voltage6 ,voltage7 ,voltage8,] = textread(filename, '%s %s %s %s %s %s %s %s %s %s', x);
fclose(fid);

new_volt1 = split(voltage1, 'E');
new_volt2 = split(voltage2, 'E');
new_volt3 = split(voltage3, 'E');
new_volt4 = split(voltage4, 'E');
new_volt5 = split(voltage5, 'E');
new_volt6 = split(voltage6, 'E');
new_volt7 = split(voltage7, 'E');
new_volt8 = split(voltage8, 'E');

new_time = split(time, ':');


array_time = 0.0004*(0:20499);

array_voltage1 = str2double([new_volt1(1:x)]);
array_voltage2 = str2double([new_volt2(1:x)]);
array_voltage3 = str2double([new_volt3(1:x)]);
array_voltage4 = str2double([new_volt4(1:x)]);
array_voltage5 = str2double([new_volt5(1:x)]);
array_voltage6 = str2double([new_volt6(1:x)]);
array_voltage7 = str2double([new_volt7(1:x)]);
array_voltage8 = str2double([new_volt8(1:x)]);


figure
%plot(array_time, array_voltage1);
%hold on
%plot (array_time, array_voltage2);
%hold on
%plot (array_time, array_voltage3);
%hold on
%plot(array_time, array_voltage4);
%hold on
%plot (array_time, array_voltage5);
%hold on
%plot (array_time, array_voltage6);
%hold on
%plot (array_time, array_voltage7);
%hold on
%plot (array_time, array_voltage8);
%hold off
f6 = line(array_time, array_voltage6,'Color',[0.3010 0.7450 0.9330]); %23k - Light Blue

f1 = line(array_time, array_voltage1,'Color','k', 'LineWidth', 1.5); %8k - Black

f2 = line(array_time, array_voltage2,'Color', [0.8500 0.3250 0.0980], 'LineWidth', 1.5); %11k - Orange

f3 = line(array_time, array_voltage3,'Color',[0.4660 0.6740 0.1880], 'LineWidth', 1.5); %14k - Green

f4 = line(array_time, array_voltage4,'Color',[0 0.4470 0.7410], 'LineWidth', 1.5); %17k - Dark Blue

f5 = line(array_time, array_voltage5,'Color',[0.6350 0.0780 0.1840], 'LineWidth', 1.5); %20k - Dark Red

f7 = line(array_time, array_voltage7,'Color',[0.4940 0.1840 0.5560], 'LineWidth', 1.5); %26k - Purple

f8 = line(array_time, array_voltage8,'Color',[0.9290 0.6940 0.1250], 'LineWidth', 1.5); %29k - Yellow


xlim([0 8.2]);
xlabel('Time [s]'); 
ylabel('Signal Voltage [V e+0]');