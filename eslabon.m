% Archivo: eslabon.m
% Descripción: dibuja un eslabón
function []=eslabon(Po,Pf,c,lw) %lw grosor de la línea 
po=Po'; %punto final despues d ela transformada 
pf=Pf';
plot3([po(1) pf(1)],[po(2) pf(2)],[po(3) pf(3)],c,'LineWidth',lw);% plot3 Se utilizan para graficar lineas y lo que hace aqui es trazar una desde po(1) coordenada x hasta px(1)