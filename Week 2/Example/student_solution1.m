% TEST 1
t = 5; TB = 30;
[y_correct1] = rocket(t,TB);
[student_sol1] = student_solution(t,TB);
%test vector length
assert(isequal(size(student_sol1),size( y_correct1)),'Output should be a scalar for this test case')
%test accuracy
test1 = max(abs(y_correct1 - student_sol1));
assert(le(test1,1e-4),'Output is numerically incorrect')

% TEST 2
t = 27; TB = 25;
[y_correct2] = rocket(t,TB);
[student_sol2] = student_solution(t,TB);
%test vector length
assert(isequal(size(student_sol2),size( y_correct2)),'Output should be a scalar for this test case')
%test accuracy
test2 = max(abs(y_correct2 - student_sol2));
assert(le(test2,1e-4),'Output is numerically incorrect')

% TEST 3
t = -5:0.1:40;
TB = 30;
[y_correct3] = rocket(t,TB);
[student_sol3] = student_solution(t,TB);
%test vector length
assert(isequal(size(student_sol3),size( y_correct3)),'Output should be a column vector')
%test accuracy
test3 = max(abs(y_correct3 - student_sol3));
assert(le(test3,1e-4),'One or more elements in the output vector is numerically incorrect')


% Solution
function velocities = student_solution(times, burn_time)
    velocities = ones(length(times), 1);

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
