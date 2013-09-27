function [ idx ] = findClosestBinForSample( input_histogram, sample_value )
%SORTSAMPLEINTOBIN This function searchs into a given histogram for the bin in which the sample_value fits best and returns it.

%creats a vector with absolute values from the histogram_vector after
%substracting the sample value from each
absoluteValues = abs(input_histogram-sample_value);

%returns the index from the minimal entry from the absolute value ->
%closest bin >= 0
[~, idx] = min(absoluteValues);

%gives the center of the closest bin
%closest_Bin = input_histogram(idx);