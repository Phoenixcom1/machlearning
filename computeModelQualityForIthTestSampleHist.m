function [ p ] = computeModelQualityForIthTestSampleHist( data_vector, total_binsNr, testsample )
%COMPUTEMODELQUALITYFORITHTESTSAMPLEHIST This function generates a histogramm
% using the given data_vector with the specified number of bins and returns
% the probability p of the bin into which the specified value falls.
[H,X] = hist(data_vector, total_binsNr);
centerOfClosestBin = findClosestBinForSample(X, testsample);

%Height of bin must be diveded by 10000 to correct the position of the
%comma because the value vector H of hist() gives roundet
%values???????????????????
p = (giveHeigtOfRatedBin(H, X, centerOfClosestBin))/10000;


%disp('computeModelQualityForIthTestSampleHist has not yet been implemented');

end

