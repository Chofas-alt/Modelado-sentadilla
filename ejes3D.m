% Archivo: ejes3D.m
% Descripción: dibuja los ejes que componen un sistema de referencia cartesiano
function [ ]=ejes3D(Po,Px,Py,Pz)% Po,Px,Py,Pz sacados de ejes (ya las posiciones calculadas con A y son argumentos de entrada que representan las coordenadas de los puntos en el espacio tridimensional)
po=Po'; px=Px'; py=Py'; pz=Pz';%  de [1,2,3] se pasa a columnas [1][2][3] PoPxPyPz se sacan de la funcion ejes 3D 
hold on% misma figura
plot3([po(1) px(1)],[po(2) px(2)],[po(3) px(3)],'r','LineWidth',2); % plot3 Se utilizan para graficar lineas y lo que hace aqui es trazar una desde po(1) coordenada x hasta px(1) ampliada por t aquí y pues po(2) que representa las coordenadas y es el mismo que py(2) lo mismo con po(3)q representa Z pero como es el mismo pz(3), pq soólo dibujaremos el eje x y es de color rojo
plot3([po(1) py(1)],[po(2) py(2)],[po(3) py(3)],'g','LineWidth',2);
plot3([po(1) pz(1)],[po(2) pz(2)],[po(3) pz(3)],'b','LineWidth',2);
grid on
