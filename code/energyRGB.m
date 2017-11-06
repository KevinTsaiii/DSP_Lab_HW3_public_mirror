function res = energyRGB(I)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sum up the enery for each channel 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dx = [-1 0 1; -1 0 1; -1 0 1]; % horizontal gradient filter 
dy = dx'; % vertical gradient filter

Ix1 = abs(imfilter(I(:,:,1),dx));
Ix2 = abs(imfilter(I(:,:,2),dx));
Ix3 = abs(imfilter(I(:,:,3),dx));

Iy1 = abs(imfilter(I(:,:,1),dy));
Iy2 = abs(imfilter(I(:,:,2),dy));
Iy3 = abs(imfilter(I(:,:,3),dy));

res = (Ix1 + Ix2 + Ix3 + Iy1 + Iy2 + Iy3)/255;

end

% function res = energyGrey(I)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% returns energy of all pixelels
% e = |dI/dx| + |dI/dy|
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% res = 
% end

