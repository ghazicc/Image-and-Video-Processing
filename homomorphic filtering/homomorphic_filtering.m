image = imread('StockCake-Sunset Silhouette Contemplation_1723754070.jpg');
image = double(image);

% define a low pass filter and a high pass filter to separate
% the luminance and reflectance components in the log domain
lpf = zeros(5, 5);
lpf(:) = 1/25;

hpf = zeros(3, 3);
hpf(:) = -1/16;
hpf(2,2) = 0.5;

% define the coefficients by which each component is multiplied
a = 1;
b = 2;

im_log = log(image);

lum = imfilter(im_log, lpf, 'replicate');
ref = imfilter(im_log, hpf, 'replicate');

lum = a * lum;
ref = b * ref;

filtered_image = exp(lum + ref);

filtered_image = uint8(filtered_image);

imshow(filtered_image);




