f=[-2,-1,3,-5];
A=[1,2,4,-1;2,3,-1,1];
b=[6,12];
Aeq=[1,0,1,1];
beq=[4]; 
lb=[0,0,0,0];
ub=[];
[x,fval]=linprog(f,A,b,Aeq,beq,lb,ub)