function [E,Z,M] = gdlog(I,s)
   %% Calculate M
   Val = 31; 
   indx = (0:Val-1)-(Val-1)/2;
   [n,k] = meshgrid(indx,indx); 
   G = 1 / (2*pi*s^2) * exp(-(n.^2+k.^2) / (2*s^2));
   Gn = -(n/s^2) .* G;
   Gk = -(k/s^2) .* G;
   Gx = imfilter(I, Gn, 'replicate', 'conv');
   Gy = imfilter(I, Gk, 'replicate', 'conv');
   M = sqrt(Gx.^2 + Gy.^2); % upologismos metrou M
   
   %% Calculate Z
   L = fspecial('log', 31, s); % s = 3 (tupikh apoklish)
   Gm = imfilter(I, L, 'replicate');
   Z = im2bw(Gm, 0); % katwfli sthn timh 0
   Z = bwperim(Z);   % eksagwgh perigrammatos duadikhs eikonas
   
   %% Calculate E
   E = Z.*M;  % oi akmes E einai to ginomeno twn Z kai M
   
end
