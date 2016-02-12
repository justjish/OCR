function [features_length, Features, file_count, Class_Labels] = OCR_Extract_Data_From_Files(folder_path, display)
testing_files = dir(strcat(folder_path, '*.bmp'));
file_count = length(testing_files);

Features = [];
Class_Labels = [];

features_length = 0;
for i=1:file_count
    currFN = testing_files(i).name;
    currIM = imread(strcat(folder_path, currFN));
    [features_added, Features] = OCR_Extract_Features(currIM, Features, display);
    features_length = features_length + features_added;
    for j=(features_length - features_added + 1):features_length
        Class_Labels = [Class_Labels; i];
    end
end