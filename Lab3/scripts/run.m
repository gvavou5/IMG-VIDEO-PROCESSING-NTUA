%% Diavasma Olwn Twn Eikonwn kai Efarmogh Zhtoumenwn Filtrwn

I = imread('cat.jpg');      % eikona cat.jpg
Inew = imread('lena.tif');  % eikona lena.tif

I = double(I)/255;          % metatroph se double
Inew = double(Inew)/255;    % metatroph se double

bilateralvar = bilateral(I,4,50);    % efarmozw sthn eikona cat bilateral filtro
medianvar = medfilt2(I, [5 5]);      % efarmozw sthn eikona cat median filtro
bilaternew = bilateral(Inew,4,50);   % efarmozw sthn eikona lena bilateral filtro

%% Emfanisi eikonown

figure(1);              % dhmiourgia neas grafikhs 
subplot(1,3,1);
imshow(I);              % arxiki eikona
title('Original image');                    
subplot(1,3,2);
imshow(bilateralvar);   % eikona meta to filtro bilateral
title('Bilateral filter');      
subplot(1,3,3);
imshow(medianvar);      % eikona meta to filtro median
title('Median filter');     

%% Efarmogi filtrou bilateral kai median gia diafores parametrous

d1 = linspace(1, 10, 3);       %grammikos xwros isapexontwn shmeiwn, ta opoia einai sto euros twn typikwn apoklisewn
d2 = linspace(10, 100, 3);     %grammikos xwros isapexontwn shmeiwn, ta opoia einai sto euros twn typikwn apoklisewn
dmedian = linspace(3, 25, 4);  %grammikos xwros isapexontwn shmeiwn, ta opoia einai sto euros twn typikwn apoklisewn gia efarmogh ths maskas

% Eksodoi filtrou bilateral se koino grafima 
figure(2);    % dhmiourgia neas grafikhs 
for i = 1:3
    for j = 1:3
        bilateralvar = bilateral(I, round(d1(i)), round(d2(j)));
        subplot(3, 3, (i-1)*3 + j);
        imshow(bilateralvar);
    end
end
suptitle('Bilateral filtering for various parameters');

% Eksodoi filtrou median se koino grafima
figure(3);    % dhmiourgia neas grafikhs
for i = 1:4
    k = round(dmedian(i));
    medianvar = medfilt2(I, [k k]); % medfilt2 exist in matlab's library
    subplot(2, 2, i);
    imshow(medianvar);
end
suptitle('Median filtering for various parameters');

%% Bilateral filtering for image lena.tif

figure(4);              % dhmiourgia neas grafikhs
subplot(1,2,1);
imshow(Inew);           % original image lena.tif
title('Original Image');
subplot(1,2,2);
imshow(bilaternew);     % image after bilateral filtering
title('Outpout of Bilateral Filter');
