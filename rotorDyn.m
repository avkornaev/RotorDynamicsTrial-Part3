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
            
            L=static.L;
m=static.m;
s=static.s;
x1=static.x1(1:end-1);
x3=static.x3(2:end-1);
h=static.gap.h(1:end-1);
hpow3=static.gap.hpow3(1:end-1);
dhpow3dx1=static.gap.dhpow3dx1(1:end-1);
u1=static.vel.u1(1:end-1);
u2=static.vel.u2(1:end-1);
du1hdx1=static.vel.du1hdx1(1:end-1);
mu=static.mu;
p0=static.p0;

%From 1D to 2D fast transform (f(x1) -> f(x1,x3))
h=meshgrid(h,x3);
hpow3=meshgrid(hpow3,x3);
dhpow3dx1=meshgrid(dhpow3dx1,x3);
du1hdx1=meshgrid(du1hdx1,x3);
u2=meshgrid(u2,x3);
%surf(h)

% Zero-value matriсes
n=m(1)*m(3);%number of unknowns p(i,j)
A=zeros(m(3),m(1));
B=zeros(m(3),m(1));
C=zeros(m(3),m(1));
D=zeros(m(3),m(1));
E=zeros(m(3),m(1));
G=zeros(m(3),m(1));

Lambda=zeros(n,n);
Gamma=zeros(n,1);

p=zeros(m(3),m(1));
F1=0;F2=0;M=0;
subF1=zeros(m(3),m(1));
subF2=zeros(m(3),m(1));
subM=zeros(m(3),m(1));

% Matrices of coefficients 
A=-2*hpow3*((1/(s(1)^2))+(1/(s(3)^2)));
B=hpow3*(1/(s(3)^2));
C=hpow3*(1/(s(3)^2));
D=(hpow3/(s(1)^2))+dhpow3dx1*(1/(2*s(1)));
E=(hpow3/(s(1)^2))-dhpow3dx1*(1/(2*s(1)));
G=6*mu*du1hdx1-12*mu*u2;

% Matrix form for the Reynolds equation: Lambda*P=Gamma
for k=1:n %number of the Reynolds equation in a specific point (i,j)
    i=1+floor((k-1)/m(1));%column #
    j=k-(i-1)*m(1);%row #
    %[i;j;k]
    Lambda(k,k) =A(i,j);%filling the diagonal components of the 'A' matrix
    Gamma(k)=G(i,j);%filling the right part of the matrix Reynolds equation
    if i~=1
        Lambda(k,k-m(1))=C(i,j);
    else
        Gamma(k)=Gamma(k)-C(i,j)*p0(1);
    end
    
    if i~=m(3)
        Lambda(k,k+m(1))=B(i,j);
    else
        Gamma(k)=Gamma(k)-B(i,j)*p0(2);
    end
    
    if j~=1
        Lambda(k,k-1)=E(i,j);
    else
        Lambda(k,k+m(1)-1)=E(i,j);
    end
    if j~=m(1)
        Lambda(k,k+1)=D(i,j);
    else
        Lambda(k,k-m(1)+1)=D(i,j);
    end
end

%2D pressure field
p=Lambda\Gamma;%solving matrix equation

p=reshape(p,[m(1) m(3)]);%a row to matrix
p=p';%matrix transpose 
p=[ p p(:,1)];%a row for the 2*pi angle

%Projections of the resulting force and the torque
x1=static.x1;%return the full matrix x1 
x3=static.x3;%return the full matrix x1 
h=static.gap.h;%return the full matrix h
u1=static.vel.u1;%return the full matrix u1
p=[p0(1)*ones(1,length(x1)); p ;...
   p0(2)*ones(1,length(x1))];%adding the extra rows with the known pressure values
for i=1:length(x3)
    for j=1:length(x1)
        subF1(i,j)=-p(i,j)*sin(x1(j)/r);
        subF2(i,j)=-p(i,j)*cos(x1(j)/r);
        subM(i,j)=-r*(diffmy(j,p(i,:),s(1))*(h(j)/2)+u1(j)*mu/h(j));
    end
end
F1=dblintegral(subF1)*(2*pi*r*L);% N    
F2=dblintegral(subF2)*(2*pi*r*L);% N    
M = dblintegral(subM)*(2*pi*r*L);% N*m
end

