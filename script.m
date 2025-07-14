% ------------------------------------------------------------------------
% Author: Jashanpreet Kaur
% Title: CT-MRI Image Fusion using Bilateral, Guided, and Gaussian Filtering
% Description: This MATLAB code fuses CT and MRI images using a multi-step
% filtering and fusion process. The final output is a contrast-enhanced
% fused image suitable for medical analysis.
% ------------------------------------------------------------------------

clc; clear; close all;
tic; % Start timer

%% Step 1: Read and Preprocess Images
CT = im2double(imread('F:\JASHAN\Fusion\MedicalFusionMain\Dataset Images\CT3.tif'));
MRI = im2double(imread('F:\JASHAN\Fusion\MedicalFusionMain\Dataset Images\MRI3.tif'));

%% Step 2: Base & Detail Separation Using Bilateral Filter
sigma_s = 3;   % Spatial sigma
sigma_r = 0.1; % Range sigma
iter = 3;      % Number of iterations

CT_base = CT;
MRI_base = MRI;
for i = 1:iter
    CT_base = imbilatfilt(CT_base, sigma_r, sigma_s);
    MRI_base = imbilatfilt(MRI_base, sigma_r, sigma_s);
end

CT_detail = CT - CT_base;
MRI_detail = MRI - MRI_base;

%% Step 3: Guided Filtering for Edge-Preserving Enhancement
r = 5;              % Neighborhood size
eps = 0.01^2;       % Smoothing strength

CT_enhanced = imguidedfilter(CT, 'NeighborhoodSize', [r r], 'DegreeOfSmoothing', eps);
MRI_enhanced = imguidedfilter(MRI, 'NeighborhoodSize', [r r], 'DegreeOfSmoothing', eps);

%% Step 4: Gaussian High-Pass Filtering
sigma = 2;
CT_hp = CT - imgaussfilt(CT, sigma);
MRI_hp = MRI - imgaussfilt(MRI, sigma);

%% Step 5: Adaptive Multi-Scale Fusion
% Base Fusion (Weighted Average)
wCT = std2(CT_base) / (std2(CT_base) + std2(MRI_base));
wMRI = 1 - wCT;
F_base = wCT * CT_base + wMRI * MRI_base;

% Detail Fusion (Average)
F_detail = (CT_detail + MRI_detail) / 2;

% High-Pass Fusion (Max Selection)
F_hp = max(CT_hp, MRI_hp);

% Final Fused Image Before Contrast Enhancement
Re_Fused = F_base + F_detail + F_hp;

%% Step 6: Contrast Enhancement
Fused = imadjust(Re_Fused, stretchlim(Re_Fused, [0.01 0.99]));

%% Step 7: Display Results
%% figure('Name', 'CT Image');        imshow(CT);
%% figure('Name', 'MRI Image');       imshow(MRI);
%% figure('Name', 'CT Base');         imshow(CT_base);
%% figure('Name', 'MRI Base');        imshow(MRI_base);
%% figure('Name', 'CT Detail');       imshow(CT_detail, []);
%% figure('Name', 'MRI Detail');      imshow(MRI_detail, []);
%% figure('Name', 'CT Enhanced');     imshow(CT_enhanced, []);
%% figure('Name', 'MRI Enhanced');    imshow(MRI_enhanced, []);
%% figure('Name', 'CT High-Pass');    imshow(CT_hp, []);
%% figure('Name', 'MRI High-Pass');   imshow(MRI_hp, []);
%% figure('Name', 'Fused Base');      imshow(F_base, []);
%% figure('Name', 'Fused Detail');    imshow(F_detail, []);
%% figure('Name', 'Fused High-Pass'); imshow(F_hp, []);
figure('Name', 'Reconstructed Fused'); imshow(Re_Fused);
figure('Name', 'Final Fused (Enhanced)'); imshow(Fused);

%% Step 8: Save Fused Images
imwrite(Re_Fused, 'F:\JASHAN\Fusion\MedicalFusionMain\Dataset Images\ReFusedImage3.tif');
imwrite(Fused, 'F:\JASHAN\Fusion\MedicalFusionMain\Dataset Images\FusedImage3.tif');

toc; % End timer
