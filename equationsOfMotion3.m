function [dydt,F1,F2]=equationsOfMotion3(t,y,dyn)
%Equations of motion for the case 1

%Initialisation
mass=dyn.mass;
deltam=dyn.deltam;
Fext=dyn.Fext;
g=dyn.g;
n_rps=dyn.n_rps;
dX=dyn.dX;
dV=dyn.dV;

omega=2*pi*n_rps;
dydt=zeros(4,1);%the right-side parts of the equations

%Fluid film reaction forces are calculatee by an ANN
%!!!!!!!!!!!Enter your code here!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
[F]=myNeuralNetworkFunction(y)
F1=F(1);F2=F(2);
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

%The right-side parts of the equations
%!!!!!!!!!!!Enter your code here!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 %dydt(1)=
 %dydt(2)=
 %dydt(3)=
 %dydt(4)=
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 t%print time
end