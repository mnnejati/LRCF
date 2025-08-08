%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
%  LRCF demo code for natural image denoising.                            %
%                                                                         %
%  Please cite the following paper if you use this code:                  %
%                                                                         %
%  M. Nejati, S. Samavi, S.M.R. Soroushmehr, and K. Najarian, "Low-Rank   %
%  Regularized Collaborative Filtering for Image Denoising", in IEEE      %
%  International Conference on Image Processing (ICIP), Quebec City,      %
%  Canada, Sept. 2015, pp. 730-734.                                       %
%                                                                         %
%  Author: Mansour Nejati , 2015                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc,clear all,close all
addpath('utils');

sigma  =  30;
imName = 'Monarch.tif';
imdir  = 'data';
oI = double(imread(fullfile(imdir,imName)));
randn('seed', 0);
nI = oI + sigma*randn(size( oI ));

%=====================================
tic;
res = LRCF_Denoising( sigma, nI, oI ); 
toc;
%=====================================

figure,imshow(oI, []); title('Original Image')
figure,imshow(nI, []); title('Noisy Image')
figure,imshow(res.dI,[])
title(['LRCF Denoising, PSNR = ',num2str(csnr(oI,res.dI,0,0),'%.3f'),'dB'])
