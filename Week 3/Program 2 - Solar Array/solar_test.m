%ENGR 240 PA3 Quarterback Problem
%required m-files
%  - PA3_solar.p

clear all
urlwrite('https://drive.google.com/uc?export=download&id=0BwwLB5_Kft3dLVNBVDJRVk03cFU','./PA3_solar.p');
urlwrite('https://drive.google.com/uc?export=download&id=0BwwLB5_Kft3dRWhLSVl4R0E2dXc','./PA3_solar_alt.p');
addpath('.');

%first test case (scalar input, checking root estimate only)
[y_correct1, ~] = PA3_solar(298, 0.5, 0.5, 1e-6);
[student_sol1, ~] = student_solution(298, 0.5, 0.5, 1e-6);
%test vector length
assert(isequal(size(student_sol1),size( y_correct1)),'Output 1 should be a scalar for this test case')
%test accuracy
test1 = max(abs((y_correct1 - student_sol1)./y_correct1));
assert(le(test1,1e-5),'Output 1 is numerically incorrect')


%second test case (scalar input, checking residual only)
[~,y_correct2] = PA3_solar(298, 0.5, 0.5, 1e-6);
[~,y_correct2_alt] = PA3_solar_alt(298, 0.5, 0.5, 1e-6);
[~,student_sol2] = student_solution(298, 0.5, 0.5, 1e-6);
%test vector length
assert(isequal(size(student_sol2),size( y_correct2)),'Output 2 should be a scalar for this test case')
%test accuracy
test2 = max(abs((y_correct2 - student_sol2)./y_correct2));
test2_alt = max(abs((y_correct2_alt - student_sol2)./y_correct2_alt));
assert(test2<=1e-4|test2_alt<=1e-4,'Output 2 is numerically incorrect')


%third test case (vector input, checking root estimates and residual
%values)
[y_correct1, y_correct2] = PA3_solar(260:2:320, 0.6, 0.6, 1e-8);
[y_correct1_alt, y_correct2_alt] = PA3_solar_alt(260:2:320, 0.6, 0.6, 1e-8);
[student_sol1, student_sol2] = student_solution(260:2:320, 0.6, 0.6, 1e-8);
%test vector length
assert(isequal(size(student_sol1),size( y_correct1)),'Output 1 should be a 31x1 column vector for this test case')
assert(isequal(size(student_sol2),size( y_correct2)),'Output 2 should be a 31x1 column vector for this test case')
%test accuracy
test1 = max(abs((y_correct1 - student_sol1)./y_correct1));
assert(le(test1,1e-7),'One or more values in output 1 is numerically incorrect')
test2 = max(abs(y_correct2 - student_sol2)./y_correct2);
test2_alt = max(abs((y_correct2_alt - student_sol2)./y_correct2_alt));
assert(test2<=1e-4|test2_alt<=1e-4,'Output 2 is numerically incorrect')
