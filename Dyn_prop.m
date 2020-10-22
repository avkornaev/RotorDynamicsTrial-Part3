classdef Dyn_prop < Static_prop & handle
    %Class of the dynamic properties of a bearing
    
    properties(GetAccess=public,SetAccess=public)
        totalTime
        dX
        dV
        Fext
        deltam
        mass
        g
        switSet
    end
    
    methods
        %Construct an instance of this class 
        function dyn=...
                Dyn_prop(totalTime,dX,dV,Fext,deltam,mass,g,switSet,...
                         p0,mu,vel,n_rps,V1,V2,gap,X1,X2,...
                         e_r,r,R,h0,L,m,x1,x3,s)
                dyn=dyn@Static_prop(p0,mu,vel,n_rps,V1,V2,gap,X1,X2,...
                            e_r,r,R,h0,L,m,x1,x3,s);
                if nargin>0
                    dyn.totalTime=totalTime;
                    dyn.dX=dX;
                    dyn.dV=dV;
                    dyn.Fext=Fext;
                    dyn.deltam=deltam;
                    dyn.mass=mass;
                    dyn.g=g;
                    dyn.switSet=switSet;
                end
        end
 
        %Pressure field, total force and torque
        function rd=fun_dyn(dyn)
            [V1,X1,V2,t,Kij,Bij,F1,F2,M]=rotorDyn(dyn);
                
            %Results
            rd.V1=V1;
            rd.X1=X1;
            rd.V2=V2;
            rd.X2=X2;
            rd.t=t;
            rd.Kij=Kij;
            rd.Bij=Bij;
            rd.F1=F1;
            rd.F2=F2;
            rd.M=M;
            end
    end
end

        

            



