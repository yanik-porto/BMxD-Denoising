clear all;
close all;
%% Load Lena
lena = imread('BM3D_images/Lena512.png');
PSNRtable = zeros(2,4);

%% Gaussian Noise
lenaGauss = imnoise(lena,'gaussian');
lenaGaussPSNR = PSNR(double(lenaGauss)/255, double(lena)/255);
[lenaPSNR1, denLenaGauss] = BM3D(lena, lenaGauss, 25, 'np', 0);
PSNRtable(1,1) = lenaGaussPSNR;
PSNRtable(2,1) = lenaPSNR1;

%% Rician Noise
lenaRic = uint8(ricernd(double(lena), 20));
lenaRicPSNR = PSNR(double(lenaRic)/255, double(lena)/255);
[lenaPSNR2, denLenaRic] = BM3D(lena, lenaRic, 25, 'np', 0);
PSNRtable(1,2) = lenaRicPSNR;
PSNRtable(2,2) = lenaPSNR2;

%% Uniform Noise
lenaUni = addnoise(lena, 20);
lenaUniPSNR = PSNR(double(lenaUni)/255, double(lena)/255);
[lenaPSNR3, denLenaUni] = BM3D(lena, lenaUni, 25, 'np', 0);
PSNRtable(1,3) = lenaUniPSNR;
PSNRtable(2,3) = lenaPSNR3;

%% Salt & pepper
lenaSandP = imnoise(lena,'salt & pepper');
lenaSandPPSNR = PSNR(double(lenaSandP)/255, double(lena)/255);
[lenaPSNR4, denLenaSandP] = BM3D(lena, lenaSandP, 25, 'np', 0);
PSNRtable(1,4) = lenaSandPPSNR;
PSNRtable(2,4) = lenaPSNR4;



