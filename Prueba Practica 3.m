%Ejercicio 3
fprintf "\n\nEjercicio 3\n\n"

  %Apartado (a)
  fprintf "\nApartado (a)\n"
  
    %Debemos definir la funci�n 'g'

    g = ((x^3)-9)/((x^2)-16)
   
    %Para saber en que valores de x no existe la funci�n debemos resolver el denominador

    solve ((x^2)-16)
    %Esto nos devolver�:
   
    %ans = (sym 2x1 matrix)

    %[-4]
    %[  ]
    %[4 ]

    %Nos devuelve una matriz de 2x1 en la que nos da los valores donde no hay dominio.
    %El dominio ser�a todo R menos {-4, 4}

    %Para hallar los puntos de corte con el eje x debemos usar el mismo comando que antes, pero resolviendo la funci�n.

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

    %Esto nos dar� los puntos de corte con el eje x, (3^(2/3), 0). Para hallar los del eje y, debemos usar el comando 'subs'

    subs (g, x, 0)
    
    %ans = (sym) 9/16

    %La respuesta 9/16 indica el punto donde la funci�n corta con el eje y. El punto es (0, 9/16).

  %Apartado (b)
  fprintf "\nApartado (b)\n"
  
    %Debemos representar la funci�n g en una gr�fica:
    
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
    
    %Nos devolver�:
    %limAV1 = (sym) oo
    %limAV2 = (sym) oo
    %AV1 = -4
    %AV2 =  4
    
    %Para calcular la asintota oblicua nos basaremos en la formula
    %y = mx + n; donde m es la pendiente
    
    m = limit (g/x, inf)
    n = limit ((g - m*x), inf)
    AO = m*x + n
    
    %Devolver�:
    %m = (sym) 1
    %n = (sym) 0
    %AO = (sym) x
    
    %Al existir as�ntota oblicua, no existe as�ntota horizontal, puesto que si hacemos
    %el l�mite
    limit (g, inf) %Este nos dar�a como resultado infinito.
    
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
    
    %Para encontrar el punto de corte de la funci�n con la as�ntota debemos
    %igualar ambas funciones y luego resolver la ecuaci�n:
    
    PCgAO = solve (g == AO)
    
    %Devuelve: PCgAO = (sym) 9/16

    
    %La coordenada en el eje x de la intersecci�n es 9/16. Para calcular
    %la coordenada en y debemos evaluar la funci�n en ese punto.

    subs (g, x, PCgAO)
    
    %Devuelve: ans = (sym) 9/16
 
    %Esto nos devolver� la coordenada en el eje y donde se interseccionan
    %las funciones. El punto es el (9/16, 9/16). 
    
  %Apartado (f)
  fprintf "\nApartado (f)\n"
    
    %Para ver en formato largo el punto de corte debemos ejecutar el siguiente comando:
    
    format long
    9/16
    
    %Devuelve: ans =    5.625000000000000e-01
    
    %Ahora realizaremos el m�todo Newton-Raphson, partiendo de 0.4
    g1 = g - AO
    x0 = 0.4
    g2 = diff(g1, 1)
    x1 = x0 - (subs (g1, x0) / subs(g2, x0))
    x2 = x1 - (subs (g1, x1) / subs(g2, x1))
    
    %x2 ser� igual a: 
      
      %x2 = (sym)

    %  68411137601363
    % ---------------
    % 121619772069830
    
    %Que si se simplifica da como resultado 9/16.
    
  %Apartado (g)
  fprintf "\nApartado (g)\n"
  
    %Para calcular los maximos y minimos relativos debemos
    %derivar la funci�n y resolverla.
   
    g2 = diff(g, x, 1)
    solve (g2)
    
    %Como el  �nico valor real de la resoluci�n es el cero, evaluamos que ocurre antes y despu�s
    % de dicho valor, adem�s antes y depu�s de las asintotas:
    
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
    %la funci�n tiende a infinito.
    
    
  %Apartado (h)
  
  %Calculamos la segunda derivada e igualamos a cero para calcular puntos de inflexi�n
  
  g3 = diff(g, x, 2)
  solve (g3 == 0)
  double (ans)
  
  %Existe la soluci�n real '1.886108660452396e-01 + 0.000000000000000e+00i', por lo 
  % que vamos a ver que ocurre a ambos lados.
  
  subs (g3, x, 0)
  
  %Aqu� el resultado es positivo (9/128)
  
  subs (g3, x, 1)
  
  %Aqu� es negativo (-1226/3375)
  %Por tanto nos encontramos con un punto de inflexi�n en x = 1.886108660452396e-01
    
    
    
    
    
    
    