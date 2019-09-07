function [D_Y_mask, D_Cb_mask, D_Cr_mask]= dct_global(I, r_Y, r_C)
    RGB = im2double(I);
    YCbCr=rgb2ycbcr(RGB); % allagi xrwmatikou xwrou
    % Apomonwsi kanaliwn
    Y=YCbCr(:,:,1); 
    Cb=YCbCr(:,:,2);
    Cr=YCbCr(:,:,3);
    
    D_Y = dct2(Y); % DCT transform - Y channel
    D_Cb = dct2(Cb); % DCT transform – Cb channel
    D_Cr = dct2(Cr); % DCT transform – Cr channel
    
    % Dhmiourgia maskas kanaliou Y
    [r1, c1] = size(Y);
    rc1 = round(r_Y*min(r1, c1));
    m_Y = fliplr(triu(ones(r1,c1),c1-rc1));
    % Efarmogi maskas sto kanali Y
    D_Y_mask = D_Y .* m_Y;
    
    % Dhmiourgia maskas kanaliou Cb
    [r2, c2] = size(Cb);
    rc2 = round(r_C*min(r2, c2));
    m_Cb = fliplr(triu(ones(r2,c2),c2-rc2));
    % Efarmogi maskas sto kanali Cb
    D_Cb_mask = D_Cb .* m_Cb;
    
    % Dhmiourgia maskas kanaliou Cr
    [r3, c3] = size(Cr);
    rc3 = round(r_C*min(r3, c3));
    m_Cr = fliplr(triu(ones(r3,c3),c3-rc3));
    % Efarmogi maskas sto kanali Cr
    D_Cr_mask = D_Cr .* m_Cr;
end