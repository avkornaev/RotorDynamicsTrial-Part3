function [F1,F2,M]=resultingForces(y,dyn)
%Equations of motion for the case 1

%Initialisation
p0=dyn.p0;
mu=dyn.mu;
n_rps=dyn.n_rps;
r=dyn.r;
R=dyn.R;
h0=dyn.h0;
L=dyn.L;
m=dyn.m;
x1=dyn.x1;
x3=dyn.x3;
s=dyn.s;

%Position and velocity
V1=y(1);
X1=y(2);
V2=y(3);
X2=y(4);

e_r=sqrt(X1^2+X2^2);

%Geometric functions
geom=Geom_prop(X1,X2,e_r,r,R,h0,L,m,x1,x3,s);%create class instance (CI)
gap=geom.fun_gap;%upload results
%Kinematic functions
kinem=Kinem_prop(n_rps,V1,V2,gap,X1,X2,e_r,r,R,h0,L,m,x1,x3,s);%create CI
vel=kinem.fun_vel;%upload results
%Static functions
static=Static_prop(p0,mu,vel,n_rps,V1,V2,gap,X1,X2,...
                            e_r,r,R,h0,L,m,x1,x3,s);%create CI
pf=static.fun_pf;%upload results                        
F1=pf.F1; F2=pf.F2;%reaction forces F1,F2
M=pf.M;%torque

checkError(dyn)%position check
end