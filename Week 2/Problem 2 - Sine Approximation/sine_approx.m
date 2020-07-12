function [series_sums, approx_rel_error, true_rel_error] = ...
sine_approx(angle, number_of_sums)
    % SINE_APPROX   Approximate the sine of an angle using a MacLaurin series
    %   [series_sums, approx_rel_error, true_rel_error] = sine_approx(angle, number_of_sums)
    %
    %   INPUT
    %       angle               Angle in radians.
    %       number_of_sums      Number of sums used to calculate the approximation
    %
    %   OUPUT
    %       series_sums         Successive approximations of the sine.
    %       approx_rel_error    Successive approximate relative error (0 to 1).
    %       true_rel_error      Successive true relative error (0 to 1).

    % Both parameters are required
    narginchk(2, 2);

    if number_of_sums < 1
        error('Must calculate at least 1 sum.');
    end

    % Only up to 170 sums may be calculated
    if isinf(factorial(number_of_sums))
        error('Number of sums is beyond Matlab capabilities (max: 170)');
    end

    % In the MacLaurin series for sine, the successive coefficients alternate
    % signs and are 1/x! where x are positive odd integers. Thus
    %   sin(x) ~= x - (1/3!)*x^3 + (1/5!)*x^5 - (1/7!)*x^7 + ...
    % Here we construct a vector of coefficients for the polyval() function.
    coeffs = zeros(2*(number_of_sums+1), 1); % preallocate vector
    for i = 0:number_of_sums
        coeffs(2*(number_of_sums-i) + 1) = (-1)^i * 1/factorial(2*i + 1);
    end

    % === Approximation ===
    % Store the results of successive calculations.
    % Since the coefficients are stored with the coefficient for the largest
    % power of x first, we walk back from the end.
    series_sums = arrayfun(@(i) polyval(coeffs(i:end), angle), ...
        (2*number_of_sums - 1 : -2 : 1)');

    % === Approximate relative error ===
    % For each successive calculation, this is the ratio of the difference
    % between the current and previous calculation to the current calculation.
    approx_rel_error = abs(diff([angle; series_sums]) ./ series_sums);

    % === True relative error ===
    % This is the ratio of the difference between the built-in Matlab sine
    % function and our approximation to the built-in function.
    true_val = sin(angle);
    true_rel_error = (true_val - series_sums)/true_val;
end
