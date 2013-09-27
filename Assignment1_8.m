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
mqvKDE = zeros(ubBandwidth-lbBandwidth+1, 1);
%setup model quality vector entry
%mqe = 0;

[mqvHist_rows,mqvHist_colums] = size(mqvHist);

%matlabpool('open',5);


%compute model qualities histogramm
for i = 1:mqvHist_rows;
    numberOfBins = lbBins + i - 1;
    disp(['Evaluating HIST with ' num2str(numberOfBins) ' bins']);
    modelQuality = leaveOneOutCrossValidation(energyDataTraining, numberOfBins);
    disp(['Model quality ' num2str(numberOfBins) ' bins: ' num2str(modelQuality)]);
    mqvHist(i,1) = modelQuality;
    mqvHist(i,2) = numberOfBins;
end

%matlabpool('close');

% %compute model qualities KDE
% for bandwidth = lbBandwidth:ubBandwidth
%     mqe = 0;
%     for i = 1:length(energyDataTrain) % leave-on-out cross validation loop
%         temp = removeIthElement(energyDataTrain, i);
%         mqe = mqe + computeModelQualityForIthTestSampleKDE(temp, bandwidth, i);
%     end
%     mqvKDE(bandwidth-lbBandwidth) = mqe;
% end

%plot model quality for histogramm
disp('plot model quality for histogramm not yet implemented');

%plot model quality for KDE
disp('plot model quality for KDE not yet implemented');

disp('Programmende')
toc
