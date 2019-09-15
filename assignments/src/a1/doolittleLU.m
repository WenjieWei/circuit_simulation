%% LU Decomposition using Doolittle's Algorithm
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function performs the LU Decomposition of square matrix A, using 
% Doolittle's algorithm.
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
% Updated: Sept. 10, 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Perform the decomposition.
function [L, U] = doolittleLU(A)    
    % Check if matrix A is a square matrix. 
    % Stop execution if A is not square, or if the size of A is less than 2. 
    if size(A, 1) ~= size(A, 2)
        disp('Matrix A must be a square matrix. Exiting.')
        return;
    elseif size(A, 1) == 1
        L = A(1, 1);
        U = A(1, 1);
    end
    
    % Pre-allocate memory space for L and U matrices. 
    n = size(A, 1);
    
    L = eye(n);
    U = zeros(n, n);
    
    %% Compute the first row of U and first column of L. 
    % Compute the first row of U. 
    % From Doolittle's algorithm, u_1j = a_1j
    for j = 1:n
        U(1, j) = A(1, j);
    end
    
    % Compute the first column of L. 
    % From Doolittle's algorithm, l_i1 = a_i1 / u_11.
    for i = 2:n
        L(i, 1) = A(i, 1) / U(1, 1);
    end
    
    %% Compute the rows and columns that follow.     
    for pivot = 2:n
        % pivot is the position on the diagonal. 
        % Compute the entries of U first. 
        % u_ik = a_ik - sum_{m=1}^{i-1} l_im*u_mk, k = i,..., n.
        i = pivot;
        for k = i:n
            tempSum = 0;
            for m = 1:(i - 1)
                tempSum = tempSum + (L(i, m) * U(m, k));
            end
            U(i, k) = A(i, k) - tempSum;
        end
        
        % Compute entries for L. 
        % l_kj = (a_kj - sum_{m=1}^{j-1}l_km*u_mj)/u_jj, k = (j+1),...,n
        j = pivot;
        for k = (j + 1):n
            tempSum = 0;
            for m = 1:(j - 1)
                tempSum = tempSum + (L(k, m) * U(m, j));
            end
            L(k, j) = (A(k, j) - tempSum) / U(j, j);
        end
    end
end















