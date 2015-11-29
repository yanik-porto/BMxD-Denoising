clear all;
close all;
%% Load Cameraman
cam = imread('BM3D_images/Cameraman256.png');
PSNRtable = zeros(2,4);

%% Gaussian Noise
camGauss = imnoise(cam,'gaussian');
camGaussPSNR = PSNR(double(camGauss)/255, double(cam)/255);
[camPSNR1, denCamGauss] = BM3D(cam, camGauss, 25, 'np', 1);
PSNRtable(1,1) = camGaussPSNR;
PSNRtable(2,1) = camPSNR1;

%% Rician Noise
camRic = uint8(ricernd(double(cam), 20));
camRicPSNR = PSNR(double(camRic)/255, double(cam)/255);
[camPSNR2, denCamRic] = BM3D(cam, camRic, 25, 'np', 0);
PSNRtable(1,2) = camRicPSNR;
PSNRtable(2,2) = camPSNR2;

%% Uniform Noise
camUni = addnoise(cam, 20);
camUniPSNR = PSNR(double(camUni)/255, double(cam)/255);
[camPSNR3, denCamUni] = BM3D(cam, camUni, 25, 'np', 0);
PSNRtable(1,3) = camUniPSNR;
PSNRtable(2,3) = camPSNR3;

%% Salt & pepper
camSandP = imnoise(cam,'salt & pepper');
camSandPPSNR = PSNR(double(camSandP)/255, double(cam)/255);
[camPSNR4, denCamSandP] = BM3D(cam, camSandP, 25, 'np', 0);
PSNRtable(1,4) = camSandPPSNR;
PSNRtable(2,4) = camPSNR4;