clear all;
close all;
%% Load Baboon
bab = imread('BM3D_images/image_Baboon512rgb.png');
PSNRtable = zeros(2,4);
imshow(bab);

%% Gaussian Noise
babGauss = imnoise(bab,'gaussian');
babGaussPSNR = PSNR_RGB(double(babGauss)/255, double(bab)/255); %Doesn't really work
[babPSNR1, denBabGauss] = CBM3D(bab, babGauss, 50, 'np', 0, 'opp');
PSNRtable(1,1) = babGaussPSNR;
PSNRtable(2,1) = babPSNR1;

%% Rician Noise
babRic = uint8(ricernd(double(bab), 20));
babRicPSNR = PSNR_RGB(double(babRic)/255, double(bab)/255);
[babPSNR2, denBabRic] = CBM3D(bab, babRic, 25, 'np', 0, 'opp');
PSNRtable(1,2) = babRicPSNR;
PSNRtable(2,2) = babPSNR2;

% %% Uniform Noise
% babUni = addnoise(bab, 20); %Convert image in grey
% babUniPSNR = PSNR_RGB(double(babUni)/255, double(bab)/255);
% [babPSNR3, denBabUni] = CBM3D(bab, babUni, 25, 'np', 1, 'opp');
% PSNRtable(1,3) = babUniPSNR;
% PSNRtable(2,3) = babPSNR3;

%% Salt & pepper
babSandP = imnoise(bab,'salt & pepper');
babSandPPSNR = PSNR_RGB(double(babSandP)/255, double(bab)/255);
[babPSNR4, denBabSandP] = CBM3D(bab, babSandP, 25, 'np', 0, 'opp');
PSNRtable(1,4) = babSandPPSNR;
PSNRtable(2,4) = babPSNR4;