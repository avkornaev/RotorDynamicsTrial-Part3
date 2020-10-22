%Rotor dynamics trial program. For studying purposes only
clear all
clc
%Part 3. Trajectories and dynamic properties

%Please add your code to the higlihted regions of the following functions:
%velFunc.m,
%pressureField.m

%% Input data and parameters
 %Geometric parameters
r=20e-3;% rotor radius,m
h0=95e-6;% bearing clearance (mean gap),m
R=r+h0;% bearing radius, m
L=20e-3;% bearing length,m

e_r=1e-1;% relative eccentricity of a shaft in a bearing,e_r=e/h0,0<=e_r<=1
X1=(e_r*h0); X2=sqrt((e_r*h0)^2-X1^2);% initial position of a shaft

m=[30 3 21];% mesh parameters along x1, x2 and x3 axis relatively
x1=linspace(0,2*pi*r,m(1)+1);% x1 mesh 
x3=linspace(0,L,m(3)+2);% x3 mesh including boundary layers
s=[x1(2)-x1(1) 0 x3(2)-x3(1)];
 %Kinematic parameters
n_rps=3e+3/60;%shaft speed, rps
V1=0; V2=0;%initial velocity of a rotor lateral vibrations, m/s
 %Static parameters
p0=[1.05e5 1e5];%boundary conditions for the uncknown pressure function
 %Dynamic parameters
totalTime=0.01;%rotor dynamics calculation time, s
dX=h0*(1e-2);%deltaX1 and deltaX2, m
dV=abs(h0*2*pi*n_rps);%deltaV1 and deltaV2, m/s
Fext=[0 -3.6e3]*0;%external force, N
deltam=0e-0;%rotor imbalance, kg*m 
mass=1;%rotor mass, kg
g=9.81;%free fall acceleration, m/(s^2)
mu=1e-3;% fluid viscosity, Pa*s
 %Switches
kindTi=0;%0 is for stationary;
         %1 is for the trajectory method;
         %2 is for the linearization method;
         %3 is for the given K and B matrices;
         %4 is for the non-linear approximation by ANNs;
kindPlot=1;%0 is without plots; 1 is with plots
switSet=struct('kindTi',kindTi,'kindPlot',kindPlot);

%% Rotor dynamics
tic;%calculation time timer starts

%% Pressure field, resulting force and torque

geom=Geom_prop(X1,X2,e_r,r,R,h0,L,m,x1,x3,s);%create class instance (CI)
gap=geom.fun_gap%upload results
%Kinematic functions
kinem=Kinem_prop(n_rps,V1,V2,gap,X1,X2,e_r,r,R,h0,L,m,x1,x3,s);%create CI
vel=kinem.fun_vel%upload results
%Static functions
static=Static_prop(p0,mu,vel,n_rps,V1,V2,gap,X1,X2,...
                            e_r,r,R,h0,L,m,x1,x3,s);%create CI
pf=static.fun_pf%upload results                        

%% Visualisation
switch switSet.kindPlot
    case 1
        pressureFieldPlot(x1,x3,pf.p)
        
end