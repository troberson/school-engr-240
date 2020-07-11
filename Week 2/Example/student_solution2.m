function velocities = student_solution2(t, burn_time)
    velocities = zeros(size(t))';

    range1 = 0 <= t & t <= 10;
    range2 = 10 <= t & t <= 20;
    range3 = 20 <= t & t <= burn_time;
    range4 = t > burn_time;

    t1 = t(range1);
    t2 = t(range2);
    t3 = t(range3);
    t4 = t(range4);

    velocities(range1) = 11 * t1 .^ 2 - 5 * t1;
    velocities(range2) = 1100 - 5 * t2;
    velocities(range3) = 50 * t3 + 2 * (t3 - 20) .^ 2;
    velocities(range4) = (50 * burn_time + 2 * (burn_time - 20) ^ 2) ...
                            * exp(-0.2 * (t4 - burn_time));
end
