function [SNR_D, CR_D] = idct_global(D_Y_mask, D_Cb_mask, D_Cr_mask, I)
    % Megethos tis eikonas I
    [x,y,z] = size(I);
    % RGB times arxikis eikonas
    RGB = im2double(I);
    
    % Antistrofos DCT-2 se kathe kanali
    i_Y = idct2(D_Y_mask);
    i_Cb = idct2(D_Cb_mask);
    i_Cr = idct2(D_Cr_mask);
    
    % Dimiourgia eikonas sto xrwmatiko montelo YCbCr
    iYCbCr(:,:,1) = i_Y;
    iYCbCr(:,:,2) = i_Cb;
    iYCbCr(:,:,3) = i_Cr;
    
    % Metatropi eikonas ston xrwmatiko xwro RGB
    iRGB = ycbcr2rgb(iYCbCr);
    
    % Ypologismos SNR kai CR
    SNR_D = 10 * log10(sum(sum(sum(RGB.^2))) / sum(sum(sum((RGB-iRGB).^2))));
    CR_D = (x*y*z)/(nnz(D_Y_mask)+nnz(D_Cb_mask)+nnz(D_Cr_mask));
end

