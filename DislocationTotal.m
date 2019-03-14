%% Showing a total of dislocations in an image, and displaying them
function [ TotalDots ] = DislocationTotal( input_image, edge_treshold, hough_radius, dislocation_treshold, filterRadius  )
  Y=edge_detect(input_image, edge_treshold);        % Edge detection
  A=Hough_Transform(Y, hough_radius);               % Hough trasnform 
  TotalDots = CountDislocations( A, dislocation_treshold, filterRadius); % Counting dislocations and displaying them
end

