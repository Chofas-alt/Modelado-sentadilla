% Archivo: troncoo.m
% Descripción: representación cinemática de un brazo izquierdo
function [po0,po1,po2,po3,po4]=brazo_izquierdo(K0,q,l) %k0 matriz de tranformacion q vector de ángulos 
hold on
% Matrices de transformación homogénea
A01=rotz(-q(1))*roty(-q(2))*rotx(-q(3))*trasl(0,0,-l(1)); %(1) primer valor almacenado (en q2 para que abduza es -q)
A12=rotx(-q(4))*trasl(0,0,-l(2));% recuerda que l tiene xyz
A23=rotz(-q(5))*trasl(0,0,-l(3)); %para la pronación hacia dentro va a favor de las manecillas
A34=roty(q(6))*rotx(-q(7))*trasl(0,0,-l(4));
% Cadenas cinemáticas
K1=K0*A01;% del hombro al codo "A01" por K0= (aqui codo)
K2=K1*A12;%del codo al antebrazo "A12" por K1 = ahí antebrazo
K3=K2*A23;% movimiento del antebrazo
K4=K3*A34;%hacia la muñexa
% Sistema de referencia 0 (hombro)
[po0,px0,py0,pz0]=ejes(K0,10);
% Sistema de referencia 1 (codo)
[po1,px1,py1,pz1]=ejes(K1,5);
% Sistema de referencia 2 (antebrazo)
[po2,px2,py2,pz2]=ejes(K2,5);
% Sistema de referencia 3 (muñeca)
[po3,px3,py3,pz3]=ejes(K3,5);
% Sistema de referencia 4 (mano)
[po4,px4,py4,pz4]=ejes(K4,5);
% Eslabones:
% Hombro-codo
eslabon(po0,po1,'k',3);
% Codo-antebrazo
eslabon(po1,po2,'k',3);
% Antebrazo-muñeca
eslabon(po2,po3,'k',3);
% Muñeca-mano
eslabon(po3,po4,'k',3);
% Articulaciones:
% Hombro
esfera(po0,4,'b');
% Codo
cilindro(K1*roty(pi/2),6,3,3);
% Antebrazo
cilindro(K2,6,2,3);
% Muñeca
elipsoide(po3,3,2,2,'b');
% Mano:
mano(K4*rotz(pi));%cmbiando el pulgar de lugar
% Sistemas de referencia
ejes3D(po0,px0,py0,pz0);
ejes3D(po1,px1,py1,pz1);
ejes3D(po2,px2,py2,pz2);
ejes3D(po3,px3,py3,pz3);
ejes3D(po4,px4,py4,pz4);
axis equal