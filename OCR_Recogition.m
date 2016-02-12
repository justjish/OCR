% To begin use either 'test1.bmp' or 'test2.bmp' as the filename input for
% this function. 
function OCR_Recogition (filename)
im = imread(filename);
imshow(im);
[training_features_length, training_Features, training_file_count, class_Labels] = OCR_Extract_Data_From_Files('training/', 1);

testing_Features = [];
[testing_features_length, testing_Features, LocationList, L] = OCR_Extract_Features(im, testing_Features, 1);

M = mean(training_Features);
S = std (training_Features, 0, 1);

%Normalize All Extracted Features
for i=1:6
    testing_Features(:,i) = (testing_Features(:,i) - M(i)) / S(i);
    training_Features(:,i) = (training_Features(:,i) - M(i)) / S(i);
end

D = dist2(testing_Features,training_Features);
[D_sorted, D_index] = sort(D,2);
result_classes = [];
for i = 1:testing_features_length
    LocationList(i,6) = class_Labels(D_index(i,1));
    result_classes=[result_classes; class_Labels(D_index(i,1))];
end

OCR_Recogition_Training(training_Features, training_features_length, class_Labels, training_file_count)
result_letter = OCR_Number_to_Letter(result_classes);

disp(LocationList);

figure
imagesc(L);
hold on;
for i = 1:testing_features_length
    minr=LocationList(i,2);
    minc=LocationList(i,3);
    maxr=LocationList(1,4);
    maxc=LocationList(i,5);
    text(minc,minr, result_letter(i), 'Color', 'w', 'FontSize', 30);
end
BoundingBox(L);
hold off;