function [iRGB] = ifft_block(Fb_Y_mask, Fb_Cb_mask, Fb_Cr_mask)
    i_Y = blkproc(Fb_Y_mask, [8 8], 'ifftshift'); % ifftshift se 8X8 blocks se ka8e kanali ths eikonas
    iY = blkproc(i_Y, [8 8], 'ifft2'); %ifft se 8X8 block meta to ifftshift
    iYCbCr(:,:,1) = iY; %Kanonikopoihsh twn timwn
    
    i_Cb = blkproc(Fb_Cb_mask, [8 8], 'ifftshift'); % ifftshift se 8X8 blocks se ka8e kanali ths eikonas
    iCb = blkproc(i_Cb, [8 8], 'ifft2'); %ifft se 8X8 block meta to ifftshift
    iYCbCr(:,:,2) = iCb; %Kanonikopoihsh twn timwn
    
    i_Cr = blkproc(Fb_Cr_mask, [8 8], 'ifftshift'); %ifft se 8X8 block meta to ifftshift
    iCr = blkproc(i_Cr, [8 8], 'ifft2'); %ifft se 8X8 block meta to ifftshift
    iYCbCr(:,:,3) = iCr; %Kanonikopoihsh twn timwn
    
    iRGB = ycbcr2rgb(iYCbCr); %metatroph apo YCbCr se RGB
end