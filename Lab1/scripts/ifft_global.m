function [iRGB] = ifft_global (F_Y_mask, F_Cb_mask, F_Cr_mask)
    i_F_Y=ifftshift(F_Y_mask);   %ifftshift
    i_FY = abs(ifft2(i_F_Y));    %ifft2
    iYCbCr(:,:,1) = i_FY;        %reformation
    
    i_F_Cb=ifftshift(F_Cb_mask); %ifftshift
    i_FCb = abs(ifft2(i_F_Cb));  %ifft2
    iYCbCr(:,:,2) = i_FCb;       %reformation
    
    i_F_Cr=ifftshift(F_Cr_mask); %ifftshift
    i_FCr = abs(ifft2(i_F_Cr));  %ifft2
    iYCbCr(:,:,3) = i_FCr;       %reformation
    
    iRGB = ycbcr2rgb(iYCbCr);    %convert to RGB
end