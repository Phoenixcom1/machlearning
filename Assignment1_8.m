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

matlabpool('open',5);


%compute model qualities histogramm
parfor binNr = 1:mqvHist_rows;
    modelQuallity = leaveOneOutCrossValidation(energyDataTraining, total_binsNr);
    mqvHist(binNr, :) = [modelQuallity,binNr];
end

matlabpool('close');

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
