%Manuel Lago Tielas
%Octave 5.1.0.0
%Symbolic 2.8.0



%Primero se debe iniciar symbolic y la variable 'x'

    pkg load symbolic
    syms x
    
%Ejercicio 1
fprintf "\n\nEjercicio 1\n\n"

  %Apartado (a)
  fprintf "\nApartado (a)\n"

    %Debemos definir la función f(x)

    f1 = (x^(2) -9)/(x^(2)-4)

    %Para saber en que valores de x no existe la función debemos resolver el denominador

    solve (x^(2) - 4)

    %Nos devuelve una matriz de 2x1 en la que nos da los valores donde no hay dominio.
    %El dominio sería todo R menos {-2, 2}

    %Para hallar los puntos de corte con el eje x debemos usar el mismo comando que antes, pero resolviendo la función entera.

    solve (f1)

    %Esto nos dará los puntos de corte con el eje x, (3, 0) y (-3, 0). Para hallar los del eje y, debemos usar el comando 'subs'

    subs (f1, x, 0)

    %La respuesta 9/4 indica el punto donde la función corta con el eje y. El punto es (0, 9/4).

    %Ahora vamos a dibujar en la grafica los ejes de coordenadas

    EjeX = [-10 10]
    EjeY = EjeX - EjeX;

    hold on
    plot (EjeX,EjeY, 'k')
    plot (EjeY,EjeX, 'k')

    %Por último pintaremos la función en el rectángulo indicado:

    set (ezplot (f1, [-10, 10]), 'color', 'c')
    axis ([-10 10 -3 6])
  
  %Apartado (b)
  fprintf "\nApartado (b)\n"
    
    %Tenemos que calcular las asintotas verticales. Para ello haremos dos limites, en los valores en
    %los que la función no tiene dominio.
    
    limAV1 = limit (f1, 2)
    limAV2 = limit (f1, -2)
    AV1 = 2
    AV2 = -2
    
    %Después calcularemos las asintotas horizontales:
    
    limAH1 = limit (f1, inf)
    limAH2 = limit (f1, -inf)
    AH = 1
    
    %NO EXISTE ASINTOTA OBLICUA porque su formula "y = mx + n",
    %donde 'm' es la pendiente, necesita que dicha pendiente sea
    %distinta de cero. Si no es así, la asintota oblicua se
    %superpondría con la asintota horizontal. Para calcular dicha pendiente
    %podemos hacer, el siguiente limite, que nos dará como resultado cero,
    %lo que implica la NO EXISTENCIA DE ASINTOTA OBLICUA.
    
    limAO = limit (f1/x, inf)
    limAO = limit (f1/x, -inf)
  
  
  %Apartado (c)
  fprintf "\nApartado (c)\n"
    %Añadimos ahora las asintotas anteriormente calculadas a la gráfica:
    
    set (ezplot (limAH1, [-10, 10]), 'color', 'm', 'linestyle', '--')
    plot ([2, 2] , [100000, -100000], 'g--')
    plot ([-2, -2] , [100000, -100000], 'g--')
    axis ([-10 10 -3 6])
    title ('x^2 -9/ x^2 -4')
    hold off
    
    
%_________________________________________________________

%Ejercicio 2
fprintf "\n\nEjercicio 2\n\n"

    %Debemos definir la función 'y'

    y = (exp(x) + exp(-x))/(exp(x)-exp(-x))

    %Ahora dibujamos la función en una gráfica, y añadiremos los ejes cartesianos:
    
    figure (2)
    hold on
    set (ezplot (y, [-10,10]), 'color', 'c')
    
    EjeX = [-10 10]
    EjeY = EjeX - EjeX;
    plot (EjeX,EjeY, 'k')
    plot (EjeY,EjeX, 'k')


    %Ahora debemos calcular la asintota vertical
    %y después la dibujaremos

    limAV = limit (y, 0)
    AV = 0
    plot ([0, 0] , [100000, -100000], 'color', 'r', 'linestyle', '--')

    %Haremos lo mismo con la asintota horizontal
    
    limAH1 = limit (y, inf)

    limAH2 = limit (y, -inf)

    set (ezplot (limAH1, [-10,10]), 'color', 'g', 'linestyle', '--')

    set (ezplot(limAH2, [-10,10]), 'color', 'g', 'linestyle', '--')

    axis ([-10 10 -3 3])
    
    title ('e^x + e^-x / e^x - e^-x')
    
    hold off
    
