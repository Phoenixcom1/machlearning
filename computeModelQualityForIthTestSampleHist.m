function [ p ] = computeModelQualityForIthTestSampleHist( data_vector, total_binsNr, testsample )
%COMPUTEMODELQUALITYFORITHTESTSAMPLEHIST This function generates a histogramm
% using the given data_vector with the specified number of bins and returns
% the probability p of the bin into which the specified value falls.
[binHeights,binCenters] = hist(data_vector, total_binsNr);
indexOfMatchingBin = findClosestBinForSample(binCenters, testsample);
disp(['testsample ' num2str(testsample) ' - index of matching bin: ' num2str(indexOfMatchingBin)]);

%-----old------
%Height of bin must be divided by 10000 to correct the position of the
%comma because the value vector H of hist() gives roundet
%values???????????????????
%p = (giveHeigtOfRatedBin(H, X, centerOfClosestBin))/10000;
%---------------


%-----new------
%computation according to lecture 4, slide 4
binWidth = (max(data_vector) - min(data_vector))/total_binsNr;
disp(['testsample ' num2str(testsample) ' - binWidth: ' num2str(binWidth)]);
disp(['testsample ' num2str(testsample) ' - binHeight: ' num2str(binHeights(indexOfMatchingBin))]);
p = binHeights(indexOfMatchingBin) / (length(data_vector) * binWidth);
%--------------

end

