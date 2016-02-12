function OCR_Recogition_Training(training_Features, training_features_length, class_Labels, training_file_count)

D = dist2(training_Features, training_Features);
figure('name','Affinity Matrix');
imagesc(D);
title('Affinity Matrix');

[D_sorted, D_index] = sort(D,2);
result_classes = [];
for i = 1:training_features_length
    result_classes=[result_classes; class_Labels(D_index(i,2))];
end

conf = ConfusionMatrix(class_Labels, result_classes, training_file_count);
average_recogniation_rate = trace(conf) /16;
disp(average_recogniation_rate);
figure('name','ConfusionMatrix');
imagesc(conf);
title('ConfusionMatrix');
disp('Training rates')
for i = 1: training_file_count
    X = ['Training Rate for label ', int2str(i), ' is ',int2str(conf(i,i))];
    disp(X);
end
end