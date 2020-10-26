function [V1,X1,V2,X2,t,K,B,F1,F2,M]=rotorDyn(dyn)
% Rotor dynamics 

%Initialisation
totalTime=dyn.totalTime;
X1=dyn.X1;
X2=dyn.X2;
V1=dyn.V1;
V2=dyn.V2;
dX=dyn.dX;
dV=dyn.dV;

y0=[V1;X1;V2;X2];%initial conditions

kindTi=dyn.switSet.kindTi;
t=0;
K=0;
B=0;
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
        %Results from the ODE solver
        V1=Y(:,1); X1=Y(:,2); V2=Y(:,3); X2=Y(:,4);
        %Additional results at each time step
        for I=1:length(t)
            [dydt,F1,F2,M]=equationsOfMotion1(t(I),Y(I,:),dyn);
            F1(I,1)=F1;F2(I,1)=F2;
        end
    case 2
        %It is assumed that initial position of the rotor is
        %in the equilibrium point E: X1=X1,X2=X2,V1=0,V2=0
        y=[X1 X2 0 0];%arguments
        [F1E,F2E,M]=resultingForces(y,dyn);%resulting force and torque
        
        %In the 8 neigbour points [X1+dX,X2,0,0],[X1,X2+dX,0,0],...
        
        %!!!!!!!!!!!Enter your code here!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        %y=
        %[F1n,F2n,M]=
        %K=
        %B=
        %!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        
        %Solver for the system of Ordinary Differential equations (ODE)
        [t,Y]=ode45(@(t,y) equationsOfMotion2(t,y,dyn,F1E,F2E,K,B),...
            [0 totalTime],y0);
        %Results from the ODE solver
        V1=Y(:,1); X1=Y(:,2); V2=Y(:,3); X2=Y(:,4);
    case 3
        %Solver for the system of Ordinary Differential equations (ODE)
        [t,Y]=ode45(@(t,y) equationsOfMotion3(t,y,dyn),[0 totalTime],y0);
        %Results from the ODE solver
        V1=Y(:,1); X1=Y(:,2); V2=Y(:,3); X2=Y(:,4);
    case 4
end
            
 end

