function [] = trajectory(h0,X1,X2)
%Trajectory plot

%Initialisation
sizeX=length(X1);
rho=zeros(sizeX,1);%radius in polar coord.
fi=zeros(sizeX,1);%angle in polar coord.
np=100;%number of contour points


%Countour
fiE=linspace(0,2*pi,np);
rhoE=ones(size(fiE))*h0;

%Trajectory
for t=1:sizeX 
    rho(t)=sqrt(X1(t)^2+X2(t)^2);
    if X2(t)<0
        fi(t)=acos(X1(t)/rho(t));
    else
        fi(t)=-acos(X1(t)/rho(t));
    end
end

figure('Color', 'w')
grid on
polarplot(fiE,rhoE,'r--');%countour
hold on
polarplot(fi,rho);
hold off
    
end



% %Template for an eliptic bearing
% b=1.5*h0;a=h0;
% np=100;
% fit=linspace(0,2*pi,np);
% rhot=zeros(size(fit));
% for j=1:np
%     rhot(j)=a*b/sqrt((a^2*sin(fit(j))^2)+(b^2*cos(fit(j))^2));
% end
%  max(rhot/h0) 