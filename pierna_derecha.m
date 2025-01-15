% Archivo: pierna_izquierda.m
% Descripción: representación cinemática de una pierna izquierda 
function [po0,po1,po2,po3]=pierna_derecha(K0,q,l)
hold on
%arriba cadera esfera, rodilla cilindro, ellipsoide tobillo  6GDL cada uno
% Matrices de transformación homogénea
A01=rotz(q(1))*roty(q(2))*rotx(-q(3))*trasl(0,0,-l(2));% rotacion interna positivo,q2 abduccion positvo,flexion negativo  
A12=rotx(-q(4))*trasl(0,0,-l(3));%flexion rodilla negativo 
A23=roty(q(5))*rotx(-q(6))*trasl(0,0,-l(4));%abduccion positivo, flexion negativo
% Cadenas cinemáticas
K1=K0*A01;
K2=K1*A12;
K3=K2*A23;

% Sistema de referencia 0 (femur)
[po0,px0,py0,pz0]=ejes(K0,10);
% Sistema de referencia 1 ( rodilla)
[po1,px1,py1,pz1]=ejes(K1,5);
% Sistema de referencia 2 (tobillo)
[po2,px2,py2,pz2]=ejes(K2,5);
% Sistema de referencia 3 (pie)
[po3,px3,py3,pz3]=ejes(K3,5);
% Sistema de referencia 4 (pie)

% Eslabones:
% femur-rodilla
eslabon(po0,po1,'k',3);
% rodilla-tobillo
eslabon(po1,po2,'k',3);
% tobillo-pie
eslabon(po2,po3,'k',3);

% Articulaciones:
% femur
esfera(po0,4,'b');
%rodilla
cilindro(K1*roty(pi/2),6,3,3);
% tobillo
elipsoide(po3,3,2,2,'b');
% pie:
pie(K3);
% Sistemas de referencia
ejes3D(po0,px0,py0,pz0);
ejes3D(po1,px1,py1,pz1);
ejes3D(po2,px2,py2,pz2);
ejes3D(po3,px3,py3,pz3);

axis equal