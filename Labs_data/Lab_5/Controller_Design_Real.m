%dlqr is lq function in matlab


clear; clc; close all
load 'small_workspace _part1.mat'



%% LQR
rho= 0.005; %tune
Q=C'*C;
R=1/rho;
N=0;
Ke = 1.51;
Kp = 35.3;

[K,S,CLP]=dlqr(A,B,Q,R,N)


%Symmetric root locus


sys= ss(A,B,C,D);
[num,den]= ss2tf(A,B,C,D);
num=conv(num,fliplr(num));
den=conv(den,fliplr(den));
sys=tf(num,den,-1);

rlocus(sys)
zgrid
axis('equal')


%% LQE
% For later if we can set diferent noise for each state
% Ask the user to choose a method
%selection = input('Choose a method (1 or 2): ');


% % Execute the method based on the user's choice
% switch selection
%     case 1
% 
%         qe=
% 
%         Qe= qe*eye;
%         G= eye;
%         Re=1;
% 
% 
%     case 2
% 
%         rho_e=1 %tune
% 
%         Qe=eye;
%         G=B;
%         Re=1/rho_e;
% 
%     otherwise
%         disp('Invalid selection. Please choose 1 or 2.');
% end

rho_e=1;  %tune
Qe=eye;
G=B;
Re=1/rho_e;

[M,P,Z,E]=dlqe(A,G,C,Qe,Re)
Nbar = inv(C*inv(eye(size(A))-A+B*K)*B);





