function [ bin_height ] = sortSampleIntoBin( input_histogram, sample_value )
%SORTSAMPLEINTOBIN This function searchs into a given histogram for the bin in which the sample_value fits best and returns the heights of the bin after putting the sample into it.

tmp = abs(input_histogram-sample_value)
[idx idx] = min(tmp) %index of closest value
closest = input_histogram(idx) %closest value