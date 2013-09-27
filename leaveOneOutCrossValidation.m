function [ modle_quallity ] = leaveOneOutCrossValidation( dataToValidate, total_binsNr )
mqe=0;
for i = 1:length(dataToValidate); % leave-on-out cross validation loop
        temp = removeIthElement(dataToValidate, i);
        mqe = mqe + computeModelQualityForIthTestSampleHist(temp, total_binsNr, dataToValidate(i));
end
modle_quallity = mqe;