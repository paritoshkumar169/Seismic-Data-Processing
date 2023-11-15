# Seismic-Data-Processing
Generating a Random Seismic waveform in MATLAB, Filtering it and finding the most efficient Filter using Snr Function
# Seismic Data Analysis

This project involves the analysis of synthetic seismic data using different types of filters.

## Project Overview

The project generates a complex synthetic seismic data and applies different filters (Butterworth, Chebyshev Type I, and Elliptic) to the data. The filtered signals are then compared by calculating the Signal-to-Noise Ratio (SNR) and visualizing the results.

## Theory and Algorithm

The synthetic seismic data is generated as a combination of cosine and sine functions with different frequencies, along with some random noise. This is meant to simulate real-world seismic data which often contains multiple frequency components and noise.

Three types of filters are used in this project: Butterworth, Chebyshev Type I, and Elliptic. These filters are designed to pass signals within a certain frequency range (bandpass) and attenuate signals outside this range. The filters are applied to the synthetic seismic data to extract the desired frequency components.

After filtering, the envelope of each filtered signal is calculated using the Hilbert Transform. The envelope of a signal is a smooth curve that outlines its extremal points (peaks and troughs). It provides a way to visualize the amplitude modulation of the signal.

Finally, the Signal-to-Noise Ratio (SNR) of each filtered signal is calculated. SNR is a measure of signal strength relative to background noise. It is calculated as the ratio of the power of the 'signal' (original seismic data) to the power of the 'noise' (difference between the filtered data and the original data).

The original and filtered signals, along with their envelopes, are then plotted for comparison.

## Getting Started

### Dependencies

* MATLAB

### Executing program

* Save the MATLAB script in your local system.
* Run the script in your MATLAB environment.

