
T = 60;
%f =0.4;
f = 0.6;
fs= 50;
t = 0:1/fs:T;




%u = square(2*pi*f*t);
%u = idinput(length(t), 'RBS' , [0.002 0.02]*f,[-1 1]);
u = idinput(length(t), 'RBS' , [0.002 0.02]*f,[-0.75 0.75]);











