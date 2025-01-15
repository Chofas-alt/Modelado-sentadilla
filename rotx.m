% Archivo: rotx.m
% Descripción: matriz de transformación homogénea para una rotación
% alrededor del eje x
function r = rotx(t)
r = [1 0 0 0;
0 cos(t) -sin(t) 0;
0 sin(t) cos(t) 0;
0 0 0 1];