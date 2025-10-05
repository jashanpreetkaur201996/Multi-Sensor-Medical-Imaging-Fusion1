% Read input images
s1 = imread('c01_1.tif');         % Replace with your Source1 image filename
s2 = imread('c01_2.tif');        % Replace with your Source2 image filename
fused = imread('Fused1.png');     % Replace with your fused image filename

% Convert to grayscale if images are RGB
if size(s1, 3) == 3
    s1 = rgb2gray(s1);
end

if size(s2, 3) == 3
    s2 = rgb2gray(s2);
end

if size(fused, 3) == 3
    fused = rgb2gray(fused);
end

% Convert images to double for statistical calculation
s1 = double(s1);
s2 = double(s2);
fused = double(fused);

% Reshape to 1D arrays
s1_vals = s1(:);
s2_vals = s2(:);
fused_vals = fused(:);

% Mean
mean_s1 = mean(s1_vals);
mean_s2 = mean(s2_vals);
mean_fused = mean(fused_vals);

% Median
median_s1 = median(s1_vals);
median_s2 = median(s2_vals);
median_fused = median(fused_vals);

% Mode (convert to uint8 for mode computation)
mode_s1 = mode(uint8(s1_vals));
mode_s2 = mode(uint8(s2_vals));
mode_fused = mode(uint8(fused_vals));

% Display results
fprintf('--- Statistics ---\n');
fprintf('S1:     Mean = %.2f, Median = %.2f, Mode = %d\n', mean_s1, median_s1, mode_s1);
fprintf('S2:     Mean = %.2f, Median = %.2f, Mode = %d\n', mean_s2, median_s2, mode_s2);
fprintf('Fused:  Mean = %.2f, Median = %.2f, Mode = %d\n', mean_fused, median_fused, mode_fused);
