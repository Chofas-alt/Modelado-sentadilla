% Archivo: cabeza
% Descripción: representación cinemática de un brazo derecho
function [po0,po1,po2]=cabeza(K0,q,l)
hold on
%arriba cadera esfera, rodilla cilindro, ellipsoide tobillo  6GDL cada uno
% Matrices de transformación homogénea
A01=trasl(0,0,l(1)); %(colm al cuello)
A12=rotz(q(1))*rotx(q(2))*trasl(0,0,l(2));% (cuello cabeza)

K1=K0*A01;% cuello
K2=K1*A12;% caebza

% Sistema de referencia 0 
[po0,px0,py0,pz0]=ejes(K0,10);

% Sistema de referencia 1 
[po1,px1,py1,pz1]=ejes(K1,5);
[po2,px2,py2,pz2]=ejes(K2,5);


% Eslabones:
% cuello cabeza
eslabon(po0,po1,'k',3);
eslabon(po1,po2,'k',3);

% Articulaciones:
% 

elipsoide(po1,3,2,2,'b');%cuello

esfera(po2,10,[0.5 0.5 .66]);%cabeza

% Sistemas de referencia
ejes3D(po0,px0,py0,pz0);
ejes3D(po1,px1,py1,pz1);
ejes3D(po2,px2,py2,pz2);

axis equal