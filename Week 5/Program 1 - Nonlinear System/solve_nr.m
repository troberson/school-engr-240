function [x_sol, J_initial, residuals_norm, iter_count] = solve_nr(A, B, x_init, es)
% SOLVE_NR: solve a built-in system of equations for various parameters
%
% The system is:
%   exp(Ax) + y - 0.5y^2 - 2.5 = 0
%   By - 4cos(3 * sqrt(x)) = 0
%
% Input:
%   A: scalar value for the parameter A
%   B: scalar value for the parameter B
%   x_init: two-element column vector of initial guesses for x and y
%   es: tolerance between successive approximations (epsilon-s)
%
% Output:
%   x_sol: two-element column vector of solutions for x and y
%   J_initial: the Jacobian matrix evaluated at the initial guesses
%   residuals_norm: the Euclidean norm of the residuals associated with the solution
%   iter_count: the number of iterations required for convergence 

    % Argument checks
    narginchk(4, 4);

    if ~iscolumn(x_init) || length(x_init) ~= 2
        error('x_init must be a two-element column vector');
    end

    % The system of equations
    % x and y are replaced with x(1) and x(2)
    fun = @(x) ...
        [exp(A*x(1)) + x(2) - 0.5*x(2)^2 - 2.5;
        B*x(2) - 4*cos(3*sqrt(x(1)))];

    % The Jacobi matrix representation of the system of equations
    % Note that some definitions of the Jacobi matrix are transposed.
    jacobi = @(x) ...
        [A*exp(A*x(1)),                 1-x(2);
        6*sin(3*sqrt(x(1)))/sqrt(x(1)), B];

    % Evaluate the Jacobi matrix at the initial guesses
    J_initial = jacobi(x_init);

    % Use the Newton-Raphson method (in the NRsys function mfile) to
    % approximate the solution to the system of equations
    % The dropped output variable is epsilon-a, the approximate relative error
    [x_sol, residuals, ~, iter_count] = NRsys(fun, jacobi, x_init, es);

    % Calculate the Euclidean norm of the residuals vector
    residuals_norm = norm(residuals);
end
