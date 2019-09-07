function [SNR_Dz, CR_Dz] = idct_zigzag(Z_Y, Z_Cb, Z_Cr,I)
    % Megethos tis eikonas I
    [x,y,z] = size(I);
    % RGB times arxikis eikonas
    RGB = im2double(I);
    
    % Efarmogi idct-2 se kathe kanali ksexwrista se blocks twn 8x8
    i_Y = blkproc(Z_Y, [8 8], 'idct2');       % Y-channel
    i_Cb = blkproc(Z_Cb, [8 8], 'idct2');     % Cb channel
    i_Cr = blkproc(Z_Cr, [8 8], 'idct2');     % Cr-channel
    
    % Dimiourgia eikonas sto xrwmatiko montelo YCbCr
    iYCbCr(:,:,1) = i_Y;
    iYCbCr(:,:,2) = i_Cb;
    iYCbCr(:,:,3) = i_Cr;
    
    % Metatropi eikonas ston xrwmatiko xwro RGB
    iRGB = ycbcr2rgb(iYCbCr);
    %imshow(iRGB);
    % Ypologismos SNR kai CR
    SNR_Dz = 10 * log10(sum(sum(sum(RGB.^2))) / sum(sum(sum((RGB-iRGB).^2))));
    CR_Dz = (x*y*z)/(nnz(Z_Y)+nnz(Z_Cb)+nnz(Z_Cr));
end

