%% Start of function
function [out_image] = draw_circle(in_image,x0,y0,r,value)

%% Determining useful variables
angle = 0:0.005:2*pi;               % Determining the sharpness of the angle with a vector
circleHalfOne = r*cos(angle);       % Taking "half one" (not the true half ofcourse) using the cosine function
circleHalfTwo = r*sin(angle);       % Taking "half two" using the sine function
[a,b] = size(in_image);             % Determining the size, mainly for the loop
angLength = length(angle);          % Using the length of the angle, also mainly for the loop
fullcircle = [];                    % Pre-making fullcircle
%% Determining the actual full circle "coordinates"
for i = 1 : angLength               
    x = circleHalfOne(1, i);        % Taking what's in position (1,i) of circleHalfOne 
    y = circleHalfTwo(1, i);        % Taking what's in position (1,i) of circleHalfTwo
    fullcircle = [fullcircle;x,y];  % Merging it into a two-dimensional array
end
%% Inserting the circle into the image
for i = 1 : angLength
    try % A try catch is used for any negative out of bounds
%% RealX and RealY create the position
    realX = round(fullcircle(i,1)) + x0;    % Rounding helps prevent boundary being a non-integer error
    realY = round(fullcircle(i,2)) + y0;    % Rounding helps prevent boundary being a non-integer error

%% preventing "out of bounds" Positions to turn into huge black blocks
        if realY > b            % If it's bigger than the full length of the imgae
            continue            % Skip this loop iteration
        elseif  realX > a       % If it's bigger than the full width of the image
            continue            % Skip this loop iteration
        end
%% Putting the value into the actual image coordinates
        in_image(realX,realY) = value;    
    catch
    %Negative out of bounds are caught by matlab, so a try catch without error message suffices
    %to suppress any possible and redundant error output
    end
    
end
%% Finally giving out the result for the function to output 
out_image = in_image;
end