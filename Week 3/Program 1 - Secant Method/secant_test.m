%ENGR 240 PA3 Secant Method Problem
%required m-files
%  - PA3_secant.p

clear all
urlwrite('https://drive.google.com/uc?export=download&id=0BwwLB5_Kft3dYktSODI3QURPNTQ','./PA3_secant.p');
addpath('.');

%first test case
f = @(x) sin(2*x) - tan(x/4);
[y_correct1, y_correct2, y_correct3, y_correct4] = PA3_secant(f, [1 1.1], 1e-3, 50);
[student_sol1, student_sol2, student_sol3, student_sol4] = student_solution(f, [1 1.1], 1e-3, 50);

%test accuracy
test1 = max(abs(y_correct1 - student_sol1)./y_correct1);
assert(le(test1,1e-6),'Output 1 (root estimate) is numerically incorrect')
test2 = max(abs(y_correct2 - student_sol2)./y_correct2);
assert(le(test2,1e-6),'Output 2 (residual) is numerically incorrect')
test3 = max(abs(y_correct3 - student_sol3)./y_correct3);
assert(le(test3,1e-6),'Output 3 (approx relative error) is numerically incorrect')
test4 = max(abs(y_correct4 - student_sol4)./y_correct4);
assert(le(test4,1e-6),'Output 4 (iteration count) is numerically incorrect')

%second test case (new roots problem function)
g = @(x) 2*sin(sqrt(x)) - 3*x^2;
[y_correct1, y_correct2, y_correct3, y_correct4] = PA3_secant(g, [0.5 0.6], 1e-8, 20);
[student_sol1, student_sol2, student_sol3, student_sol4] = student_solution(g, [0.5 0.6], 1e-8, 20);

%test accuracy
test1 = max(abs(y_correct1 - student_sol1)./y_correct1);
assert(le(test1,1e-6),'Output 1 (root estimate) is numerically incorrect')
test2 = max(abs(y_correct2 - student_sol2)./y_correct2);
assert(le(test2,1e-6),'Output 2 (residual) is numerically incorrect')
test3 = max(abs(y_correct3 - student_sol3)./y_correct3);
assert(le(test3,1e-6),'Output 3 (approx relative error) is numerically incorrect')
test4 = max(abs(y_correct4 - student_sol4)./y_correct4);
assert(le(test4,1e-6),'Output 4 (iteration count) is numerically incorrect')

%third test case (default es)
g = @(x) 2*sin(sqrt(x)) - 3*x^2;
[y_correct1, y_correct2, y_correct3, y_correct4] = PA3_secant(g, [0.5 0.7], [], 20);
[student_sol1, student_sol2, student_sol3, student_sol4] = student_solution(g, [0.5 0.7], [], 20);

%test accuracy
test1 = max(abs(y_correct1 - student_sol1)./y_correct1);
assert(le(test1,1e-6),'Output 1 (root estimate) is numerically incorrect')
test2 = max(abs(y_correct2 - student_sol2)./y_correct2);
assert(le(test2,1e-6),'Output 2 (residual) is numerically incorrect')
test3 = max(abs(y_correct3 - student_sol3)./y_correct3);
assert(le(test3,1e-6),'Output 3 (approx relative error) is numerically incorrect')
test4 = max(abs(y_correct4 - student_sol4)./y_correct4);
assert(le(test4,1e-6),'Output 4 (iteration count) is numerically incorrect')

%fourth test case (default max_it and parameters)
g = @(x,A,B) A*sin(sqrt(x)) - B*x^2;
[y_correct1, y_correct2, y_correct3, y_correct4] = PA3_secant(g,[0.5 0.7],1e-6,[],2.2,3.1);
[student_sol1, student_sol2, student_sol3, student_sol4] = student_solution(g,[0.5 0.7],1e-6,[],2.2,3.1);

%test accuracy
test1 = max(abs(y_correct1 - student_sol1)./y_correct1);
assert(le(test1,1e-6),'Output 1 (root estimate) is numerically incorrect')
test2 = max(abs(y_correct2 - student_sol2)./y_correct2);
assert(le(test2,1e-6),'Output 2 (residual) is numerically incorrect')
test3 = max(abs(y_correct3 - student_sol3)./y_correct3);
assert(le(test3,1e-6),'Output 3 (approx relative error) is numerically incorrect')
test4 = max(abs(y_correct4 - student_sol4)./y_correct4);
assert(le(test4,1e-6),'Output 4 (iteration count) is numerically incorrect')

%fourth test case (default max_it and es with parameters and convergence fail)
g = @(x,A,B) A*sin(sqrt(x)) - B*x^2;
[y_correct1, y_correct2, y_correct3, y_correct4] = PA3_secant(g, [0.1 0.3],[],[],2.5,3.7);
[student_sol1, student_sol2, student_sol3, student_sol4] = student_solution(g, [0.1 0.3],[],[],2.5,3.7);

%test accuracy
test1 = max(abs(y_correct1 - student_sol1)./y_correct1);
assert(le(test1,1e-6),'Output 1 (root estimate) is numerically incorrect')
test2 = max(abs(y_correct2 - student_sol2)./y_correct2);
assert(le(test2,1e-6),'Output 2 (residual) is numerically incorrect')
test3 = max(abs(y_correct3 - student_sol3)./y_correct3);
assert(le(test3,1e-6),'Output 3 (approx relative error) is numerically incorrect')
test4 = max(abs(y_correct4 - student_sol4)./y_correct4);
assert(le(test4,1e-6),'Output 4 (iteration count) is numerically incorrect')
