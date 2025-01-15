
function [polinomio, tiempo_maximo,parte_max,parte_min]  = poli_ang(nombre, ubi, parte,grado,  graficar)
data = ubi;
hoja_trabajo = nombre; %nombre de la hoja

% Importa datos
[datos, encabezados, ~] = xlsread(data, hoja_trabajo);

tiempo = 1;
a_parte = parte;

vec_tiempo = datos(:, tiempo);
vec_parte = datos(:, a_parte);

x = vec_tiempo;
y = vec_parte;

grado_polinomio = grado;

% saca los coeficientes
coeficientes_polinomio = polyfit(x, y, grado_polinomio);
polinomio = coeficientes_polinomio;

polinomio_graf = polyval(coeficientes_polinomio, x);
%con polyval sacas lo de paraa grafiar xdxdxdxd
tiempo_maximo = max(x);%sacar el tiempo maximo
parte_max=max(y);
parte_min=min(y);
    
if graficar == 1
    figure(1);
    plot(x, y, 'o', x, polinomio_graf, '-');
    legend('Datos', 'Polinomio');
    xlabel('x');
    ylabel('y');
else 
   

end

end
