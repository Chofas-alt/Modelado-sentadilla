% Archivo: ejes.m
% Descripción: cálculo del vector de posición del origen y los
% vectores asociados a cada eje en un espacio tridimensional después de aplicar una transformación afín representada por la matriz A
%Objetivo calcular las coordenadas de puntos transformados en función de una matriz de transformación.
function [po,px,py,pz]=ejes(A,t) %A es la matriz de transformacion que se utiliza y t es un valor escalar representa la magnitud de la transformación a lo largo de cada uno de los ejes x, y y z.
po=A*([0 0 0 1]'); % contiene el punto de origen digamos (0,0,0); tons Po tiene las coordenadas de (0, 0, 0) transformadas por A.
px=A*([t 0 0 1]');% Representa el punto en el eje x después de aplicar la transformación A y multplicada po por t que amplia las posiciones 
py=A*([0 t 0 1]');% py representa el punto de origen (0, 0, 0) transformado en la dirección del eje y después de aplicar la matriz de transformación A
pz=A*([0 0 t 1]'); 