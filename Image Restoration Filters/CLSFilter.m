
% Define the size of the grid
N = 5;  % Size of the matrix (N x N)

% Define the grid of points
[k1, k2] = meshgrid(-pi/2:pi/(N-1):pi/2, -pi/2:pi/(N-1):pi/2);


% Create a 2D Laplacian matrix
L = [0 0 1 0 0; 0 1 2 1 0; 1 2 -16 2 1; 0 0 1 0 0; 0 1 2 1 0];

% Perform the 2D FFT on the Laplacian matrix
L_fft = fft2(L);

% Shift the zero-frequency component to the center of the spectrum
L_fft_shifted = fftshift(L_fft);

surf(k1, k2, abs(L_fft_shifted));

% Plot the magnitude of the 2D FFT
figure;
imagesc(abs(L_fft_shifted));
colormap('jet');
colorbar;
title('Magnitude of 2D FFT of Laplacian Matrix');

% Label the axes
xlabel('Frequency X');
ylabel('Frequency Y