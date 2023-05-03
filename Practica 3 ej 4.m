%Ejercicio 9
    %Creamos la funcion f(v)
    syms m
    syms c
    syms v
    
    f(v)=m/sqrt(1-(v^2/c^2))
    f(v) = (symfun)



    %Ahora calculamos el polinomio de MacLaurin de orden 2 con el comando taylor
    T2f0=taylor(f(v), v, 0, 'order', 2 + 1)
    
    %T2f0 = (sym)

    %         2
    %      m*v
    %  m + ----
    %         2
    %      2*c
    % Devuelve el mismo resultado que la aproximación del enunciado 
    
    
%Ejercicio 10
  %Apartado (a)
    %creamos la función Y(x)
    f(x)=sin(x)
    f(x) = (symfun) sin(x)

    %Hacemos el polinomio de Taylor de orden 1
    T1f0=taylor(f(x), x, 0, 'order', 1 + 1)
    %T1f0 = (sym) x

    %Hacemos el polinomio de Taylor de orden 3
    %T3f0=taylor(f(x), x, 0, 'order', 3 + 1)

    %T3f0 = (sym)

    %     3
    %    x
    %  - -- + x
    %    6

    %Hacemos el polinomio de Taylor de orden 5
    T5f0=taylor(f(x), x, 0, 'order', 5 + 1)
    %T5f0 = (sym)

 %       5    3
  %     x    x
   %  --- - -- + x
    %  120   6

    %Hacemos el polinomio de Taylor de orden 7
    T7f0=taylor(f(x), x, 0, 'order', 7 + 1)
    %T7f0 = (sym)

%      7      5    3
%     x      x    x
%  - ---- + --- - -- + x
    5040   120   6

    
    
  %Apartado (b)   
    %Representamos f(x) con ezplot y usamos hold on para representar los polinomios en la misma gráfica
    ezplot(f(x),[-5,5])
    hold on
    ezplot(T1f0,[-5,5])
    ezplot(T3f0,[-5,5])
    ezplot(T5f0,[-5,5])
    ezplot(T7f0,[-5,5])
    hold off



    %Apartado (c)
    %Ponemos el formato largo
    format long

    %Subsituimos la x de los polinomios por 1/2
    subs(T1f0, x, sin(1/2))
    %ans = (sym)

%  407*pi
%  ------
%   2667
    %Pasamos el resultado simbólico a valor numérico con el comando double   
    double(ans)
    %ans =    4.794256505478237e-01   
   
    subs(T3f0, x, sin(1/2))
    %ans = (sym)

               3
%    67419143*pi    407*pi
%  - ------------ + ------
%    113820449778    2667
    
double(ans)
%ans =    4.610597364657415e-01    
    
subs(T5f0, x, sin(1/2))
%ans = (sym)

               3                     5
%    67419143*pi     11167913618807*pi     407*pi
%  - ------------ + -------------------- + ------
%    113820449778   16191844504019772840    2667
    
double(ans)
%ans =    4.612708057731628e-01
    
subs(T7f0, x, sin(1/2))
%ans = (sym)

               3                           7                        5
%    67419143*pi      1849953723041760743*pi        11167913618807*pi     407*pi
%  - ------------ - ---------------------------- + -------------------- + ------
%    113820449778   4837173291818813316677659920   16191844504019772840    2667
    
double(ans)
%ans =    4.612696506765053e-01

sin(1/2)
%ans=  4.794255386042030e-01

%El seno de 1/2 coincide con el polinomio de Taylor de orden 1 en x= sen(1/2).
%Los otros polinomios de Taylor en x=sen(1/2) se acercan al seno de 1/2 pero con mayor error.




