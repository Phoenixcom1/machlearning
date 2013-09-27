function [ model_quality ] = leaveOneOutCrossValidation( dataToValidate, total_binsNr )
mqe=0;
for i = 1:length(dataToValidate); % leave-on-out cross validation loop
        temp = removeIthElement(dataToValidate, i);
        p = computeModelQualityForIthTestSampleHist(temp, total_binsNr, dataToValidate(i));
        mqe = mqe + log(p);
        % disp(['i = ' num2str(i) ', p = ' num2str(p) ', mqe = ' num2str(mqe)]);
end
model_quality = mqe;