%% Start of function
function [ MDOutput ] = Exc4continued( input_image, r_min, r_max )
%% Loading in necessary variables
z = r_max - r_min;          % Finding the size of the loop using the max r to be found - the min
[x,y] = size(input_image);  % finding the size of the input image to pre-allocate
MDOutput = zeros(x,y,z);    %MDOutput means MultipleDimensionOutput, this is a preallocation for speed
radius = r_min;
%% Hough transformation in 3D
    for z = 1:z
    MDOutput(:,:,z) = Hough_Transform(input_image,radius); % Applying the Hough Transformation for the page z is at
    radius = radius + 1;    % Adding 1 to radius every loop iteration
    end
end

