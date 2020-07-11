% Setup
t = -100:10000000;
burn_time = 9000000;

impl1 = @() student_solution1(t, burn_time);
impl2 = @() student_solution2(t, burn_time);

% Raw (for Profiler)
% impl1();
% impl2();

% Timed Runs
t1 = timeit(impl1);
fprintf('Implementation 1: %s\n', t1);

t2 = timeit(impl2);
fprintf('Implementation 2: %s\n', t2);
