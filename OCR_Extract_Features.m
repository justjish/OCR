% OCR_Extract_Features
%
% Function takes an image and returns the features from that image.
%
% Usage: Features = OCR_Extract_Features(im, display)
%
% Args: im      = an image already read
%       display = display the various changes in the image; 0 for display, 1 for no display
%
% Returns: Features
%
function [num_of_components, Features, LocationList, L] = OCR_Extract_Features(im, Features, display)
num_of_components = 0;
if (display == 0)
    figure('name', 'Original Image');
    imshow(im);
end

% Visualizing a Histogram/Vector
if (display == 0)
    figure('name', 'Intensity Histogram');
    h = hist(double(reshape(im, numel(im), 1)),[0:1:255]);
    plot(h(1:255));
    title('Intensity Histogram');
end


%Binarization by Thresholding
[~,~,d] = size(im);
if (d == 3)
    im2 = rgb2gray(im);
    th = multithresh(im2);
    im2 = uint8(im2 < th);
else
    th = multithresh(im);
    im2 = uint8(im < th);
end
se = strel('disk', 1);
im2 = imclose(im2,se);


%Displaying Binary Image
if (display == 0)
    figure('name', 'Binary Image');
    title('Binary Image');
    colormap gray;
    imagesc(~im2);
end

%Get Components

L = bwlabel (im2);

%Visualize Component Image
if (display == 0)
    figure('name', 'Connected Components');
    imagesc(L);
    title('Connected Components');
end

counter = 0;
LocationList = [];
Nc=max(max(L));
if (display == 0)
    figure('name', 'BoundingBox');
    imagesc(L);
    hold on;
end

for i=1:Nc;
    [r,c]=find(L==i);
    maxr=max(r);
    minr=min(r);
    maxc=max(c);
    minc=min(c);
    diffc = maxc-minc;
    diffr = maxr-minr;
    if ( diffc > 10 &&  diffr> 10 && diffc < 100 && diffr < 100)
        num_of_components = num_of_components + 1;
        cim = im2(minr-1:maxr+1,minc-1:maxc+1);
        counter = counter + 1;
        [centroid, theta, roundness, inmo] = moments(cim, 1);
        Features = [Features; theta, roundness, inmo];
        LocationList = [LocationList;counter, [minr,minc,maxr,maxc]];
        if (display == 0) 
             rectangle('Position',[minc,minr,maxc-minc+1,maxr-minr+1], 'EdgeColor','w', 'Tag',int2str(counter));
        end
    end
end
if (display == 0)
    hold off;
end

end

