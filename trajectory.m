function [] = trajectory(h0,X1,X2,t)
%Trajectory plot
sizeX=length(X1);
rho=zeros(sizeX,1);
fi=zeros(sizeX,1);
for t=1:sizeX 
    rho(t)=sqrt(X1(t)^2+X2(t)^2);
    if X2(t)<0
        fi(t)=acos(X1(t)/rho(t));%угол полож.ц.шипа С(X1sh X2sh)
    else
        fi(t)=-acos(X1(t)/rho(t));
    end
end
    
figure('Color', 'w')
grid on
f=0:0.01:2*pi;
h=ones(size(f))*h0;
polar(f,h,'r--');
axis  ([-h0 h0 -h0 h0])
hold on
polar(fi,rho);
hold off
end