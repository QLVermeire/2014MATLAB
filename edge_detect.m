%% Start of function
function [edge_image]=edge_detect(in_image, treshold)
%% Determining necessary variables
gradientImage = gradient_of_image(in_image, 1, 1);  %Taking the gradientof the input image
[loop1,loop2] = size(gradientImage);                % setting the length of the loop to the x and y size of the image
%% Looping through every part of the gradient image
for i=1:loop1
    for j=1:loop2
        if gradientImage(i,j) > treshold            %Checking if the position corresponds to above or below the treshold 
        gradientImage(i,j) = 1;   %Setting it to black if it's above the treshold
        else
        gradientImage(i,j) = 0;   %Setting it to white if it's under the treshold
        end
    end
end
%% Outputting the image seperately for increased encapsulation
edge_image = gradientImage;    % Simply outputting the gradient
end