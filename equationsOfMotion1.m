function [dydt,F1,F2,M]=equationsOfMotion1(t,y,dyn)
%Equations of motion for the case 1

%Initialisation
mass=dyn.mass;
deltam=dyn.deltam;
Fext=dyn.Fext;
g=dyn.g;
n_rps=dyn.n_rps;

omega=2*pi*n_rps;
dydt=zeros(4,1);%the right-side parts of the equations

%Fluid film reaction forces
[F1,F2,M]=resultingForces(y,dyn);
%where V1=y(1); X1=y(2); V2=y(3); X2=y(4);

%The right-side parts of the equations

%!!!!!!!!!!!Enter your code here!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
%dydt(1)=;
%dydt(2)=;
%dydt(3)=;
%dydt(4)=;
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

 t%print time
 
end