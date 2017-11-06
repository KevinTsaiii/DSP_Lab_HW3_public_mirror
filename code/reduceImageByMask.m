function imageReduced = reduceImageByMask( image, seamMask, isVertical )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Removes pixels by input mask
% Removes vertical line if isVertical == 1, otherwise horizontal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if (isVertical)
        imageReduced = reduceImageByMaskVertical(image, seamMask);
    else
        imageReduced = reduceImageByMaskHorizontal(image, seamMask');
    end;
end

function imageReduced = reduceImageByMaskVertical(image, seamMask)
    % Note that the type of the mask is logical and you 
    % can make use of this.
    
    %%%%%%%%%%%%%%%%%%
    % YOUR CODE HERE:
    %%%%%%%%%%%%%%%%%%
    
    
    sz = size(image);
    imageReduced = zeros(sz(1),sz(2)-1);    
    
    k = 0;
    
    for i = 1:sz(1)
       for j = 1:sz(2)
           if (seamMask(i,j)==0)
               k = j;
           end           
       end
       imageReduced(i,:,1) = [image(i,1:k-1,1), image(i,k+1:sz(2),1)];
       imageReduced(i,:,2) = [image(i,1:k-1,2), image(i,k+1:sz(2),2)];
       imageReduced(i,:,3) = [image(i,1:k-1,3), image(i,k+1:sz(2),3)];
    end
    
    %%%%%%%%%%%%%%%%%%
    % END OF YOUR CODE
    %%%%%%%%%%%%%%%%%%
end

function imageReduced = reduceImageByMaskHorizontal(image, seamMask)
    %%%%%%%%%%%%%%%%%%
    % YOUR CODE HERE:
    %%%%%%%%%%%%%%%%%%
    
    image1 = image';
    sz = size(image1);
    imageReduced = zeros(sz(1),sz(2)-1);
    
    k = 0;
    
    for i = 1:sz(1)
       for j = 1:sz(2)
           if (seamMask(i,j)==0)
               k = j;
           end
           
       end
       imageReduced(i,:,1) = [image(i,1:k-1,1), image(i,k+1:sz(2),1)];
       imageReduced(i,:,2) = [image(i,1:k-1,2), image(i,k+1:sz(2),2)];
       imageReduced(i,:,3) = [image(i,1:k-1,3), image(i,k+1:sz(2),3)];
    end
    
    imageReduced(:,:,1) = imageReduced(:,:,1)';
    imageReduced(:,:,2) = imageReduced(:,:,2)';
    imageReduced(:,:,3) = imageReduced(:,:,3)';
    
    %%%%%%%%%%%%%%%%%%
    % END OF YOUR CODE
    %%%%%%%%%%%%%%%%%%
end
