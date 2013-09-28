function [ energyP ] = generateVectorForExercise9( dataVector, bandwidth )

energyP = zeros(6000,1);

pd = fitdist(dataVector,'kernel','kernel','normal','support','unbounded','width',bandwidth);

for i = 2000:7999
    energyP(i - 1999) = pdf(pd, i);
end

end