%_________________________________________________________

%Ejercicio 3
fprintf "\n\nEjercicio 3\n\n"

  %Apartado (a)
  fprintf "\nApartado (a)\n"
  
    %Debemos definir la función 'g'

    g = ((x^3)-9)/((x^2)-16)
   
    %Para saber en que valores de x no existe la función debemos resolver el denominador

    solve ((x^2)-16)
    %Esto nos devolverá:
   
    %ans = (sym 2x1 matrix)

    %[-4]
    %[  ]
    %[4 ]

    %Nos devuelve una matriz de 2x1 en la que nos da los valores donde no hay dominio.
    %El dominio sería todo R menos {-4, 4}

    %Para hallar los puntos de corte con el eje x debemos usar el mismo comando que antes, pero resolviendo la función.

    solve (g)
    
    %Respuesta:
    
    %ans = (sym 3x1 matrix)

  %[        2/3       ]
  %[       3          ]
  %[                  ]
  %[   2/3     6 ___  ]
  %[  3      3*\/ 3 *I]
  %[- ---- - ---------]
  %[   2         2    ]
  %[                  ]
  %[   2/3     6 ___  ]
  %[  3      3*\/ 3 *I]
  %[- ---- + ---------]
  %[   2         2    ]

    %Esto nos dará los puntos de corte con el eje x, (3^(2/3), 0). Para hallar los del eje y, debemos usar el comando 'subs'

    subs (g, x, 0)
    
    %ans = (sym) 9/16

    %La respuesta 9/16 indica el punto donde la función corta con el eje y. El punto es (0, 9/16).

  %Apartado (b)
  fprintf "\nApartado (b)\n"
  
    %Debemos representar la función g en una gráfica:
    
    figure (3)
    hold on
    ezplot (g, [-8,12])
    
    %Ahora dibujaremos los ejes de coordenadas:
    
    EjeX = [-100 100]
    EjeY = EjeX - EjeX;

    plot (EjeX,EjeY, 'k')
    plot (EjeY,EjeX, 'k')
    axis ([-8 12])
    
  %Apartado (c)
  fprintf "\nApartado (c)\n" 
    
    %Ahora debemos calcular la asintota vertical
    
    limAV1 = limit (g, -4)
    limAV2 = limit (g, 4)
    AV1 = -4
    AV2 = 4
    
    %Nos devolverá:
    %limAV1 = (sym) oo
    %limAV2 = (sym) oo
    %AV1 = -4
    %AV2 =  4
    
    %Para calcular la asintota oblicua nos basaremos en la formula
    %y = mx + n; donde m es la pendiente
    
    m = limit (g/x, inf)
    n = limit ((g - m*x), inf)
    AO = m*x + n
    
    %Devolverá:
    %m = (sym) 1
    %n = (sym) 0
    %AO = (sym) x
    
    %Al existir asíntota oblicua, no existe asíntota horizontal, puesto que si hacemos
    %el límite
    limit (g, inf) %Este nos daría como resultado infinito.
    
  %Apartado (d)
  
    %Representaremos las asintotas verticales y la oblicua:
    
    plot ([-4, -4] , [100000, -100000], 'color', 'r', 'linestyle', '--')
    plot ([4, 4] , [100000, -100000], 'color', 'r', 'linestyle', '--')
    
    set (ezplot (AO, [-8, 12]), 'color', 'g', 'linestyle', '-.')
    axis ([-8 12 -35 35])
    
    title ('x^3 -9 / x^2 -16')
    hold off
    
  %Apartado (e)
  fprintf "\nApartado (e)\n" 
    
    %Para encontrar el punto de corte de la función con la asíntota debemos
    %igualar ambas funciones y luego resolver la ecuación:
    
    PCgAO = solve (g == AO)
    
    %Devuelve: PCgAO = (sym) 9/16

    
    %La coordenada en el eje x de la intersección es 9/16. Para calcular
    %la coordenada en y debemos evaluar la función en ese punto.

    subs (g, x, PCgAO)
    
    %Devuelve: ans = (sym) 9/16
 
    %Esto nos devolverá la coordenada en el eje y donde se interseccionan
    %las funciones. El punto es el (9/16, 9/16). 
    
  %Apartado (f)
  fprintf "\nApartado (f)\n"
    
    %Para ver en formato largo el punto de corte debemos ejecutar el siguiente comando:
    
    format long
    9/16
    
    %Devuelve: ans =    5.625000000000000e-01
    
    %Ahora realizaremos el método Newton-Raphson, partiendo de 0.4
    g1 = g - AO
    x0 = 0.4
    g2 = diff(g1, 1)
    x1 = x0 - (subs (g1, x0) / subs(g2, x0))
    x2 = x1 - (subs (g1, x1) / subs(g2, x1))
    
    %x2 será igual a: 
      
      %x2 = (sym)

    %  68411137601363
    % ---------------
    % 121619772069830
    
    %Que si se simplifica da como resultado 9/16.
    
  %Apartado (g)
  fprintf "\nApartado (g)\n"
  
    %Para calcular los maximos y minimos relativos debemos
    %derivar la función y resolverla.
   
    g2 = diff(g, x, 1)
    solve (g2)
    
    %Como el  único valor real de la resolución es el cero, evaluamos que ocurre antes y después
    % de dicho valor, además antes y depués de las asintotas:
    
    %En x = -10
    
    subs (g2, -10)
    
    %         1255
    %El valor ----  es positivo
    %         1764
    
    %En x = 10
    
    subs (g2, 10)
    
    %         1345
    %El valor ----  es positivo
    %         1764
    
    %En x = -3
    
    subs (g2, -3)
    
    %         -405
    %El valor ----  es negativo
    %           49
    
    
    %En x = 3
    
    subs (g2, 3)
    
    %         -297
    %El valor ----  es negativo
    %           49
    
    %No posee extremos relativos ni absolutos porque en los cambios de crecimiento a decrecimiento
    %la función tiende a infinito.
    
    
  %Apartado (h)
  
  %Calculamos la segunda derivada e igualamos a cero para calcular puntos de inflexión
  
  g3 = diff(g, x, 2)
  solve (g3 == 0)
  double (ans)
  
  %Existe la solución real '1.886108660452396e-01 + 0.000000000000000e+00i', por lo 
  % que vamos a ver que ocurre a ambos lados.
  
  subs (g3, x, 0)
  
  %Aquí el resultado es positivo (9/128)
  
  subs (g3, x, 1)
  
  %Aquí es negativo (-1226/3375)
  %Por tanto nos encontramos con un punto de inflexión en x = 1.886108660452396e-01
  
  %_________________________________________________________
  
  
  fprintf "Ejercicio 4 \n\n"

  %Apartado a
  fprintf "\nApartado (a)\n"
  
    %Debemos definir la función h(x)
    
    h = x * (e^(1/x))
    
    %El dominio es todo R excepto cero, porque 1 entre 0 es indivisible.
    
    solve (1/x)
    
    %Para hallar los puntos de corte con el eje x debemos usar el mismo comando que antes, pero resolviendo la función entera.

    solve (h)

    %No existe punto de corte en x porque no existe imagen en y = 0

    subs (h, x, 0)

    %A su vez, no existen puntos de corte con el eje y porque la función existe en x = 0
    
    %Procedemos a dibujar la función en una gráfica y pintamos también
    %los ejes cartesianos.
    figure (4)
    hold on
    set (ezplot (h), 'color', 'c')
    
    EjeX = [-100 100]
    EjeY = EjeX - EjeX;
    plot (EjeX,EjeY, 'k')
    plot (EjeY,EjeX, 'k')


    %Ahora debemos calcular la asintota vertical
    %y después la dibujaremos

    limAV = limit (h, 0)
    AV = 0
    plot ([0, 0] , [100000, -100000], 'color', 'r', 'linestyle', '-')

    %Para calcular la asintota oblicua nos basaremos en la formula
    %y = mx + n; donde m es la pendiente. Además de calcularla, la
    %representaremos en la gráfica.
    
    m = limit (g/x, inf)
    n = limit ((g - m*x), inf)
    AO = m*x + n
    set (ezplot (AO), 'color', 'g', 'linestyle', '-.')
   
      
    %Maximos y minimos relativos:
    
    %Debemos derivar la función h y resolverla: 
    
    
    h2 = diff(h, x, 1)
    solve (h2 == 0)
    
    %Nos devuelve 1, por lo que calcularemos que ocurre antes y depués del 1.
    
    subs (h2, 1/2)
    
    %Nos devuelve -e^2, negativo
    
    subs (h2, 3/2)
    
     %               2/3
     %              e
     %Nos devuelve ----
     %              3
     
     subs (h2, -1)
     
     %Nos devuelve 2*e^-1, un valor positivo
    
    %Por lo tanto tenemos un minimo relativo en x = 1 y un maximo relativo en x= 0. No es absoluto porque existen 
    %intervalos donde la función tiende a infinito.
    
    h3 = diff(h, x, 2)
    solve (h3 == 0)
    
    %Nos devuelve ans = {}(0x0), por lo que solo es posible que el 0
    % sea punto de inflexión
    
    subs (h3, 1/2)
    
    %             2
    %Devuelve  8*e  , positivo
  
    subs (h3, -1)
    
    %            -1
    %Devuelve  -e  , positivo
    
    %Hay un punto de inflexión en x = 0. En el intervalo (-inf,0) h es concava ya que h3 es negativa y en el intervalo (0, inf)
    %es convexa ya que h3 es positiva.
    
     
     
  %Apartado (b)
  
  
    % Solo el 1 está incluido en el intevalo [0.5, 4] .
    %Al estar en un intervalo también el 0.5 y el 4 pueden ser extremos relativos

    %Para calcular el signo de la derivada usaremos 0.75 , 2.  
    
    subs(h2, x, 0.75)
    
    %ans = (sym)

    %    4/3
    %  -e
    %  ------ es negativa
    %    3
     

    subs(h2, x, 2)
    %ans = (sym)

    %   1/2
    %  e
    %  ---- es positiva
    %   2
   

    %Hay dos máximos en x = 0.5 y x = 4 y un mínimo en x = 1.

    %Para saber cuales son los absolutos substituimos en la función y comparamos.
    subs(h, x, 0.5)
    %ans = (sym)

    %   2
    %  e
    %  --
    %  2
    
    %   2
    %  e
    %  --, que es igual a 3.6945
    %  2

    subs(h, x, 1)
    %ans = (sym) e
    %e es igual a  2.7183

    subs(h, x, 4)
    %ans = (sym)

    %     1/4
    %  4*e

    %     1/4
    %  4*e     que es igual a 5.1361

    %Hay un máximo absoluto en x=4 y un mínimo absoluto en x=1. También hay un máximo relativo en x=0.5.
    
    
