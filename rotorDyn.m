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
        N=length(t);F1=zeros(N,1);F2=zeros(N,1);
        for I=1:N
            [F1(I),F2(I),M]=resultingForces(Y(I,:),dyn);            
        end
    case 2
        %It is assumed that initial position of the rotor is
        %in the equilibrium point E: X1E=X1,X2E=X2,V1=0,V2=0
        X1E=X1;X2E=X2; y=[0 X1E 0 X2E];%arguments
        [F1E,F2E,M]=resultingForces(y,dyn);%resulting force and torque
        
        %In the 8 neigbour points [0 X1E+dX 0 X2E],[0 X1E-dX 0 X2E],...
        
        %!!!!!!!!!!!Enter your code here!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        
        
        
        
        
        %!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        
        %Solver for the system of Ordinary Differential equations (ODE)
        [t,Y]=ode45(@(t,y) equationsOfMotion2(t,y,dyn,X1,X2,F1E,F2E,K,B),...
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

