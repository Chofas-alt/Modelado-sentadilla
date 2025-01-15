% Archivo: esfera.m
% Descripción: dibuja una esfera
function [ ]=esfera(po,r,c)
[Xc,Yc,Zc]=ellipsoid(po(1),po(2),po(3),r,r,r);
surf(Xc,Yc,Zc,'FaceColor',c,'EdgeColor','none');%surf se utiliza para crear una representación gráfica tridimensional de una superficie.