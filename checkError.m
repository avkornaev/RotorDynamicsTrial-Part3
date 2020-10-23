function [] = checkError(dyn)
%Check errors
e1=sqrt(dyn.X1^2+dyn.X2^2)/dyn.h0;
if e1>1 || e1/e1~=1
    error('The shaft is out of border (eccentricity/h0>1)')       
end

end

