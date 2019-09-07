function J = bilateral (I, sigma_d, sigma_r)
    %Bilateral Filtering
    
    [x1, x2] = size(I);
    sigma_r = sigma_r/100;  % efarmogh klimakwsis
    band = 6*sigma_d;       % orizw to megethos toy xwrikou filtrou
    padding = round(band/2);
    
    % kanw zero padding sthn arxikh eikona gia na mporesw na efarmosw ta
    % filtra se gwniaka shmeia
    Ipadding = padarray(I,[padding padding]);   
    
    % Kataskeuazw to xwriko filtro
    Gaus = fspecial('gaussian', band, sigma_d); 

    % double for loop to have the result that we want
    for i = padding:(x1+padding)
        for j = padding:(x2+padding)
            plaisio = Ipadding(i-padding+1:i+padding , j-padding+1:j+padding); % pairnw to plaisio ths eikonas
            light_dif = plaisio-Ipadding(i,j); % konta sto (i,j) vriskw th diafora fwteinothtas
            gaussn = exp(-(light_dif.*light_dif)/(2*sigma_r*sigma_r)); % Gaussian 1-D
            bilat = gaussn.*Gaus;   % sunduasmos xwrikou fwtometrikou
            I_bilateral = plaisio.*bilat;   % eksodos apo sunduasmeno filtro
            outpout(i,j) = sum(sum(I_bilateral))/sum(sum(bilat)); % eksodos me klimakwsh
        end;
    end
    
    % diathrw thn arxikh eikona xwris to zero padding pou eixa kanei
    J = outpout(padding+1:x1+padding,padding+1:x2+padding); 
    
end
