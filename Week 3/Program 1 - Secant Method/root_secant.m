function [xroot,residual,ea,iter_count] = root_secant(fun,xi,es,max_it,varargin)
% Root finder based on secant method
%
% Inputs
%   fun: handle to the function to solve
%   xi: vector of two initial guesses
%   es: stopping criterion for the numerical solution (default: 1e-5)
%   max_it: maximum number of iterations for the numerical solution (defualt: 30)
%   varargin: parameters to pass to the given function
%
% Outputs
%   xroot: root estimate
%   residual: residual in the numerical solution
%   ea: approximate relative error in the numerical solution
%   iter_count: number of iterations required for convergence

    % Validate inputs and set default values
    narginchk(2, inf);
    assert(length(xi) == 2, 'The xi vector must contain exactly two elements.');

    if isempty(es)
        es = 1e-5;
    end

    if isempty(max_it)
        max_it = 30;
    end

    % Given function with applied parameters
    f = @(x) fun(x, varargin{:});

    % Apply given function to the initial guesses
    fvals = arrayfun(f, xi);

    % Loop up to max_it times
    for iter_count = 1:max_it
        % Calculate next root value estimate
        xroot = xi(2) - fvals(2)*diff(xi)/diff(fvals);

        % Residual value of f(x) at the current estimate
        residual = f(xroot);

        % Shift new values into the xi and fvals vectors
        xi = [xi(2) xroot];
        fvals = [fvals(2) residual];

        % Check if approximate relative error (ea) is within tolerance (es)
        ea = diff(xi)/xroot;
        if abs(ea) <= es
            break
        end
    end
end
