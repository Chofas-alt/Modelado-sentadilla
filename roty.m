% Archivo: roty.m
% Descripción: matriz de transformación homogénea para una rotación
% alrededor del eje y
function r = roty(t)
r = [cos(t) 0 sin(t) 0;
0 1 0 0;
-sin(t) 0 cos(t) 0;
0 0 0 1];