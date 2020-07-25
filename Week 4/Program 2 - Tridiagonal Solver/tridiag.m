function [x, diagonal_dominance, norm_of_residuals] = tridiag(diag_values, RHS_vector)
% TRIDIAG - Solve a triadiagonal matrix created from three values
%
% Inputs:
%   diag_values: a three-element row vector, whose values will be along the
%       diagonals of the matrix
%   RHS_vector: a column vector on the right hand side of the equation Ax=b
%
% Outputs:
%   x: a column vector of the solution to the matrix
%   diagonal_dominance: 1 if the resulting matrix is diagonally dominant,
%       0 otherwise
%   norm_of_residuals: the Euclidean norm of the residual values

    % Argument checks
    narginchk(2, 2);

    if ~isrow(diag_values) || length(diag_values) ~= 3
        error('diag_values must be a three-element row vector');
    end

    if isempty(RHS_vector)
        error('RHS_vector may not be empty');
    end

    % The solver will stop when successive results are within this tolerance
    es = 1e-5;

    % The coefficient matrix will be a square matrix corresponding to the
    % size of the RHS_vector
    matrix_size = length(RHS_vector);

    % Set up a tridiagonal sparse matrix in which the three elements of
    % diag_values are extended along the diagonals (below, main, above).
    diag_elems = repmat(diag_values, matrix_size, 1);
    coeff_matrix = spdiags(diag_elems, -1:1, matrix_size, matrix_size);

    % Check for diagonal dominance
    % A matrix is diagonally dominant if the absolute value of all the elements
    % along the diagonal are greater than the sum of the absolute value of the 
    % other elements in the row. Doubling the diagonal works around including
    % the diagonal elements in the sum.
    diagonal_dominance = all(2*abs(diag(coeff_matrix)) > sum(abs(coeff_matrix), 2));

    % Approximate the solution to the matrix using Gauss-Siedel
    % Starting approximations are 0 for all values of x
    % The stopping tolerance is 1e-5.
    [x, ~] = GS(coeff_matrix, RHS_vector, zeros(matrix_size, 1), es);

    % Calculate the residuals remaining from the approximation of the solution
    % The norm is used as a check -- the smaller the norm, the closer the 
    % overall approximation.
    residuals = RHS_vector - coeff_matrix * x;
    norm_of_residuals = norm(residuals);
end
