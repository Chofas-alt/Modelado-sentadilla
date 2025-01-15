% Archivo: cilindro.m
% Descripción: dibuja un cilindro
function []=cilindro(K,alto,radio,dif)
%Notas:
% - El cilindro es dibujado siempre en z, debe usarse K para cambiar de eje
% - K es la matriz de transformación homogénea
% - alto y radio son las dimensiones del cilindro
% - dif se puede utilizar para centrar el cilindro (e.g. dif=alto/2)
[Xc,Yc,Zc]=cylinder(radio);
zc=(Zc*alto)-dif;%modifica las coordenadas Z es decir la altura del cilindro 
xc=Xc(1,:);%acceder y almacenar las coordenadas de puntos específicos en el cilindro y permite trabajar con partes específicas del objeto de manera independient
yc=Yc(1,:);% extrae las coordenadas Y de la primera fila de Yc, que probablemente corresponde a la parte superior del cilindro
zc1=zc(1,:);% extrae parte inferior 
zc2=zc(2,:);%extrae Z  de la segunda fila de zc, lo que representa la parte superior del cilindro.
p1=[xc;yc;zc1;ones(1,length(zc1))];% representa los puntos inferiore del cilindo en coordenadas homogéneas para así aplicar una transformación 
p2=[xc;yc;zc2;ones(1,length(zc2))];%puntos superiores del cilindro´´
p1K=K*p1;%Esta multiplicación se utiliza para aplicar una transformación representada por la matriz K a los puntos en p1 inferior
p2K=K*p2;%Esta multiplicación se utiliza para aplicar una transformación representada por la matriz K a los puntos en p2 superioes
Xc=[p1K(1,:); p2K(1,:)];%contiene las coordenadas x de los puntos del cilindro después de aplicar la transformación a los puntos representados por p1 inf x y p2 supx
Yc=[p1K(2,:); p2K(2,:)];
Zc=[p1K(3,:); p2K(3,:)];
surf(Xc,Yc,Zc,'FaceColor','blue','EdgeColor','none');
camlight left;%agregar iluminacion