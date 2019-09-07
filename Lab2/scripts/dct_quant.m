function [Q_Y,Q_Cb,Q_Cr] = dct_quant(I, q)
    function Q = quant_C(C, q)
        QfC = [ 17 18 24 47 99 99 99 99 
                18 21 26 66 99 99 99 99
                24 26 56 99 99 99 99 99
                47 66 99 99 99 99 99 99
                99 99 99 99 99 99 99 99
                99 99 99 99 99 99 99 99
                99 99 99 99 99 99 99 99
                99 99 99 99 99 99 99 99 ];
      
        QC = q * QfC;
        Q = round(C ./ QC);
    end;
    
    function Q = quant_Y(Y, q)
        QfY = [ 16 11 10 16  24  40  51  61 
                12 12 14 19  26  58  60  55
                14 13 16 24  40  57  69  56
                14 17 22 29  51  87  80  62
                18 22 37 56  68 109 103  77
                24 35 55 64  81 104 113  92
                49 64 78 87 103 121 120 101
                72 92 95 98 112 100 103  99 ];
      
        QY = q * QfY;
        Q = round(Y ./ QY);
    end;
      
    RGB = im2double(I);         % lipsi RGB parametrwn
    YCbCr = rgb2ycbcr(RGB);     % metatropi xwrou se YCbCr
    Y = YCbCr(:,:,1);           % apomonwsi kanaliou Y
    Cb = YCbCr(:,:,2);          % apomonwsi kanaliou Cb
    Cr = YCbCr(:,:,3);          % apomonwsi kanaliou Cr
    
    
    % Efarmogi dct2 se kathe kanali (pol/meno me 255) ksexwrista se blocks twn 8x8
    Db_Y = blkproc(Y, [8 8], 'dct2')*255;       % Y-channel
    Db_Cb = blkproc(Cb, [8 8], 'dct2')*255;     % Cb channel
    Db_Cr = blkproc(Cr, [8 8], 'dct2')*255;     % Cr-channel
    
    % Efarmogi tis kvantisis se kathe metasximatismeno block toy kanaliou
    Q_Y = blkproc(Db_Y,[8 8],@quant_Y, q); %Y-channel
    Q_Cb = blkproc(Db_Cb,[8 8],@quant_C, q); %Cb-channel
    Q_Cr = blkproc(Db_Cr,[8 8],@quant_C, q); %Cr-channel
end