%_________________________________________________________

%Ejercicio 5

  %Apartado (a)
    %Se demuestra que hay al menos una solución en el intervalo indicado con el Teorema de Bolzano.
    %Si y solo si la función es continua en [-3, 0] y f(-3)*f(0)<0 entonces existe al menos una raíz en (-3, 0).

    %Creamos la función j
    j = 4*(x^2)+5*x-2

    %Calculamos j(-3) y j(0) con subs.
    subs (j, x, -3)
    %j(-3) = (sym) 19   
    subs(j, x, 0)
    
    %j(0) = (sym) -2
    %j(-3)*j(0)<0 y como j(x) es continua en todo R ya que es un polinomio, es continua en (-3, 0).
    %Aplicando el Teorema de Bolzano hay al menos una raíz en (-3, 0).

    %Resolvemos la ecuación de segundo grado para comprobar si hay más raíces.
    
    (-5 - sqrt(5^2 - 4*4*(-2)))/(2*4)
   
    %ans = -1.5687
    
    (-5 + sqrt(5^2 - 4*4*(-2)))/(2*4)
    
    %ans =  0.31873
    
    %Solo una de las raíces está en el intervalo (-3, 0), por lo que sí es única.


  %Apartado (b)
  
    %Para saber cuantas iteraciones hay que hacer calculamos log2 ((b-a)/error), 
    %que tiene que ser menor que el número de iteraciones.
    
    log2((0-(-2))/0.04)
    
    %ans =  5.6439
    %Hay que hacer 6 iteraciones.

    %Si j(a)*j(c)<0 la aproximación es la iteracion de a y c, si no es la iteracion de c y b. 
    %Repetimos esta operación 6 veces.

    %a = -2
    %b = 0
    %c =(a+b)/2
    subs(j, x, -2)
    %ans = (sym) 4

    subs(j, x, 0)
    %ans = (sym) -2
    
    subs(j, x, -1)
    %ans = (sym) -3

    %a=-2
    %b=-1
    %c=(a+b)/2
    
    subs(j, x, -1.5)
    %ans = (sym) -1/2

    %a=-2
    %b=-1.5
    %c=(a+b)/2
    subs(j, x, -1.75)
    %ans = (sym) 3/2

    %a=-1.75
    %b=-1.5
    %c=(a+b)/2
    subs(j, x, -1.625)
    %ans = (sym) 7/16

    %a=-1.625
    %b=-1.5
    %c=(a+b)/2
    subs(j, x, -1.5625)
    %ans = (sym) -3/64

    %a=-1.625
    %b=-1.5625
    %c=(a+b)/2
    subs(j, x, -1.59375)
    
    %ans = (sym)

    %   49
    %  ---
    %  256
    
    %La raíz es aproximadamente -1.59375. 

