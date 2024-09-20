% this script contains a 3*3 median filter constructed using 1D
% median filters.

original_image = imread("einstein.jpg");
%original_image = double(original_image);
noisy_image = imnoise(original_image, 'salt & pepper', 0.1); 

filtered_image = noisy_image;

% a vertical median filter is applied to the image first
for i = 2:1:(size(noisy_image, 1)-1)
    for j = 1:1:size(noisy_image, 2)
        filtered_image(i, j) = median(noisy_image(i-1:i+1, j));
    end
end

% a horizontal median filter is then applied to the filtered image
for i = 1:1:size(noisy_image, 1)
    for j = 2:1:(size(noisy_image, 2)-1)
        filtered_image(i, j) = median(noisy_image(i, j-1:j+1));
    end
end

filtered_image = uint8(filtered_image);
imshow(filtered_image);


