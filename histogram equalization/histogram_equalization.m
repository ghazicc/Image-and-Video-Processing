% a histogram of an image is found by h(i), the # of pixels in the image
% having intensity i.
%  A normalized histogram of an image is the pdf of that image.

% image = imread('DS2-Mod-8.jpg');
image = imread('einstein.jpg');

image = double(image);
histogram = zeros(256, 1);

% histogram is calculated
for i = 1:1:size(image, 1)
    for j = 1:1:size(image, 2)
            histogram(image(i,j)+1) = histogram(image(i,j)+1) + 1;
    end
end

% normalized histogram
pdf = histogram/(size(image,1)*size(image,2));
new_image = image;

% intensities adjusted to equalize histogram
for i = 1:1:size(image, 1)
    for j = 1:1:size(image, 2)
        intensity = image(i,j);
        new_image(i, j) = 255*sum(pdf(1:intensity+1)); 
    end
end

new_image = uint8(new_image);
imshow(new_image);

