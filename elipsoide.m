% Archivo: elipsoide.m
% Descripción: dibuja un elipsoide
function [ ]=elipsoide(po,r1,r2,r3,c) % llama a ellipsoid para calcular las coordenadas del elipsoide no devuelve explicito
[Xc,Yc,Zc]=ellipsoid(po(1),po(2),po(3),r1,r2,r3);% realiza el cálculo de las coordenadas del elipsoide. Retorna una matriz tridimensional que representa el elipsoide y se almacena en Xc, Yc y Zc. 
surf(Xc,Yc,Zc,'FaceColor',c,'EdgeColor','none');%surf se utiliza para crear una representación gráfica tridimensional de una superficie. 