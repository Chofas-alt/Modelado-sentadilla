% Archivo: tronco.m
% Descripción: representación cinemática de un brazo izquierdo
function [po0,po1,po2,po3]=tronco(K0,q,l) %k0 matriz de tranformacion q vector de ángulos 
hold on
% Matrices de transformación homogénea
A01=trasl(0,0,l(1)); %(cadera al ombligo)
A12=rotz(q(1))*rotx(q(2))*trasl(0,0,l(2));% (ombligo al inicio colm)
A23=trasl(0,0,l(3));%col a cuello


% Cadenas cinemáticas
K1=K0*A01;% ombligo
K2=K1*A12;% columna
K3=K2*A23;% cuello

% Sistema de referencia 0 (cadera)
[po0,px0,py0,pz0]=ejes(K0,10);
% Sistema de referencia 1 (omb)
[po1,px1,py1,pz1]=ejes(K1,5);
% Sistema de referencia 2 (colum)
[po2,px2,py2,pz2]=ejes(K2,5);
% Sistema de referencia 3 (cuello)
[po3,px3,py3,pz3]=ejes(K3,5);


% Eslabones:
%cadera omb
eslabon(po0,po1,'k',3);
% om col
eslabon(po1,po2,'k',3);
%col cuello
eslabon(po2,po3,'k',3);
% Articulaciones:
% columna
elipsoide(po1,3,2,2,'b');
%cadera esfera 
%esfera(po3,2,'b');
% Sistemas de referencia
ejes3D(po0,px0,py0,pz0);
ejes3D(po1,px1,py1,pz1);
ejes3D(po2,px2,py2,pz2);
ejes3D(po3,px3,py3,pz3);

axis equal