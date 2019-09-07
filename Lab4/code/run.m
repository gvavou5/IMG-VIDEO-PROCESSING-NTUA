%% Gia thn eikona building.tif

I = im2double(imread('building.tif')); % take as input the image building.tif
[E, Z, M] = gdlog(I, 3); % h sunarthsh gdlog upologizei ta E,Z,M kai ta epistrefei 
                         % xrhsimopoiwntas thn parapanw eikona kai thn
                         % default timh ths tupikhs apoklishs h opoia einai
                         % 3.

figure(1);  % dhmiourgia grafikhs gia to Z    
grayshow(Z);
figure(2);  % dhmiourgia grafikhs gia to M 
grayshow(M);
figure(3);  % dhmiourgia grafikhs gia to E
grayshow(E);


%% Gia thn eikona peppers.tif

% Kanw thn idia douleia me parapanw gia na dw to apotelesma pou 8a parw
% an efarmosw thn parapanw diadikasia kai sthn eikona peppers.tif


I = im2double(imread('peppers.tif')); % take as input the image peppers.tif
[E, Z, M] = gdlog(I, 3); % h sunarthsh gdlog upologizei ta E,Z,M kai ta epistrefei 
                         % xrhsimopoiwntas thn parapanw eikona kai thn
                         % default timh ths tupikhs apoklishs h opoia einai
                         % 3.

figure(4);  % dhmiourgia grafikhs gia to Z    
grayshow(Z);
figure(5);  % dhmiourgia grafikhs gia to M 
grayshow(M);
figure(6);  % dhmiourgia grafikhs gia to E
grayshow(E);

%% Apanthsh Sth Thewrhtikh Erwthsh

% Efarmozontas thn parapanw diadikasia gia diafores times ths parametrou 
% s(tupikh apoklish) kai xrhsimopoiwntas diafores times kai gia to katwfli
% parathrw allages stis prokuptouses eikones(ston parapanw kwdika sas dinw to
% apotelesma mono gia thn timh s=3 afou den zhteitai na sas parathesw kai ta
% upoloipa apotelesmata, wstoso an auto htan anagkaio o kwdikas tha htan idios
% mono pou anti gia s=3 tha ebaza thn timh poy epelega). H methodos Canny, einai h
% pleon diadedomenh methodos anixneushs akmwn sto computer vision, sthn
% opoia isxuei oti analoga me thn timh ths tupikhs apoklishs pou tha
% epilexthei 8a prokupsei kai analogo apotelesma afou otan epilegei megalh
% timh ths tupikhs apoklishs ginetai entopismos megalwn akmwn klimakas (large scale edges)
% enw an epilegei mikrh timh tote ginetai entopismos 'leptwn'
% xarakthristikwn (small fine features). O algorithmos toy Canny kanei ta
% ekshs vhmata : 1)Smoothing 2) Finding gradients 3)Non-maximum suppression
% 4)Double thresholding 5)Edge tracking by hysteresis.

% Automatos Ypologismos Katwfliou : An 8eloume na upologisoume to
% katwfli me automato tropo mporoume na efarmosoume mia apo tis parakatw
% texnikes : O pleon aplos tropos einai na xrhsimopoihsoyme thn mesh timh
% twn timwn twn pixel pou einai ths klimakas tou gkri(mean value of the
% gray scale image pixel values). Enas allos tropos einai na
% xrhsimopoihsoume san katwfli to median color in the grey scale image. Kai
% oi 2 autes methodoi douleuoun kai gia xarakthristikes eikones petuxainoun
% paromoia apotelesmata.
