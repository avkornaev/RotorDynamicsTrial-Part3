function [dydt]=equationsOfMotion1(t,y,dyn)
%Equations of motion for the case 1

%Initialisation
mass=dyn.mass;
n_rps=dyn.n_rps;
omega=2*pi*n_rps;
deltam=dyn.deltam;
Fext=dyn.Fext;
g=dyn.g;

dydt=zeros(4,1);%the right-side parts of the equations

%The unknown functions
V1=y(1);
X1=y(2);
V2=y(3);
X2=y(4);

%Reaction forces F1,F2
[p,F1,F2,M,Lambda,Gamma]=pressureField(dyn);

%ѕрава€ часть векторного уравнени€ движени€
 dydt(1)=(2*F1+deltam*(omega)^2*cos(omega*t)+Fext(1))/mass;
 dydt(2)=y(1);
 dydt(3)=(2*F2+deltam*(omega)^2*sin(omega*t)+Fext(2)+mass*g)/mass;
 dydt(4)=y(3);
t
end