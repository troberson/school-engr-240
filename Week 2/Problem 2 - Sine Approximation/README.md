Problem 2: MacLaurin Series for Sine
------------------------------------

The Maclaurin series expansion for the sine function is:

> sin x = x - (x^3)/3! + (x^5)/5! - (x^7)/7! + (x^9)/9! - ...

where *x* is in radians. This function can be used to approximate the sine of
*x* with increasing accuracy as terms are added to the summation. Write a
function that accepts two scalar inputs (in order):

1. A value for *x* (in radians).

2. The number of series sums, *N*, to use in the series approximation of
   `sin(x)`.

Your function should generate the following three outputs (in order):

1. A column vector of the first *N* series summations. Consider the first
   summation to be `x-x^3/3!`.

2. A column vector of the magnitude (i.e. absolute value) of the *approximate*
   *relative error* values associated with the first *N* series summations.
   Note the "previous approximation" for the first value in this vector will be
   *x*.

3. A column vector of the *true relative error* values associated with the first
   *N* series summations. Use MATLAB's built-in sine function to compute the
   true value for this error calculation.

Note: The first two test cases test the results for the first and second series
sums respectively to aid in your debugging process.
