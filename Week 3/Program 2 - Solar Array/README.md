Problem 2: Solar Array
----------------------

The power output of a solar cell varies with the voltage it supplies and the
temperature it operates at. The following model relates the Voltage at which a
solar cell produces maximum power (*V_mp*) to the operating
temperature (*T*) and the open circuit voltage (*V_OC*), which is
characteristic of a particular cell.

`exp(q * V_mp/(k_B * T)) * (1 + q * V_mp/(k_B * T)) = exp(q * V_OC/(k_B * T))`

The parameters *q* and *k_B* are the charge on an electron
(*q = 1.6022E-19 coulombs*) and the Boltzmann constant
(*k_B = 1.3806E-23 joules/kelvin*). Write a function that outputs
the voltage(s) for maximum power output (*V_mp*) given an input
vector of one or more temperatures and the open circuit voltage of the solar
cell. The function should accept the following inputs (in order):

1. A vector of one or more operating temperatures (*T*) in degrees kelvin
2. The open circuit voltage (*V_OC*) in volts
3. An initial guess for the numerical solution of *V_mp* in volts
4. A stopping criterion for the numerical solution

Your function should use `fzero` along with the input initial guess and
stopping criterion to solve for V_mp corresponding to each value in the input
vector of temperatures. Your function should have two outputs (in order):

1. A column vector of *V_mp* values corresponding to the input vector of
   operating temperatures
2. A column vector of residual values associated with the numerical solution
   for each value of *V_mp*

Note: The first test case is for a single operating temperature, so you can
make sure your function works for only scalar inputs before modifying it to
solve for *V_mp* for corresponding to a vector of temperatures.
