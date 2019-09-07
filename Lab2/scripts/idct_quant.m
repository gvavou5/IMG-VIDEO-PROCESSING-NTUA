function [SNR_Dq, CR_Dq] = idct_quant(Q_Y, Q_Cb, Q_Cr, I, q)
    function iQ_C = iquant_C(Q_C, q)
        QfC = [ 17 18 24 47 99 99 99 99 
                18 21 26 66 99 99 99 99
                24 26 56 99 99 99 99 99
                47 66 99 99 99 99 99 99
                99 99 99 99 99 99 99 99
                99 99 99 99 99 99 99 99
                99 99 99 99 99 99 99 99
                99 99 99 99 99 99 99 99 ];
      
        QC = q * QfC;
        iQ_C = round(Q_C .* QC);
    end;
    
    function iQ_Y = iquant_Y(Q_Y, q)
        QfY = [ 16 11 10 16  24  40  51  61 
                12 12 14 19  26  58  60  55
                14 13 16 24  40  57  69  56
                14 17 22 29  51  87  80  62
                18 22 37 56  68 109 103  77
                24 35 55 64  81 104 113  92
                49 64 78 87 103 121 120 101
                72 92 95 98 112 100 103  99 ];
      
        QY = q * QfY;
        iQ_Y = round(Q_Y .* QY);
    end;
    
    % Megethos tis eikonas I
    [x,y,z] = size(I);
    % RGB times arxikis eikonas
    RGB = im2double(I);
    
    % Anairesi tis kvantisis se kathe metasximatismeno block toy kanaliou
    iQ_Y = blkproc(Q_Y,[8 8],@iquant_Y, q)/255; %Y-channel
    iQ_Cb = blkproc(Q_Cb,[8 8],@iquant_C, q)/255; %Cb-channel
    iQ_Cr = blkproc(Q_Cr,[8 8],@iquant_C, q)/255; %Cr-channel
    
    % Efarmogi idct-2 se kathe kanali ksexwrista se blocks twn 8x8
    i_Y = blkproc(iQ_Y, [8 8], 'idct2');       % Y-channel
    i_Cb = blkproc(iQ_Cb, [8 8], 'idct2');     % Cb channel
    i_Cr = blkproc(iQ_Cr, [8 8], 'idct2');     % Cr-channel
    
    % Dimiourgia eikonas sto xrwmatiko montelo YCbCr
    iYCbCr(:,:,1) = i_Y;
    iYCbCr(:,:,2) = i_Cb;
    iYCbCr(:,:,3) = i_Cr;
    
    % Metatropi eikonas ston xrwmatiko xwro RGB
    iRGB = ycbcr2rgb(iYCbCr);
    %imshow(iRGB)
    % Ypologismos SNR kai CR
    SNR_Dq = 10 * log10(sum(sum(sum(RGB.^2))) / sum(sum(sum((RGB-iRGB).^2))));
    CR_Dq = (x*y*z)/(nnz(Q_Y)+nnz(Q_Cb)+nnz(Q_Cr));
end

