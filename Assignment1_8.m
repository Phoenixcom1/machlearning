tic
disp('Programmstart')
clear
energyDataTraining = importdata('energyDataTrain.mat');

%lower boundary number of bins
lbBins = 66;
%upper boundary number of bins
ubBins = 200;
%total number of bins
total_binsNr = ubBins-lbBins;

%lower boundary kernel bandwidth
lbBandwidth = 25;
%upper boundary kernel bandwidth
ubBandwidth = 75;

%setup model quality vector histogramm
mqvHist = zeros(ubBins-lbBins, 2); % is zeros() a good idea?
%setup model quality vector KDE
mqvKDE = zeros(ubBandwidth-lbBandwidth, 2);
%setup model quality vector entry
%mqe = 0;

[mqvHist_rows,mqvHist_colums] = size(mqvHist);
[mqvKDE_rows, mqvKDE_columns] = size(mqvKDE);

matlabpool('open',4);


%compute model qualities histogramm
parfor i = 1:mqvHist_rows;
    numberOfBins = lbBins + i - 1;
%     disp(['Evaluating HIST with ' num2str(numberOfBins) ' bins']);
    modelQuality = leaveOneOutCrossValidation(energyDataTraining, numberOfBins);
%     disp(['Model quality ' num2str(numberOfBins) ' bins: ' num2str(modelQuality)]);
    mqvHist(i,:) = [modelQuality,numberOfBins];
end

%compute model qualities KDE
parfor bandwidthIteration = 1:mqvKDE_rows
    mqe = 0;
    bandwidth = lbBandwidth + bandwidthIteration;
%     disp(['Evaluating KDE with bandwidth: ' num2str(bandwidth)]);
    for i = 1:length(energyDataTraining) % leave-on-out cross validation loop
%         disp(['Leaving out ' num2str(i) 'th element']);
        temp = removeIthElement(energyDataTraining, i);
        mqe = mqe + computeModelQualityForIthTestSampleKDE(temp, bandwidth, energyDataTraining(i));
%         disp(['Current model quality: ' num2str(mqe)]);
    end
%     disp(['Model quality ' num2str(bandwidth) ' bandwidth: ' num2str(mqe)]);
    mqvKDE(bandwidthIteration,:) = [mqe,bandwidth];
end

matlabpool('close');

%plot model quality for histogramm
disp('plot model quality for histogramm not yet implemented');

%plot model quality for KDE
disp('plot model quality for KDE not yet implemented');

disp('Programmende')
toc
