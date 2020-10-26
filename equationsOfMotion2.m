function [dydt,F1,F2]=equationsOfMotion2(t,y,dyn,X1E,X2E,F1E,F2E,K,B)
%Equations of motion for the case 1

%Initialisation
mass=dyn.mass;
deltam=dyn.deltam;
Fext=dyn.Fext;
g=dyn.g;
n_rps=dyn.n_rps;


omega=2*pi*n_rps;
dydt=zeros(4,1);%the right-side parts of the equations

%Fluid film reaction forces are linearised by K and B

%!!!!!!!!!!!Enter your code here!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
%F1=;
%F2=;
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

%The right-side parts of the equations

%!!!!!!!!!!!Enter your code here!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
%dydt(1)=;
%dydt(2)=;
%dydt(3)=;
%dydt(4)=;
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

 t%print time
end