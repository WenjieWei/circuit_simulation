%% LU Decomposition using Doolittle's Algorithm
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function performs the LU Decomposition of square matrix A, using 
% the Gaussian version of Doolittle's algorithm.
%
% A is an n-by-n P.D. matrix. 
% Solutions to be found are L and U, where L is a lower-triangle square 
% matrix and U is an upper-triangle matrix such that L * U = A. 
% 
% Input arguments: matrix A. 
% Return values: decomposed L and U matrices. 
%
% Matlab version used: 2017b.
% Author: Wenjie Wei, McGILL ID: 260685967
% Updated: Sept. 11, 2019
% Revision: v1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Perform the decomposition.
function [L, U] = gaussianLU(A)
    % Check if matrix A is a square matrix. 
    % Stop execution if A is not square, or if the size of A is less than 2. 
    if size(A, 1) ~= size(A, 2)
        disp('Matrix A must be a square matrix. Exiting.')
        return;
    elseif size(A, 1) == 1
        L = A(1, 1);
        U = A(1, 1);
    end
    
    % Record the dimension of the matrix, pre-allocate memory for L and U.
    n = size(A, 1);
    L = eye(n);
    U = zeros(n, n);
    
    % Start of iteration. Pick the pivot first. 
    for pivot = 1:n
        % Divide the first column by the pivot. 
        A((pivot+1):n, pivot) = A((pivot+1):n, pivot) / A(pivot, pivot);
        L((pivot+1):n, pivot) = A((pivot+1):n, pivot);
        U(pivot, pivot:n) = A(pivot, pivot:n);
        
        % All entries in the sub-matrix will be overwritten following:
        % a_ij = a_ij - a_ik * a_kj, where k is the pivot position. 
        for i = (pivot + 1):n
            for j = (pivot + 1):n
                A(i, j) = A(i, j) - (A(i, pivot) * A(pivot, j));
            end
        end
    end
end
















