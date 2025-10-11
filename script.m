% ------------------------------------------------------------------------
% Author: Jashanpreet Kaur
% Title: Multi-Sensor Medical Image Fusion Using Hybrid Filtering and Multi-Scale Adaptive Decomposition Approach
% Description: This MATLAB code fuses multi-sensor brain images.
% ------------------------------------------------------------------------

clc; clear; close all;
tic; % Start timer

%% Step 1: Read and Preprocess Images
S1 = im2double(imread('.tif')); %% Path of Source 1 image
S2 = im2double(imread('.tif')); %% Path of Source 2 image

%% Step 2: Base & Detail Separation Using Bilateral Filter
sigma_s = 3;   % Spatial sigma
sigma_r = 0.1; % Range sigma
iter = 3;      % Number of iterations

S1_base = S1;
S2_base = S2;
for i = 1:iter
    S1_base = imbilatfilt(S1_base, sigma_r, sigma_s);
    S2_base = imbilatfilt(S2_base, sigma_r, sigma_s);
end

S1_detail = S1 - S1_base;
S2_detail = S2 - S2_base;

%% Step 3: Guided Filtering for Edge-Preserving Enhancement
r = 5;              % Neighborhood size
eps = 0.01^2;       % Smoothing strength

S1_enhanced = imguidedfilter(S1, 'NeighborhoodSize', [r r], 'DegreeOfSmoothing', eps);
S2_enhanced = imguidedfilter(S2, 'NeighborhoodSize', [r r], 'DegreeOfSmoothing', eps);

%% Step 4: Multi-Scale Adaptive Decomposition Fusion

% --- Base Fusion using Guided Filtered (Enhanced) Images ---

Fusedbase_enhanced =S1_enhanced + S2_enhanced;

% --- Detail Layer Fusion using Bilateral Details ---
Fuseddetail_layer = S1_detail + S2_detail;

% --- Final Fusion: Combine MRI_enhanced with Fused Detail Layer ---
Re_Fused = (Fusedbase_enhanced + Fuseddetail_layer) / 2;

%% Step 5: Contrast Enhancement
Fused = imadjust(Re_Fused, stretchlim(Re_Fused, [0.01 0.99]));

%% Step 6: Display Results
figure('Name', 'CT Image');        imshow(S1);
figure('Name', 'MRI Image');       imshow(S2);
%%figure('Name', 'CT Enhanced');     imshow(S1_enhanced, []);
%%figure('Name', 'MRI Enhanced');    imshow(S2_enhanced, []);
%%figure('Name', 'Fused Base (Enhanced)'); imshow(Fusedbase_enhanced, []);
%%figure('Name', 'Fused Detail Layer');    imshow(Fuseddetail_layer, []);
%%figure('Name', 'Reconstructed Fused');   imshow(Re_Fused, []);
figure('Name', 'Final Fused (Enhanced)');imshow(Fused, []);

%% Step 7: Save Fused Images
imwrite(Fused, '.png'); %%Path to save the image

toc; % End timer
