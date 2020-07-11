function velocities = student_solution1(times, burn_time)
    velocities = zeros(length(times), 1);

    for idx = 1:length(times)
        t = times(idx);

        if 0 <= t && t <= 10
            velocities(idx) = 11*t^2-5*t;
        elseif 10 <= t && t <= 20
            velocities(idx) = 1100 - 5*t;
        elseif 20 <= t && t <= burn_time
            velocities(idx) = 50*t + 2*(t - 20)^2;
        elseif t > burn_time
            velocities(idx) = (50 * burn_time + 2*(burn_time - 20)^2) * exp(-0.2*(t - burn_time));
        else
            velocities(idx) = 0;
        end
    end
end
