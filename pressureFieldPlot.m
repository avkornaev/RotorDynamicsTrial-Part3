function [] = pressureFieldPlot(x1,x3,p)
%Pressure feild plot

figure ('Color','w')
surf(x1,x3,p)
xlabel('{\itx_1} , m')
ylabel('{\itx_3} , m')
zlabel('{\itp} , Pa')
grid on
end

