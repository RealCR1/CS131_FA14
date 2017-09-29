I = imread('cit.png');         % Read a PNG image

figure
imagesc(I)                    % Display it as gray level image
colormap gray;

colorbar                      % Turn on color bar on the side
pixval                        % Display pixel values interactively

truesize                      % Display at resolution of one screen
                              %   pixel per image pixel
truesize(2*size(I))           % Display at resolution of two screen
                              %   pixels per image pixel

I2 = imresize(I, 0.5, 'bil'); % Resize to 50% using bilinear 

                              %   interpolation
I3 = imrotate(I2, 45, ...     % Rotate 45 degrees and crop to
              'bil', 'crop'); %   original size

I3 = double(I2);              % Convert from uint8 to double, to allow

                              %   math operations
imagesc(I3.^2)                % Display squared image (pixel-wise)
imagesc(log(I3))              % Display log of image (pixel-wise)
I3 = uint8(I3);               % Convert back to uint8 for writing
imwrite(I3, 'test.png')       % Save image as PNG

figure;
g = [1 2 1]' * [1 2 1] / 16;  % 3x3 Gaussian filter mask
I2 = double(I);               % Convert image to floating point
I3 = conv2(I2, g);            % Convolve image with filter mask
I3 = conv2(I2, g, 'same');    % Convolve image, but keep original size
subplot(1, 2, 1)              % Display original and filtered image

imagesc(I);                   %   side-by-side
axis square;
colormap gray;
subplot(1, 2, 2)
imagesc(I3);
axis square;
colormap gray;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
