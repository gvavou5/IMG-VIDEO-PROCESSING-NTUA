function [Fb_Y_mask Fb_Cb_mask Fb_Cr_mask] = fft_block(I, r_Y, r_C)
    RGB = im2double(I);         %pairnw tis RGB parametrous
    YCbCr = rgb2ycbcr(RGB);     %metatropi se YCbCr
    Y = YCbCr(:,:,1);           %apomonwsi Y
    Cb = YCbCr(:,:,2);          %apomonwsi Cb
    Cr = YCbCr(:,:,3);          %apomonwsi Cr
    
    %Syxnotiko periexomeno kathe block
    Fb_Y = blkproc(Y, [8 8], 'fft2');   %Y channel
    Fb_Cb = blkproc(Cb, [8 8], 'fft2'); %Cb channel
    Fb_Cr = blkproc(Cr, [8 8], 'fft2'); %Cr channel
    
    %metatopisi toy kentrou summetrias
    Fb_Y = blkproc(Fb_Y,[8 8],'fftshift');  %Y channel 
    Fb_Cb = blkproc(Fb_Cb,[8 8],'fftshift');%Cb channel
    Fb_Cr = blkproc(Fb_Cr,[8 8],'fftshift');%Cr channel
    
    m = zeros(8);
    [fx,fy] = freqspace([8 8], 'meshgrid'); %mask application
    m(sqrt(fx.^2 + fy.^2) < r_Y) = 1;       %mask creation
    Fb_Y_mask = blkproc(Fb_Y, [8 8], 'times', m); 
    
    m = zeros(8);
    [fx,fy] = freqspace([8 8], 'meshgrid'); %mask application
    m(sqrt(fx.^2 + fy.^2) < r_C) = 1;       %mask creation
    Fb_Cb_mask = blkproc(Fb_Cb, [8 8], 'times', m);
    Fb_Cr_mask = blkproc(Fb_Cr, [8 8], 'times', m);
end