%_________________________________________________________



%Ejercicio 6    
    
    F6=x^2-sin(x^3)
    %La recta tangente a una funcion es:
    
    T6=subs(F6,x,0)+subs(diff(F6),x,0)*(x-0)
    
    %Polinomio de Mc-Laurin
    
    taylor(f6,x,0,'order',2)
    disp('eLl polinomio de Mc-Lauriin y la recta tangente coinciden')
    %Siempre van a coindicir
    
    %El polinomio de Mc Laurin de orden 1 es igual a f(0) + (f'(0)/1!) * x
    
    %La recta tangente a la gráfica de f en x = 0 es igual a y = m * x + y0 = f'(0) * x + f(0)
    
    %Por lo tanto el polinomio de MacLaurin de orden 1 en x=0 es igual a la recta tangente de f en x=0.

    %Si el polinomio no está centrado en x=0 coinciden también.
    
    

%Ejercicio 7
    %creamos la función F7

    F7=(sin(x))^2
  

 
    %calculamos el polinomio de MacLaurin de orden 4 con el comando taylor.
    
    T4f0=taylor(F7, x, 0, 'order', 4 + 1)
    
    %T4f0 = (sym)

 %    4
 %   x     2
 % - -- + x
 %   3
    
    %Calculamos el polinomio de MacLaurin de orden 5 con el comando taylor.
    T5f0=taylor(f(x), x, 0, 'order', 5 + 1)
    
    %T5f0 = (sym)

    %    4
 %      x     2
 %   - -- + x
 %      3
    % Tienen la misma solución ya que d5f(x)=0. Así, no se modifica al polinomio de orden 4. 


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
    %f(x) = (symfun) sin(x)

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
%    5040   120   6

    
    
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

%               3                     5
%    67419143*pi     11167913618807*pi     407*pi
%  - ------------ + -------------------- + ------
%    113820449778   16191844504019772840    2667
    
double(ans)
%ans =    4.612708057731628e-01
    
subs(T7f0, x, sin(1/2))
%ans = (sym)

%               3                           7                        5
%    67419143*pi      1849953723041760743*pi        11167913618807*pi     407*pi
%  - ------------ - ---------------------------- + -------------------- + ------
%    113820449778   4837173291818813316677659920   16191844504019772840    2667
    
double(ans)
%ans =    4.612696506765053e-01

sin(1/2)
%ans=  4.794255386042030e-01

%El seno de 1/2 coincide con el polinomio de Taylor de orden 1 en x= sen(1/2).
%Los otros polinomios de Taylor en x=sen(1/2) se acercan al seno de 1/2 pero con mayor error.










  
  
  
  
  
  