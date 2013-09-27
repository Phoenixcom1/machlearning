function [ p ] = computeModelQualityForIthTestSampleKDE( data_vector, bandwidth, value )
%COMPUTEMODELQUALITYFORITHTESTSAMPLEHIST This function generates a kernel
% density estimation using the given data_vector with the specified bandwidth 
% and returns the probability p of the specified value.

pd = fitdist(data_vector,'kernel','kernel','normal','support','unbounded','width',bandwidth);
pre_log_p = pdf(pd, value);
p = log(pre_log_p);
% disp(['Probability for value ' num2str(value) ' with bandwidth ' num2str(bandwidth) ': ' num2str(pre_log_p)]);

end