%ENGR 240 PA2 Sine Problem 
%required m-files
%  - PA2_sine.p

clear all

student_solution = @(angle, N) sine_approx(angle, N);

urlwrite('https://drive.google.com/uc?export=download&id=0BwwLB5_Kft3dSkhjN0FLQzlaN28','./PA2_sine.p');
addpath('.');

%first test case (first sum)
[y_correct1, y_correct2, y_correct3] = PA2_sine(pi/6,1);
[student_sol1, student_sol2, student_sol3] = student_solution(pi/6,1);
%test vector length
assert(isequal(size(student_sol1),size( y_correct1)),'Output 1 should be a scalar for this test case')
assert(isequal(size(student_sol2),size( y_correct2)),'Output 2 should be a scalar for this test case')
assert(isequal(size(student_sol3),size( y_correct3)),'Output 3 should be a scalar for this test case')
%test accuracy
test1 = max(abs((y_correct1 - student_sol1)./y_correct1));
assert(le(test1,1e-5),'Output 1 is numerically incorrect')
test2 = max(abs((y_correct2 - student_sol2)./y_correct2));
assert(le(test2,1e-5),'Output 2 is numerically incorrect')
test3 = max(abs((y_correct3 - student_sol3)./y_correct3));
assert(le(test3,1e-3),'Output 3 is numerically incorrect')


%second test case (two sums)
[y_correct1, y_correct2, y_correct3] = PA2_sine(pi/4,2);
[student_sol1, student_sol2, student_sol3] = student_solution(pi/4,2);
%test vector length
assert(isequal(size(student_sol1),size( y_correct1)),'Output 1 should be a 2-element column vector for this test case')
assert(isequal(size(student_sol2),size( y_correct2)),'Output 2 should be a 2-element column vector for this test case')
assert(isequal(size(student_sol3),size( y_correct3)),'Output 3 should be a 2-element column vector for this test case')
%test accuracy
test1 = max(abs((y_correct1 - student_sol1)./y_correct1));
assert(le(test1,1e-5),'One or more values in output 1 is numerically incorrect')
test2 = max(abs((y_correct2 - student_sol2)./y_correct2));
assert(le(test2,1e-5),'One or more values in output 2 is numerically incorrect')
test3 = max(abs((y_correct3 - student_sol3)./y_correct3));
assert(le(test3,1e-3),'One or more values in output 3 is numerically incorrect')


%third test case (ten sums)
[y_correct1, y_correct2, y_correct3] = PA2_sine(7*pi/5,10);
[student_sol1, student_sol2, student_sol3] = student_solution(7*pi/5,10);
%test vector length
assert(isequal(size(student_sol1),size( y_correct1)),'Output 1 should be a 10-element column vector for this test case')
assert(isequal(size(student_sol2),size( y_correct2)),'Output 2 should be a 10-element column vector for this test case')
assert(isequal(size(student_sol3),size( y_correct3)),'Output 3 should be a 10-element column vector for this test case')
%test accuracy
test1 = max(abs((y_correct1 - student_sol1)./y_correct1));
assert(le(test1,1e-5),'One or more values in output 1 is numerically incorrect')
test2 = max(abs((y_correct2 - student_sol2)./y_correct2));
assert(le(test2,1e-5),'One or more values in output 2 is numerically incorrect')
test3 = max(abs((y_correct3 - student_sol3)./y_correct3));
assert(le(test3,1e-3),'One or more values in output 3 is numerically incorrect')


%fourth test case (negative x value)
[y_correct1, y_correct2, y_correct3] = PA2_sine(-9*pi/7,12);
[student_sol1, student_sol2, student_sol3] = student_solution(-9*pi/7,12);
%test vector length
assert(isequal(size(student_sol1),size( y_correct1)),'Output 1 should be a 12-element column vector for this test case')
assert(isequal(size(student_sol2),size( y_correct2)),'Output 2 should be a 12-element column vector for this test case')
assert(isequal(size(student_sol3),size( y_correct3)),'Output 3 should be a 12-element column vector for this test case')
%test accuracy
test1 = max(abs((y_correct1 - student_sol1)./y_correct1));
assert(le(test1,1e-5),'One or more values in output 1 is numerically incorrect')
test2 = max(abs((y_correct2 - student_sol2)./y_correct2));
assert(le(test2,1e-5),'One or more values in output 2 is numerically incorrect')
test3 = max(abs((y_correct3 - student_sol3)./y_correct3));
assert(le(test3,1e-3),'One or more values in output 3 is numerically incorrect')
