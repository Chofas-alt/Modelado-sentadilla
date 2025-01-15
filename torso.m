% Archivo: torso.m
% Descripción: representación cinemática de un torso 
function [po0,po1,po2]=torso(K0,q,l)
hold on
% Matrices de transformación homogénea
A01=trasl(0,0,l(1))*rotz(q(1))*rotx(q(2));
A12=trasl(0,0,l(2))*rotz(q(3))*rotx(q(4));
A23=trasl(0,0,l(3));


% Cadenas cinemáticas
K1=K0*A01;
K2=K1*A12;
K3=K2*A23;


% Sistema de referencia 0 (hombligo)
[po0,px0,py0,pz0]=ejes(K0,10);
% Sistema de referencia 1 (torso)
[po1,px1,py1,pz1]=ejes(K1,5);
% Sistema de referencia 2 (cuello)
[po2,px2,py2,pz2]=ejes(K2,5);
% Sistema de referencia 3 (cabeza)
[po3,px3,py3,pz3]=ejes(K3,25);


% Eslabones:
% hombligo-torso
eslabon(po0,po1,'k',3);
% torso-cuello
eslabon(po1,po2,'k',3);
% cuello-cabeza
eslabon(po2,po3,'k',3);

% Articulaciones:
% torso
elipsoide(po1,3,2,2,'b');
% cuello
elipsoide(po2,3,2,2,'b');
%cabeza
esfera(po3,10,'b');

% Sistemas de referencia
ejes3D(po0,px0,py0,pz0);
ejes3D(po1,px1,py1,pz1);
ejes3D(po2,px2,py2,pz2);
ejes3D(po3,px3,py3,pz3);
axis equal