% Descripción: matriz de transformación homogénea para una traslación
function T = trasl(x, y, z)
T = [1 0 0 x;
0 1 0 y;
0 0 1 z;
0 0 0 1];
