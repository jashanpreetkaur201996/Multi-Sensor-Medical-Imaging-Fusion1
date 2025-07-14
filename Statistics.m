% Read input images
mri = imread('F:\JASHAN\Fusion\MedicalFusionMain\Dataset Images\CT3.tif');         % Replace with your MRI image filename
ct = imread('F:\JASHAN\Fusion\MedicalFusionMain\Dataset Images\MRI3.tif');           % Replace with your CT image filename
fused = imread('F:\JASHAN\Fusion\MedicalFusionMain\Dataset Images\FusedImage3.tif');     % Replace with your fused image filename

% Convert to gra    yscale if images are RGB
if size(mri, 3) == 3
    mri = rgb2gray(mri);
end

if size(ct, 3) == 3
    ct = rgb2gray(ct);
end

if size(fused, 3) == 3
    fused = rgb2gray(fused);
end

% Convert images to double for statistical calculation
mri = double(mri);
ct = double(ct);
fused = double(fused);

% Reshape to 1D arrays
mri_vals = mri(:);
ct_vals = ct(:);
fused_vals = fused(:);

% Mean
mean_mri = mean(mri_vals);
mean_ct = mean(ct_vals);
mean_fused = mean(fused_vals);

% Median
median_mri = median(mri_vals);
median_ct = median(ct_vals);
median_fused = median(fused_vals);

% Mode (convert to uint8 for mode computation)
mode_mri = mode(uint8(mri_vals));
mode_ct = mode(uint8(ct_vals));
mode_fused = mode(uint8(fused_vals));

% Display results
fprintf('--- Statistics ---\n');
fprintf('MRI:    Mean = %.2f, Median = %.2f, Mode = %d\n', mean_mri, median_mri, mode_mri);
fprintf('CT:     Mean = %.2f, Median = %.2f, Mode = %d\n', mean_ct, median_ct, mode_ct);
fprintf('Fused:  Mean = %.2f, Median = %.2f, Mode = %d\n', mean_fused, median_fused, mode_fused);