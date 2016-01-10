clear all
close all
clc;

%% Denoise OCT images
[oct_volume] = read_oct_volume('P741009OS.img',512,128,1024);
%show_oct_volume(oct_volume);

for i=121:128
    oct_img(:,:,i) = im2double(oct_volume(:,:,i));
    sigma = std2(oct_img(800:900,100:200,i));
    [octPSNR, octDenoised(:,:,i)] = BM3D(1, oct_img(:,:,i),sigma);
%     subplot(121), imagesc(oct_img(:,:,i)),colormap('gray');
%     subplot(122),imagesc(octDenoised(:,:,i));
    psnrOCT=PSNR(octDenoised(:,:,i)/255,oct_img(:,:,i)/255);
    display(i);
end

    
save('denoised.img', 'octDenoised');


imshow(octDenoised(:,:,110));