% Parameters
fs = 1000;          % Sampling frequency (Hz)
t = 0:1/fs:10;       % Time vector (0 to 10 seconds with 1/fs increment)

% Generating a complex synthetic seismic data
seismic_data = cos(2*pi*5*t) + 0.5*sin(2*pi*20*t) + randn(size(t));

% Save the synthetic seismic data to a file
save('seismic_data_complex.txt', 'seismic_data', '-ascii');

% Read the seismic data file
data = load('seismic_data_complex.txt');
apappde
% Bandpass Filter Parameters
f_low = 5; % low cutoff frequency
f_high = 30; % high cutoff frequency

% Design different filters
[b1, a1] = butter(5, [f_low/(fs/2), f_high/(fs/2)], 'bandpass');
[b2, a2] = cheby1(5, 0.5, [f_low/(fs/2), f_high/(fs/2)], 'bandpass');
[b3, a3] = ellip(5, 0.5, 40, [f_low/(fs/2), f_high/(fs/2)], 'bandpass');

% Apply different filters
filtered_data1 = filter(b1, a1, data);
filtered_data2 = filter(b2, a2, data);
filtered_data3 = filter(b3, a3, data);

% Envelope Detection using Hilbert Transform
envelope1 = abs(hilbert(filtered_data1));
envelope2 = abs(hilbert(filtered_data2));
envelope3 = abs(hilbert(filtered_data3));

% Calculate Signal-to-Noise Ratio (SNR) for each filtered signal
snr1 = snr(seismic_data, filtered_data1 - seismic_data);
snr2 = snr(seismic_data, filtered_data2 - seismic_data);
snr3 = snr(seismic_data, filtered_data3 - seismic_data);

% Plotting
figure;

% Original Seismic Signal
subplot(4,1,1);
plot(t, seismic_data);
title('Original Seismic Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Filtered Seismic Signals with Envelopes and SNR
subplot(4,1,2);
plot(t, filtered_data1, 'b', 'LineWidth', 1.5);
hold on;
plot(t, envelope1, 'r', 'LineWidth', 1.5);
title(['Filter 1: Butterworth, SNR: ' num2str(snr1) ' dB']);
xlabel('Time (s)');
ylabel('Amplitude');
legend('Filtered Signal', 'Envelope');

subplot(4,1,3);
plot(t, filtered_data2, 'b', 'LineWidth', 1.5);
hold on;
plot(t, envelope2, 'r', 'LineWidth', 1.5);
title(['Filter 2: Chebyshev Type I, SNR: ' num2str(snr2) ' dB']);
xlabel('Time (s)');
ylabel('Amplitude');
legend('Filtered Signal', 'Envelope');

subplot(4,1,4);
plot(t, filtered_data3, 'b', 'LineWidth', 1.5);
hold on;
plot(t, envelope3, 'r', 'LineWidth', 1.5);
title(['Filter 3: Elliptic, SNR: ' num2str(snr3) ' dB']);
xlabel('Time (s)');
ylabel('Amplitude');
legend('Filtered Signal', 'Envelope');

% Adjusting Figure Properties
sgtitle('Comparison of Different Filters');
