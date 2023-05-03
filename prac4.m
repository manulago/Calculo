%Práctica 4
%Ejercicio 1
%Apartado a)
pkg load symbolic
syms x
y=x*exp(x);
int(y,x)
%ans = (sym)

%           x
%  (x - 1)*e
ia=int(y,x);
diff(ia,x)
%ans = (sym)

%           x    x
%  (x - 1)*e  + e     %La derivada de la integral coincide con el integrando

%Apartado b)
y=asin(x);
int(y,x)
ans = (sym)

%                 ____
%                /      2
%  x*asin(x) + \/  1 - x
ib=int(y,x);
diff(ib,x)
%ans = (sym) asin(x)    %La derivada de la integral coincide con el integrando

%Apartado c)
syms t
y=t/sqrt(t^2+1);
int(y,t)
%ans = (sym)

%    ____
%    /  2
%  \/  t  + 1
ic=int(y,t);
diff(ic,t)
%ans = (sym)

%       t
%  -----------    %La derivada de la integral coincide con el integrando
%     ____
%    /  2
%  \/  t  + 1

%Apartado d) 
syms u
y=cos(u)^3*sin(u);
int(y,u)
%ans = (sym)

%      4
%  -cos (u)
%  ---------
%      4
id=int(y,u);
diff(id,u)
%ans = (sym)

%            3
%  sin(u)*cos (u)   %La derivada de la integral coincide con el integrando

%Ejercicio 2
%APartado a)
y=(x+(1/nthroot(x^2,3)))^2;
int(y,x,1,2)
%ans = (sym)

%       2/3
%    3*2        3 _   23
%  - ------ + 3*\/ 2  + --
%      2                6

%Apartado b)
y=sqrt(9-t^2);
int(y,t,-3,3)
%ans = (sym)

%  9*pi
%  ----
%   2

%Apartado c) 
y=cot(exp(x))*exp(x);
ic = int(y,x,0,2)
%Error. Ocatve no puede calcular esta integral directamente
log(abs(sin(exp(x))))
%ans = (sym)

%     /|   / x\|\
%  log\|sin\e /|/

ic=log(abs(sin(exp(x))));
a=subs(ic,x,2);
b=subs(ic,x,0);
Ic=a-b
%Ic = (sym)

%     /   / 2\\
%  log\sin\e // - log(sin(1))

%Apartado d)
y=u*sqrt(16-u^2);
int(y,u,0,4)
%ans = (sym) 64/3
  
%Ejercicio 3
f=sqrt(1-x^2);
g=x;
solve(f-g==0)
%ans = (sym)

%    _
%  \/ 2
%  -----          %Punto de corte de las dos funciones
%    2
solve(f==0)
%ans = (sym 2x1 matrix)

%  [-1]           %Uno de los puntos de corte de la función f con el Eje X (no nos interesa para este ejercicio)    
%  [  ]
%  [1 ]           %El otro punto de corte de la función f con el Eje X
solve(g==0)
%ans = (sym) 0    %Punto de corte de la función g con el Eje X

a1=int(g,x,0,sqrt(2)/2);
A1=double(a1)
%A1 =  0.25000     %Área de la primera sección
a2=int(f,x,sqrt(2)/2,1);
A2=double(a2)
%A2 =  0.14270     %Área de la segunda sección
A=A1+A2
%A =  0.39270      %Área total      
ezplot(f, [-0.5 1.5])
hold on
ezplot(g, [-0.5 1.5])
x=[-0.5 1.5]; y=[0 0];
plot(x,y)
%Representación gráfica de las funciones y del área comprendida entre ellas (y el Eje X)

%Ejercicio 4
syms x
f = sqrt(9-x^2);      %Ecuación de la esfera exterior(radio 2+1=3cm)
V2=pi*int(f^2,x,-3,3)
%V2 = (sym) 36*pi   %Volumen de la esfera exterior
g=sqrt(4-x^2);      %Ecuación de la esfera interior(Radio 2cm)
V1=pi*int(g^2,x,-2,2)
%V1 = (sym)

%  32*pi
%  -----            %Volumen de la esfera interior
%    3

Va=V2-V1
%Va = (sym)

%  76*pi
%  -----            %Volumen de la diferencia (recubrimiento de acero)
%    3

%Ejercicio 5
y=1/x;
V=pi*int(y^2,x,1,10)
%V = (sym)

%  9*pi
%  ----             %Volumen de la figura
%   10

V=pi*int(y^2,x,1,x);
limit(V,x,Inf)
%ans = (sym) pi     %El volumen es finito, y tiende a pi cuando crece el extremo superior
A=2*pi*int(y*sqrt(1+diff(y,x)^2),x,1,x);
limit (A ,x ,Inf)
%ans = (sym) oo     %El área es infinita cuandodo x tiende a +Inf

%Ejercicio 6 
%function [M ] = pms(a,b,fo)
%  M=(b-a)*fo
%endfunction

syms x
f=x*sqrt(16-x^2);
fo=subs(f,x,2)
%fo = (sym)

%      _
%  4*\/ 3
[M] = pms(0,4,4*sqrt(3))
%M =  27.71281292110204     %Aproximación mediante fórmula del punto medio simple
%M =  27.71281292110204  
error=abs(64/3-27.71281292110204)
%error =  6.379479587768706           %Error      
  
