function [V1,X1,V2,t,Kij,Bij,F1,F2,M]=rotorDyn(dyn)
% Rotor dynamics 

%Initialisation
X1=dyn.X1;
X2=dyn.X2;
V1=dyn.V1;
V2=dyn.V2;
mass=dyn.mass;
y0=[V1;X1;V2;X2];%initial conditions

kindTi=dyn.kindTi;
t=0;
Kij=0;
Bij=0;
F1=0;
F2=0;
M=0;

switch kindTi
    case 0
        [p,F1,F2,M,Lambda,Gamma]=pressureField(static)
    case 1
    case 2
    case 3
    case 4
end
            
          
