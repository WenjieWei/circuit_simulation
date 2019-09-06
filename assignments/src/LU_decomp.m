%% LU Decomposition
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function performs the LU Decomposition of the general matrix form:
% Ax = b,
% Where A is an n-by-n P.D. matrix, and b is an n-by-1 vector. 
% Solution to be found is x, which is also an n-by-1 vector. 
% 
% Input arguments: matrix A, vector b. 
% Return values: solution vector x, and status flag. 
%
% Development environment: MatLab 2017b.
% Author: Wenjie Wei, McGILL ID: 260685967
% Updated: Sept. 6, 2019
% Revision: v1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
function x = LU_decomp(A, b)
    if ~dimensionCheck(A, b)
        disp('LU decomposition not successful because dimensions of A and b do not agree. Terminating.')
        return;
    end
    
    rows = size(A, 1);
    columns = size(A, 2);
    x = zeros(rows, 1);
end

%% Dimension Check
function pass = dimensionCheck(A, b)
    pass = true;
    
    if size(A, 1) ~= size(A, 2) || size(A, 1) ~= size(b, 1)
        pass = false;
    end
end















