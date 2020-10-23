function [dydt]=equationsOfMotion1(t,y,dyn)
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

mass=dyn.mass;
deltam=dyn.deltam;
Fext=dyn.Fext;
g=dyn.g;

dydt=zeros(4,1);%the right-side parts of the equations

%The unknown functions
V1=y(1);
X1=y(2);
V2=y(3);
X2=y(4);

e_r=sqrt(X1^2+X2^2);
omega=2*pi*n_rps;

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
%Reaction forces F1,F2
F1=pf.F1; F2=pf.F2;

%checkError(dyn)
%ѕрава€ часть векторного уравнени€ движени€
 dydt(1)=(2*F1+deltam*(omega)^2*cos(omega*t)+Fext(1))/mass;
 dydt(2)=y(1);
 dydt(3)=(2*F2+deltam*(omega)^2*sin(omega*t)+Fext(2)+mass*g)/mass;
 dydt(4)=y(3);
t
end