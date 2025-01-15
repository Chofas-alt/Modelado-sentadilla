% Archivo: mano.m
% Descripción: representación gráfica de una mano derecha
function []=pie(K)
% Matrices de transformación homogénea (dedos):
% Medio
A1=K*trasl(0,-8,0);
% Anular
A2=K*trasl(-2,0,0);
A3=A2*trasl(0,-7,0);
% Índice
A4=K*trasl(2,0,0);
A5=A4*trasl(0,-9,0);
% Meñique
A6=A2*trasl(-2,0,0);
A7=A6*trasl(0,-6,0);
% Pulgar
A8=A4*trasl(2,0,0);
A9=A8*trasl(0,-10,0);
% Centro de los dedos
[p0,~,~,~]=ejes(K,1);
[p1,~,~,~]=ejes(A1,1);
[p2,~,~,~]=ejes(A2,1);
[p3,~,~,~]=ejes(A3,1);
[p4,~,~,~]=ejes(A4,1);
[p5,~,~,~]=ejes(A5,1);
[p6,~,~,~]=ejes(A6,1);
[p7,~,~,~]=ejes(A7,1);
[p8,~,~,~]=ejes(A8,1);
[p9,~,~,~]=ejes(A9,1);
% Dedo medio
eslabon(p0,p1,'k',3);
% Dedo anular
eslabon(p0,p2,'k',3);
eslabon(p2,p3,'k',3);
% Dedo índice
eslabon(p0,p4,'k',3);
eslabon(p4,p5,'k',3);
% Dedo meñique
eslabon(p2,p6,'k',3);
eslabon(p6,p7,'k',3);
% Dedo pulgar
eslabon(p4,p8,'k',3);
eslabon(p8,p9,'k',4);