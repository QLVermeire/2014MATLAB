%% Start of Hough Transform function
function [accumulator]=Hough_Transform(edge_image, radius)
    
[x,y] = size(edge_image);       % finding x and y, for pre-allocating and the loops
addition = zeros(x,y);          % Preallocating the array with zeros additon for speed
    
disp('This might take a while. Please be patient.'); % Hough_Transform takes around 4 seconds, so this is displayed to be user-friendly
%% Finding circles and inserting votes
  for i = 1:x
      for j = 1:y
        if edge_image(i,j) == 1         %If the part in the edge_image is one (white), so an edge is found
            new = zeros(x,y);           %Create a new array of zeros, every loop iteration
            new = draw_circle(new,i,j,radius,1); % Drawing a circle of the given radius at the point where the edge is found
            addition =  addition + new; % Putting together the new array of zeros with the one in the previous loop(s)

        end
      end
  end

    accumulator = addition;             % Showing the function the addition is what is meant to be output 
end