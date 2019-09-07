function [F_Y_mask F_Cb_mask F_Cr_mask] = fft_global(I, r_Y, r_C)
    RGB = im2double(I);     %RGB times tis eikonas
    YCbCr = rgb2ycbcr(RGB); %metatropi sto xwro YCrCb
    Y = YCbCr(:,:,1);       %pairnw to Y
    Cb = YCbCr(:,:,2);      %pairnw to Cb
    Cr = YCbCr(:,:,3);      %pairnw to Cr
    FY = fft2(Y);           %2-d fft gia Y
    FCb = fft2(Cb);         %2-d fft gia Cb
    FCr = fft2(Cr);         %2-d fft gia Cr
    F_Y = fftshift(FY);     %Metafora xamhlwn syxnothtwn sto kentro 
    F_Cb = fftshift(FCb);   %gia kathe kanali
    F_Cr = fftshift(FCr);
    
    [ry, cy] = size(Y);
    rcy = min(ry,cy)/2; 
    m_Y = zeros(ry,cy);
    %m_Y => maska gia to Y kanali gia apokopi ypsilwn suxnotitwn
    [fxy, fyy] = meshgrid((1:cy)-(cy+1)/2, (1:ry)-(ry+1)/2);
    m_Y(sqrt(fxy.^2 + fyy.^2)<r_Y*rcy) = 1;
    F_Y_mask = F_Y .*m_Y;
    %syxnotites toy Y meta tin efarmogi tis maskas
    
    [rcb, ccb] = size(Cb);
    rccb = min(rcb,ccb)/2; 
    m_Cb = zeros(rcb,ccb);
    %m_Cb => maska gia to Cb kanali gia apokopi ypsilwn suxnotitwn
    [fxcb, fycb] = meshgrid((1:ccb)-(ccb+1)/2, (1:rcb)-(rcb+1)/2);
    m_Cb(sqrt(fxcb.^2 + fycb.^2)<r_C*rccb) = 1;
    F_Cb_mask = F_Cb .*m_Cb;
    %syxnotites toy Cb meta tin efarmogi tis maskas
    
    [rcr, ccr] = size(Cr);
    rccr = min(rcr,ccr)/2; 
    m_Cr = zeros(rcr,ccr);
    %m_Cr => maska gia to Cr kanali gia apokopi ypsilwn suxnotitwn
    [fxcr, fycr] = meshgrid((1:ccr)-(ccr+1)/2, (1:rcr)-(rcr+1)/2);
    m_Cr(sqrt(fxcr.^2 + fycr.^2)<r_C*rccr) = 1;
    F_Cr_mask = F_Cr .*m_Cr;
    %syxnotites toy Cr meta tin efarmogi tis maskas
end