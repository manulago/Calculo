function aprox = puntomediotable (a,b)
  amed= a(2:2:length(a));
  bmed= b(2:2:length(b))
  h = a(2)- a(1)
  aprox = 2*h*sum(bmed);
endfunction
