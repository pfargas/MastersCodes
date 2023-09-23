clear;
seed1 = 348713;
seed2 = 738131;

% generate 10 random numbers
r = raneq(10, seed1, seed2);
disp(r);


% define a function to generate a random number with the ranecu algorithm
function [result] = raneq(number, seed1, seed2)
% ranecu algorithm to generate random numbers
% number: the number of random numbers to generate
% seed1: the first seed
% seed2: the second seed
% result: the random numbers generated
% The method is from F. James, Comp. Phys. Comm. 60 (1990) 329-344. 
    result=ones(1,number);
    for i = 1:number
        seed1=40014*mod(seed1,53668)-floor(seed1/53668)*12211;
        if seed1<0
            seed1=seed1+2147483563;
        end
    
        seed2=40692*mod(seed2,52774)-floor(seed2/52774)*3791;
        if seed2<0
            seed2=seed2+2147483399;
        end

        r = seed1-seed2;
        if r<1
            r=r+2147483562;
        end
        result(i)=r/2147483563;
    end
    return
end