%Ejercicio 7
format long 
X=linspace(0,4,11);
Y=X.*sqrt(16-X.^2);
a1=trapz(X,Y)
%a1 =  20.69413975016798    %Aproximación con n=1
Error1=64/3-a1
%Error1 =    6.391935831653548e-01    %Error con n=1
X=linspace(0,4,101);
Y=X.*sqrt(16-X.^2);
a2=trapz(X,Y)
%a2 =  21.31401313421716    %Aproximación con n=2
Error2=64/3-a2
%Error2 =    1.932019911617289e-02    %Error con n=2
X=linspace(0,4,1001);
Y=X.*sqrt(16-X.^2);
a3=trapz(X,Y)
%ans =  21.33273308608845    %Aproximación con n=3
Error3=64/3-a3
%Error3 =    6.002472448791707e-04    %Error con n=3
X=linspace(0,4,10001);
Y=X.*sqrt(16-X.^2);
a4=trapz(X,Y)
%ans =  21.33331446457505   %Aproximación con n=4
Error4=64/3-a4
%Error4 =    1.886875827850076e-05    %Error con n=4
X=linspace(0,4,100001);
Y=X.*sqrt(16-X.^2);
a5=trapz(X,Y)
%ans =  21.33333273779583   %Aproximación con n=5
Error5=64/3-a5
%Error5 =    5.955375037558497e-07    %Error con n=5

%Ejercicio 8
%function [T ] = pmc(f,a,b,N)
%  h=(b-a)/N;
%  r=0;
%  for k=1:N
%    r=r+f(((a+k*h)+(a+(k-1)*h))/2);
%  endfor
%  M=h*r
%endfunction

format long 
n=1;
N=10^n+1
%N =  11
pmc(@(x) x*sqrt(16-x^2),0,4,11)    
%M =  21.50176868739569           %Aproximación para n=1
error=abs(64/3-21.50176868739569)
%error =    1.684353540623569e-01     %Error para n=1
n=2;
N=10^n+1
%N =  101
pmc(@(x) x*sqrt(16-x^2),0,4,101)
%M =  21.33900590452379           %Aproximación para n=2
error=abs(64/3-21.33900590452379)
%error =    5.672571190459053e-03     %Error para n=2
n=3;
N=10^n+1;
%N =  1001
pmc(@(x) x*sqrt(16-x^2),0,4,1001)
%M =  21.33350994774997           %Aproximación para n=3
error=abs(64/3-21.33350994774997)
%error =    1.766144166381878e-04     %Error para n=3

%Ejercicio 9
L1=x^2.32;
L2=x^3.1;
i1=2*int(x-L1,x,0,1);
I1=double(i1)
%I1 =  0.39759          %Índice de Gini para L1=x^2-32
i2=2*int(x-L2,x,0,1);
I2=double(i2)
%I2 =  0.51220          %Índice de Gini para L2=x^3.1
%La riqueza está mejor distribuida en el primer caso porque I1<I2
ezplot(2*int(x-L1,x),[0 1])   %Representación gráfica de la primera función
hold on
ezplot(2*int(x-L2,x),[0 1])   %Representación gráfica de la segunda función

%Ejercicio 10
%Apartado a)
n1=(0.1/2)*(0+0.0001)
n1 =  0.0000050000
n2=(0.1/2)*(0.0001+0.0016)
n2 =  0.000085000
n3=(0.1/2)*(0.0016+0.0243)
n3 =  0.0012950
n4=(0.1/2)*(0.0243+0.0256)
n4 =  0.0024950
n5=(0.5/2)*(0.0256+0.0625)
n5 =  0.022025
n5=(0.1/2)*(0.0256+0.0625)
n5 =  0.0044050
n5=(0.1/2)*(0.0625+0.1296)
n5 =  0.0096050
n5=(0.1/2)*(0.1296+0.2401)
n5 =  0.018485
n6=(0.1/2)*(0.0625+0.1296)
n6 =  0.0096050
n7=(0.1/2)*(0.1296+0.2401)
n7 =  0.018485
n8=(0.1/2)*(0.2401+0.4096)
n8 =  0.032485
n9=(0.1/2)*(0.4096+0.6561)
n9 =  0.053285
n10=(0.1/2)*(0.6561+1)
n10 =  0.082805
N=n1+n2+n3+n4+n5+n6+n7+n8+n9+n10
N =  0.21903

%Apartado b)


%Ejercicio 11
syms t
r=(2.2*exp(0.57*t))/(13+exp(0.57*t));
a=int(r,t,0,t)
%a = (sym)

%         / 57*t     \
%         | ----     |
%         | 100      |
%  220*log\e     + 13/   220*log(14)
%  ------------------- - -----------      %Cantidad invertida en t años
%           57                57
subs(a,t,10);
b=subs(a,t,10);
B=double(b)
%B =  11.979    %Cantidad invertida desde 2010 hasta 2020

%Ejercicio 12
solve(a==30);
c=solve(a==30);
C=double(c)
%C =  18.266    %Número de años necesarios para que la inversión acumulada sea de unos 30 mil millones de €

%Ejercicio 13
n1 =  0.0094700
n2=(0.2/2)*(0.070+0.135)
n2 =  0.020500
n3=(0.2/2)*(0.135+0.1777)
n3 =  0.031270
n4=(0.2/2)*(0.1777+0.193)
n4 =  0.037070
n5=(0.2/2)*(0.193+0.108)
n5 =  0.030100
N=n1+n2+n3+n4+n5
N =  0.12841