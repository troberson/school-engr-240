 Problem 1: Secant Method 
 ------------------------

 Write a function m-file that implements the secant method. Your function
 should accept the following inputs (in order):

1. A function defining the roots problem
2. A vector of two initial guesses (first element is the first guess, second
   element is second guess)
3. A stopping criterion ( es ) for the numerical solution with a default value
   of 1e-5
4. A maximum iteration count for the numerical solution with a default value
   of 30
5. An arbitrary number of parameter values associated with the roots problem 

Your function should output the following four scalar outputs (in order):

1. The root estimate
2. The residual in the numerical solution
3. The approximate relative error in the numerical solution
4. The number of iterations required for convergence

I recommend you use the examples `newtonraphson.m` and/or `bisect_param.m` as
starting points from which you develop your own function mfile for the secant
method.

Note: Test cases 3, 4, and 5 test the functionality of the default values for unspecified inputs and the parameter passing through `varargin`.
