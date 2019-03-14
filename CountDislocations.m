%% Start of function
function [ amountOfDislocations ] = CountDislocations( input_image, treshold, filterRadius )
%% Loading in necessary variables
tTreshold = max(max(input_image)) * treshold; % The treshold is a combination of the maximum varibale found times the treshold (between 1 and 0)
[x, y] = size(input_image);                   % Determining the size for the loop
newImage = zeros(x,y);                        % Part of the to-display image
totalDots = 0;                                % Allocating the variable "totalDots" to show the amount of dislocations
%% Finding and showing the amount of dislocations
for i = 1:x
      for j = 1:y
          if input_image(i,j) > tTreshold % If the coordinate is over the threshold
              for k = 1:filterRadius      % Within a certain radius, everything is deleted
                                          % To prevent detecting the same
                                          % circle several times.
                  input_image = draw_circle(input_image,i,j,k,0);
              end
            newImage = draw_circle(newImage,i,j,10,1); % Drawing a circle where a dislocation is found
            totalDots = totalDots +1;                  % Adding one to the total dislocation counter
          end
      end
end
%% Output
 imshow(newImage);                % Showing where the dislocations are on an image
amountOfDislocations = totalDots; % Outputting the total dislocation amount

end

