function f=conjugate_grad_2d(x0,t)
x=x0;                     %已知初始点坐标：x0
t;                         %精度要求
syms xi yi a;  % xi, yi 为目标函数的符号变量，a 为步长
f=5*(xi).^2+7*(yi).^2-10*xi*yi-111.8*xi-98.4*yi+166;
%f=(xi).^2+2*(yi).^2-4*xi-2*xi*yi; 
%f=(xi-2).^2+(yi-4).^2;                  %创建目标函数 f
fx=diff(f,xi);               %求表达式 f 对 xi 的一阶求导
fy=diff(f,yi);               %求表达式 f 对 yi 的一阶求导
fx=subs(fx,{xi,yi},x0);       %代入初始点坐标计算对 xi 的一阶求导实值
fy=subs(fy,{xi,yi},x0);       %代入初始点坐标计算对 yi 的一阶求导实值
fi=[fx,fy];                  %初始点梯度向量
count=0;  %搜索次数初始为 0
double(sqrt(fx^2+fy^2))<t;     
while double(sqrt(fx^2+fy^2))>t;  %搜索精度不满足已知条件
 s=-fi;                          %第一次搜索的的方向为负梯度方向
 if count<=0
 s=-fi;
 else
 s=s1;
 end
 x=x+a*s;                      %进行一次搜索后的点坐标
 f=subs(f,{xi,yi},x);              %构造一元搜索的一元函数φ (a)
 f1=diff(f);                     %对函数φ (a)进行求导
 f1=solve(f1);                   %得到最佳步长 a
 if  f1~=0
 ai=double(f1);                  %强制转换数据类型为双精度数值
 else
 break                         %若 a=0，则直接跳出循环，此点即为极值点
 end
 x=subs(x,a,ai);                  %得到一次搜索后的点坐标值
f=5*(xi).^2+7*(yi).^2-10*xi*yi-111.8*xi-98.4*yi+166;
 %f=(xi).^2+2*(yi).^2-4*xi-2*xi*yi; 
 %f=(xi-2).^2+(yi-4).^2;                 %创建目标函数 f
 fxi=diff(f,xi);
 fyi=diff(f,yi);
 fxi=subs(fxi,{xi,yi},x);
 fyi=subs(fyi,{xi,yi},x);
 fii=[fxi,fyi];                    %下一点梯度向量
 d=(fxi^2+fyi^2)/(fx^2+fy^2);
 s1=-fii+d*s;                    %下一点搜索的方向向量
 count=count+1;                  %搜索次数加 1
 fx=fxi; 
 fy=fyi;                          %搜索后终点坐标变为下一次搜索的始点坐标
end
x,f=subs(f,{xi,yi},x),count           %输出极值点，极小值以及搜索次数  