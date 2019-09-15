clear;
clc;
close all;

% Random Tester Matrices. 
for testcase = 1:10
    disp(['Verifying random tester matrix ' 'No.' num2str(testcase)]);
    
    size = randi([3, 10]);    
    mat = randi(50, size, size);
    
    [L, U] = doolittleLU(mat);
    [L1, U1] = gaussianLU(mat);
    result = L*U;
    result1 = L1*U1;
    
    for i = 1:size
        for j = 1:size
            if round(result(i, j), 2) ~= round(mat(i, j), 2)                
                disp(['Doolittle for mat' ' ' num2str(testcase) ' ' 'failed.'])
            end
            
            if round(result1(i, j), 2) ~= round(mat(i, j), 2)                
                disp(['Gaussian for mat' ' ' num2str(testcase) ' ' 'failed.'])
            end
        end
    end
    
    disp([num2str(testcase) ' ' 'successful.'])
end
 