student_solution = @(t, TB) student_solution2(t, TB);

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
