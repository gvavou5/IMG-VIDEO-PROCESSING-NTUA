function [Z_Y, Z_Cb, Z_Cr] = dct_block(I, k_Y, k_C)
    RGB = im2double(I);         % lipsi RGB parametrwn
    YCbCr = rgb2ycbcr(RGB);     % metatropi xwrou se YCbCr
    Y = YCbCr(:,:,1);           % apomonwsi kanaliou Y
    Cb = YCbCr(:,:,2);          % apomonwsi kanaliou Cb
    Cr = YCbCr(:,:,3);          % apomonwsi kanaliou Cr
    
    % Efarmogi dct2 se kathe kanali ksexwrista se blocks twn 8x8
    Db_Y = blkproc(Y, [8 8], 'dct2');       % Y-channel
    Db_Cb = blkproc(Cb, [8 8], 'dct2');     % Cb channel
    Db_Cr = blkproc(Cr, [8 8], 'dct2');     % Cr-channel
    
    % Efarmogi tis zigzag se kathe metasximatismeno block toy kanaliou
    Z_Y = blkproc(Db_Y, [8 8], @zigzag, k_Y);   % Y-channel
    Z_Cb = blkproc(Db_Cb, [8 8], @zigzag, k_C); % Cb-channel
    Z_Cr = blkproc(Db_Cr, [8 8], @zigzag, k_C); % Cr-channel
    
    function y = zigzag(x, n)
       z = [ 1     2     6     7    15    16    28    29; 
             3     5     8    14    17    27    30    43; 
             4     9    13    18    26    31    42    44; 
            10    12    19    25    32    41    45    54; 
            11    20    24    33    40    46    53    55; 
            21    23    34    39    47    52    56    61; 
            22    35    38    48    51    57    60    62; 
            36    37    49    50    58    59    63    64];

        y = x;
        y(z > n) = 0;
    end
    
end

