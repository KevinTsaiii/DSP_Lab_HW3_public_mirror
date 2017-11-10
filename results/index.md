# 蔡介豪 <span style="color:red">(103061101)</span>

# DSP Lab HW 3 / Seam Carving for Content-Aware Image Resizing

## Overview
The project is related to Seam Carving.



## Implementation

1. Calculate gradient of pixel in ```energyRGB.m```
	<pre><code>dx = [-1 0 1; -1 0 1; -1 0 1]; % horizontal gradient filter 
	dy = dx'; % vertical gradient filter
	Ix1 = abs(imfilter(I(:,:,1),dx));
	Ix2 = abs(imfilter(I(:,:,2),dx));
	Ix3 = abs(imfilter(I(:,:,3),dx));
	
	Iy1 = abs(imfilter(I(:,:,1),dy));
	Iy2 = abs(imfilter(I(:,:,2),dy));
	Iy3 = abs(imfilter(I(:,:,3),dy));

	res = (Ix1 + Ix2 + Ix3 + Iy1 + Iy2 + Iy3)/255;</code></pre>

2. Find optimal seam in ```findOptSeam.m```
	<pre><code>M(1, 2:sz(2)-1) = energy(1, :);
    
    for i = 2:sz(1)
        for j = 2:sz(2)-1

            M(i, j) = energy(i, j-1) + min(M(i - 1, (j - 1):(j + 1)));

        end
    end</code></pre>
	
	<pre><code>[value, index] = min(M(sz(1), 1:sz(2)));
    optSeamMask(sz(1), index-1) = 1;
    
    
    for i = sz(1)-1:-1:1
        [value, index1] = min(M(i, (index-1):(index+1)));
        optSeamMask(i, index+index1-3) = 1;
        index = index+index1-2;
    end</code></pre>


3. Reduce pixels by input mask in ```reduceImageByMask.m```
	<pre><code>sz = size(image);
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
    end</code></pre>

	<pre><code>image1 = image';
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
    imageReduced(:,:,3) = imageReduced(:,:,3)';</code></pre>

	
### Results
Original image:
<img src="../1.jpg" width="50%"/>

After content-aware image resizing:
<img src="../2.jpg" width="50%"/>