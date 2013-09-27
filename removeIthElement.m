function [ output_vector ] = removeIthElement( input_vecotr, i )
%REMOVEITHELEMENT This function returns a copy of the input_vector without 
% the i-th element
% disp('inputVector:')
% disp(input_vecotr)

temp_vec = input_vecotr(1:i-1);
temp_vec2 = input_vecotr(i+1:end);

output_vector = [temp_vec; temp_vec2];

% disp('outputVector:')
% disp(output_vector)
end

