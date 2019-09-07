%% DCT exercise
feature('DefaultCharacterSet'); %gia na trexei to idio se ka8e H/Y
Input = imread('flowers.tif');
d_Y = linspace(0.1, 1.1, 20); %grammikos xwros 20 shmeiwn
k_Y = linspace(2, 20, 20);  %grammikos xwros 20 shmeiwn
q = linspace(0.2, 16, 20);  %grammikos xwros 20 shmei
runner = 1;
for runner = 1:20
        [Ym, Cbm, Crm] = dct_global(Input, d_Y(runner), d_Y(runner)/2);
        [matr_glob(2,runner),cr1] = idct_global(Ym, Cbm, Crm,Input);
        matr_glob(1,runner) = 1/cr1;
        [Ym, Cbm, Crm] = dct_block(Input, k_Y(runner), k_Y(runner)/2);
        [zig(2,runner),cr2] = idct_zigzag(Ym, Cbm, Crm,Input);
        zig(1,runner) = 1/cr2;
        [Ym, Cbm, Crm] = dct_quant(Input, q(runner));
        [quant(2,runner),cr3] = idct_quant(Ym, Cbm, Crm,Input,q(runner));
        quant(1,runner) = 1/cr3;
end;

[Abstr,Input]=sort(matr_glob(1,:)); %gia na taksinomisw twn apotelesmatwn, mporousa na to ameleisw
coun=matr_glob(:,Input);
figure();
hold on;
%% plot1
plot(coun(1,:),coun(2,:),'b');
coun=0;Input=0;
[Abstr,Input]=sort(zig(1,:));
coun=zig(:,Input);
%% plot2
plot(coun(1,:),coun(2,:),'r');
coun =0;Input=0;
[Abstr,Input]=sort(quant(1,:));
coun=quant(:,Input);
plot(coun(1,:),coun(2,:),'g');
title('SNR to Inverse Compression Rate plot diagram for various mask sizes');
xlabel('Inverse Compression Rate');
ylabel('snr');
legend('Using global dct', 'Using block dct(zigzag)', 'Using block dct(quantize)','Location', 'SouthEast');
hold off;
