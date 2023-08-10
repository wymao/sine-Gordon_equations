format short e;clc;clear all;
%% 
M  = [ 4 8 16 32 ]; 
N = [ 4 8 16 32 ].^2; 
theta = 1/2;
for i = 1:4
    cputime = 0; tic;
 error1(i) = SineG_3DADI0(0,2,0,2,0,2,0,1,M(i),M(i),M(i),N(i),3,1,1,theta);
    cputime = cputime + toc
end
error1
order1=log2(error1(1:end-1)./error1(2:end))

