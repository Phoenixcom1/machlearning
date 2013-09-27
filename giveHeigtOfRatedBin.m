function [ bin_height ] = giveHeigtOfRatedBin( value_vector, center_vector, sample_bin_center )
%GIVEHEIGHTOFRATEDBIN uses the sample_bin_center to rate the sample bin in
%the value_vector over the index from the center_vector

%creats a vector with absolute values from the center_vector after
%substracting the sample_bin_center value from each
absoluteCenters = abs(center_vector-sample_bin_center);

%returns the index from the minimal entry from the absoluteCenters vector
%-> should be 0 for the sample_bin
[index, index] = min(absoluteCenters);

%increases the sample_bin by one to rate the sample bin in it
value_vector(index) = value_vector(index)+1;

%gives the absolute height of the rated bin
bin_height = value_vector(index);