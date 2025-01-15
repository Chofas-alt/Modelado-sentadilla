% Archivo: rotz.m
% Descripción: matriz de transformación homogénea para una rotación
% alrededor del eje z
function R= rotz(t)
R= [cos(t) -sin(t) 0 0;
sin(t) cos(t) 0 0;
0 0 1 0;
0 0 0 1];
%t es un valor escalar representa la magnitud de la transformación
