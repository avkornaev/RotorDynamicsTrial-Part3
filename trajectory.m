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
 b=h0+50e-6;a=h0;
% for i=1:length(x1)
%     h0new(i)=a*b/(sqrt(b^2*cos(x1(i)/r-pi/2)+a^2*sin(x1(i)/r-pi/2)));
% end
    
figure('Color', 'w')
grid on
fi=0:0.01:2*pi;
%h=ones(size(fi))*h0+h0new(i)=a*b/(sqrt(b^2*cos(x1(i)/r-pi/2)+a^2*sin(x1(i)/r-pi/2)));;
h=ones(size(fi))*h0+a*b/(sqrt(b^2*cos(fi(i))+a^2*sin(fi(i)/r-pi/2)));;
polar(fi,h,'r--');
axis  ([-h0 h0 -h0 h0])
hold on
polar(fi,h,'r--');
polar(fi,rho);
hold off
end