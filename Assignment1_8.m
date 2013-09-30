tic
disp('Programmstart')
clear
energyDataTraining = importdata('energyDataTrain.mat');

%lower boundary number of bins
lbBins = 1;
%upper boundary number of bins
ubBins = 17520;
%total number of bins
total_binsNr = ubBins-lbBins;

%lower boundary kernel bandwidth
lbBandwidth = 1;
%upper boundary kernel bandwidth
ubBandwidth = 17000;

%setup model quality vector histogramm
mqvHist = zeros(((ubBins-lbBins)/10), 2); % is zeros() a good idea?
%setup model quality vector KDE
mqvKDE = zeros((ubBandwidth-lbBandwidth)/1000, 2);
%setup model quality vector entry
%mqe = 0;

[mqvHist_rows,mqvHist_colums] = size(mqvHist);
[mqvKDE_rows, mqvKDE_columns] = size(mqvKDE);

matlabpool('open',8);

% disp('starting Hist calc')
% %compute model qualities histogramm
% parfor i = 1:mqvHist_rows;
%     numberOfBins = ((lbBins + i)*10) - 1;
% %     disp(['Evaluating HIST with ' num2str(numberOfBins) ' bins']);
%     modelQuality = leaveOneOutCrossValidation(energyDataTraining, numberOfBins);
% %     disp(['Model quality ' num2str(numberOfBins) ' bins: ' num2str(modelQuality)]);
%     mqvHist(i,:) = [modelQuality,numberOfBins];
% end

disp('starting KDE calc')
%compute model qualities KDE
parfor bandwidthIteration = 1:mqvKDE_rows
    mqe = 0;
    bandwidth = (lbBandwidth + bandwidthIteration)*1000;
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
