%% Take the input 
I = imread('flowers.tif');
RGB = im2double(I);      % pairnw tis RGB parametrous
sizeI= size(RGB,1)*size(RGB,2)*size(RGB,3);%diastaseis arxikhs eikonas
figure(1); imshow(I);    % apeikonisi arxikis eikonas prin tin sumpiesi
title('The Original Image');


%% Sympiesi eikonas me fft
[Ym, Cbm, Crm] = fft_global(I, 0.8, 0.4);   %Lhpsh eksodou apo maskes
iRGB = ifft_global(Ym, Cbm, Crm);           %vriskw tis RGB parametrous
figure(2); imshow(iRGB);                    %apeikonisi eikonas meta tin sumpiesi
title('Compressed image with fft');
globalsnr = snr(RGB, RGB-iRGB)              %ypologismos snr gia ton global fft
Global = (nnz(Ym)+nnz(Cbm)+nnz(Crm))/sizeI 

%% Sympiesi eikonas me fft se blocks
[Ym, Cbm, Crm] = fft_block(I, 0.8, 0.4);    % eksodos apo maskes
iRGB = ifft_block(Ym, Cbm, Crm);            % vriskw tis RGB parametrous 
figure(3); imshow(iRGB);                    % apeikonisi eikonas meta tin sumpiesi
title('Compressed image with fft in blocks');
blocksnr = snr(RGB, RGB-iRGB)               % ypologismos snr gia ton block fft
Block = (nnz(Ym)+nnz(Cbm)+nnz(Crm))/sizeI  

%% Sxediash grafikis SNR pairnwntas polles times twn r_y r_c

%oi times toy r_y gia tis maskes einai grammikos 
%xwros 50 shmeiwn sto euros 0.1 ews 1
rY = linspace(0.1, 1, 50);    
      
%Oi times tou r_c gia tis maskes einai grammikos
%xwros 50 shmeiwn sto euros 0.2 ews 0.8
rC = linspace(0.2, 0.8, 50);  
                         
%Gia kathe zeygos timwn ta SNR kai ë apothikeuontai ston pinaka matrglob
%kai matrblock antistoixa
runner = 1;
for j = 1:1:50
        [Ym, Cbm, Crm] = fft_global(I, rY(j), rC(j));
        iRGB = ifft_global(Ym, Cbm, Crm);
        matrglob(1,runner) = (nnz(Ym)+nnz(Cbm)+nnz(Crm))/sizeI;
        matrglob(2,runner) = snr(RGB, RGB-iRGB);
        [Ym, Cbm, Crm] = fft_block(I, rY(j), rC(j));
        iRGB = ifft_block(Ym, Cbm, Crm);
        matrblock(1,runner) = (nnz(Ym)+nnz(Cbm)+nnz(Crm))/sizeI;
        matrblock(2,runner) = snr(RGB, RGB-iRGB);
        runner = runner + 1;
end;

%% koino diagramma SNR - ë
figure(4);
hold on;

%global fft me kokkino xrwma
plot(matrglob(1,:),matrglob(2,:),'r');

%block fft me prasino xrwma
plot(matrblock(1,:),matrblock(2,:),'g');

title('SNR plot for many mask sizes');
xlabel('ë');
ylabel('SNR');
legend('Using global fft', 'Using block fft','Location', 'SouthEast');
hold off;
