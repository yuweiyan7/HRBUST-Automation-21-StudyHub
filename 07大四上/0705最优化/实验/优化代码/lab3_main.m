x0=[1;1];
A=[];b=[];
Aeq=[1 1];beq=[0];
vlb=[0,0];vub=[+inf,+inf];
[x,fval]=fmincon('fun4',x0,A,b,Aeq,beq,vlb,vub,'com')