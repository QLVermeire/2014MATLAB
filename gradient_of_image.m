%% Start of function
function [out_image]=gradient_of_image(in_image,filter,maxvalue)
%% Putting in  the Sobel Masks basis multipliers
Mx = [-1, 0, 1; -2, 0, 2; -1, 0, 1];    % Horizontal sobelmask
My = [-1, -2, -1; 0, 0, 0; 1, 2, 1];    % Vertical sobelmask
%% Loading in necessary variables
loadedImage = double(in_image);         % Loading in the image as a double
[loop1,loop2] = size(loadedImage);      % Sets the length of the loop
Mcoll = zeros(loop1, loop2);            % pre-making the variable Mcoll

%% Edge Mask creation loop
for i=1:loop1
    for j=1:loop2
        %% If the coordinate falls out of the given size, it will skip the current loop and go to the next one 
           if i-1 < filter               % Filtering out the negative x boundary
                continue                 % Continue makes the for loop go to the "next step"
           elseif j-1 < filter           % Filtering out the negative y boundary
               continue       
           elseif i+1 > (loop1 - filter) % Filtering out max+1 x boundary
                continue
           elseif j+1 > (loop2 - filter) % Filtering out max+1 y boundary
               continue
           end
           
       %% Determining the mask coordinates
           val1 = loadedImage(i-1 ,j-1);    %Top Left
           val2 = loadedImage(i   ,j-1);    %Top Mid
           val3 = loadedImage(i+1 ,j-1);    %Top Right
           val4 = loadedImage(i-1 ,j  );    %Mid Left
           val5 = loadedImage(i   ,j  );    %Mid Mid
           val6 = loadedImage(i+1 ,j  );    %Mid Right
           val7 = loadedImage(i-1 ,j+1);    %Bot Left
           val8 = loadedImage(i   ,j+1);    %Bot Mid
           val9 = loadedImage(i+1 ,j+1);    %Bot Right
           
        %% Putting the values in a vector, preparing for the for loop
           posColl = [val1, val2, val3, val4, val5, val6, val7, val8, val9];    
           
        %% MxMerge (horizontal image gradient)
           totMX = 0;                                   % Creating the variable totMX
           for mxloop=1:9                               % Looping through it 9 times (once for every mask coordinate)
              tMerge = posColl(mxloop) * Mx(mxloop);    % tMerge (temporary merge) is made by putting the collection of positions times the Sobel Mask Multiplier
              totMX = totMX + tMerge;                   % Putting them together (this happens 9 times)
           end
           
           %% MyMerge (vertical image gradient)
           totMY = 0;                                   % Creating the variable totMY
           for myloop=1:9                               % Looping through it 9 times (once for every mask coordinate)
              tMerge = posColl(myloop) * My(myloop);    % tMerge (temporary merge) is made by putting the collection of positions times the Sobal Mask
              totMY = totMY + tMerge;                   % Putting them together (this happens 9 times)
           end
           
           %% Formula to combine horizontal and vertical image gradient
           M = sqrt(totMX^2+totMY^2);
           %% Putting it all together into one variable, Mcoll
           Mcoll(i, j) = M;

    end
end
%% Applying the maxvalue to every part of the image
highestNo = max(max(Mcoll));                            % Finding the absolute maximum value in the gradient image
for i=1:loop1
    for j=1:loop2
        Mcoll(i,j) = (Mcoll(i,j)/highestNo) * maxvalue; % Multiplying the maximum value by the variable location over the maximum value in the existing gradient image
    end
end
%% Displaying the gradient image
out_image = Mcoll;

end