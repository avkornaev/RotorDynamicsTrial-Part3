function [V1,X1,V2,X2,t,Kij,Bij,F1,F2,M]=rotorDyn(dyn)
% Rotor dynamics 

%Initialisation
dyn
totalTime=dyn.totalTime;
X1=dyn.X1;
X2=dyn.X2;
V1=dyn.V1;
V2=dyn.V2;
h0=dyn.h0;

y0=[V1;X1;V2;X2];%initial conditions

kindTi=dyn.switSet.kindTi;
t=0;
Kij=0;
Bij=0;
F1=0;
F2=0;
M=0;

switch kindTi
    case 0
        [p,F1,F2,M,Lambda,Gamma]=pressureField(dyn);
    case 1
        %Solver for the system of Ordinary Differential equations (ODE)
        [t,Y]=ode45(@(t,y) equationsOfMotion1(t,y,dyn),[0 totalTime],y0);
        %where T is time, Y is a left-side part of the diff.equations 
        %Results
        V1=Y(:,1); X1=Y(:,2); V2=Y(:,3); X2=Y(:,4);
        %Frame for the trajectory
    case 2
    case 3
    case 4
end
            
 end

