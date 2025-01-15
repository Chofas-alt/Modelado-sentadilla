%%%% tratar de unir todo con respecto al centro de masa ;)
clear all
close all
clc
%% Información del usuario
p=1;%1=Sofi, 2=Lore, 3=Lupita,4=Fernando
vista=1; % Plano Sagital=1, Plano 3D=2

if p==1%persona Sofi
    ubi = 'C:\Users\52445\Downloads\angulosof.csv';
    nombre = 'angulosof';
    %introduce tus medidas
    torso=45;%torso
    bra_Codo=25;%Brazo codo
    cod_Mune=23;%Codo Muñeca
    femur_Rod=40;%Femur Rodilla
    Rod_Pie=38;%Rodilla Pie
end
if p==2%persona Lore
    ubi = 'C:\Users\52445\Downloads\loreangulo.csv';
    nombre = 'loreangulo';
    %introduce tus medidas
    torso=50;%torso
    bra_Codo=26;%Brazo codo
    cod_Mune=27;%Codo Muñeca
    femur_Rod=55;%Femur Rodilla
    Rod_Pie=44;%Rodilla Pie
end
if p==3%persona Lupita
    ubi = 'C:\Users\52445\Downloads\lupisangulo.csv';
    nombre = 'lupisangulo';
    %introduce tus medidas
    torso=45;%torso
    bra_Codo=26;%Brazo codo
    cod_Mune=27;%Codo Muñeca
    femur_Rod=46;%Femur Rodilla
    Rod_Pie=41;%Rodilla Pie
end
if p==4%persona Fernando
    ubi = 'C:\Users\52445\Downloads\ferangulo.csv';
    nombre = 'ferangulo';
    %introduce tus medidas
    torso=45;%torso
    bra_Codo=25;%Brazo codo
    cod_Mune=23;%Codo Muñeca
    femur_Rod=46;%Femur Rodilla
    Rod_Pie=39;%Rodilla Pie
end
%% Dimensiones de los eslabones (cm)
ancho = 5;
lc = [7;
    8]; %Longitud del eslabón del cuello
% Longitud de tronco
lt = [0;%Cadera ombligo
    torso;% Ombligo columna
    5];% Columna a cuello
%BRAZO
lb=[bra_Codo;
    cod_Mune;
    2;
    3];
%PIERNA
lp=[50;
    femur_Rod;
    Rod_Pie;
    2];

%% Llamar a la funcion
[poliC,tiempo_max,pc_min] = poli_ang(nombre, ubi, 4 ,6, 0);%cadera
[poliR,ti_max,pr_min] = poli_ang(nombre, ubi, 3,6, 0);%rodila
[poliT,t_maxi,pt_min] = poli_ang(nombre, ubi, 2,6, 0);%rodila

t_max = tiempo_max;   % tiempo máximo de la tabla
dt = 33;            % Diferencial de tiempo
tiempo = 0:dt:t_max;  % vector de tiempo

%% Graficar movimientos
delta=20;
f1=figure(1);
f2=figure(2);
for t_fal = 1:length(tiempo)%t de 1 a tiempo
    clf
    % Toma el tiempo real para t
    t = tiempo(t_fal);%(tiempo real en ms)
    Cadera=polyval(poliC,t);
    Rodilla=polyval(poliR,t);
    Tobillo=polyval(poliT,t);
    
    % Movimientos cadera-piernas-tobillos, Grados de libertad (+/-)
    rot_Cadera_Der=0;%rotación interna Cadera pierna derecha
    rot_Cadera_Izq=0;%rotación interna Cadera pierna izquierda
    
    abd_Cadera_Der=10;%abducción/extensión cadera derecha
    abd_Cadera_Izq=10;%abducción/extensión cadera izquierda
    
    flex_Rodillaflex_Der=Rodilla;%extensión sin rodilla flexionada para restricción con rodilla flexionada
    flex_Rodillaflex_Izq=Rodilla;%flexión/extensión con rodilla flexionada para restricción con rodilla flexionada
    
    flex_Rodilla_Der=Tobillo;%extensión/flexión con rodilla flexionada para restricción -60
    flex_Rodilla_Izq=Tobillo;%flexión/extensión con rodilla flexionada para restricción-60
    
    abd_Pie_Der=0;%abducción/extensión pie derecha
    abd_Pie_Izq=0;%abducción pie izquierda
    
    flex_Dorsal_Der=-15; %flexión dorsal/plantar derecha
    flex_Dorsal_Izq=-15; % flexión dorsal/ plantar izquierda
    
    % Movimientos cuello-tronco-brazos
    rot_Cuello=0;% rotación cuello
    flex_Cuello=15;%flexión/extensión cuello
    
    rot_tronco=0;% rotacion tronco
    flex_Tronco=Cadera;% flexion/ extensión tronco cadera
    
    rot_Hombro_Der=-10;%Rotación interna HOMBRO
    rot_Hombro_Izq=-10;%Rotación interna HOMBRO
    
    abd_Hombro_Der=40;%Abducción/aducción hombro
    abd_Hombro_Izq=40;%Abducción/aducción hombro
    
    flex_Brazo_Der=100;%flexión/ extensión brazo
    flex_Brazo_Izq=100;%flexión/ extensión brazo
    
    flex_Codo_Der=50;%Flexión/extensión codo
    flex_Codo_Izq=50;%Flexión/extensión codo
    
    pron_Antebrazo_Der=-50;%Pronación/supinación ANTEBRAZO
    pron_Antebrazo_Izq=-50;%Pronación/supinación ANTEBRAZO
    
    desv_Cubital_Der=0;%Desviación cubital/radial Muñeca
    desv_Cubital_Izq=0;%Desviación cubital/radial Muñeca
    
    flex_Muneca_Der=0;% flexión/extensión muñeca
    flex_Muneca_Izq=0;% flexión/extensión muñeca
    
    %%  Variables de ángulos para los movimientos Grados de libertad (+/-)
    %cuello
    aC=[rot_Cuello;%rotación cuello chequearla
        -flex_Cuello];%flexión/extensión cuello
    %tronco
    aT=[rot_tronco;%rotación
        flex_Tronco];%flexión/extension
    %pierna derecha
    aPd=[rot_Cadera_Der;%rotación interna cadera
        abd_Cadera_Der;%abducción/extensión cadera
        -flex_Rodillaflex_Der;%flexión/extensión con rodilla flexionada
        -flex_Rodilla_Der;%ext/flex rodilla corregir restricciones
        abd_Pie_Der;% abducción/ aducción pie
        flex_Dorsal_Der];%flexión dorsal/plantar
    
    %pierna izquierda
    aPi=[rot_Cadera_Izq;%rotación interna cadera
        abd_Cadera_Izq;%abducción/extensión cadera
        -flex_Rodillaflex_Izq;%flexión/extensión con rodilla flexionada
        -flex_Rodilla_Izq;%flex/ext rodilla
        abd_Pie_Izq;%abducción/ aducción pie
        flex_Dorsal_Izq];%flexión dorsal/plantar checar
    
    %brazo derecha
    aBd=[rot_Hombro_Der;%Rotación interna HOMBRO
        abd_Hombro_Der;%Abducción/aducción hombro
        flex_Brazo_Der;%flexión/ extensión brazo
        flex_Codo_Der;%Flexión/extensión codo
        pron_Antebrazo_Der;%Pronación/supinación ANTEBRAZO
        desv_Cubital_Der;%Desviación cubital/radial muñeca
        flex_Muneca_Der];%Flexión/extensión muñeca
    
    %brazo izquierda
    aBi=[rot_Hombro_Izq;%Rotación interna HOMBRO
        abd_Hombro_Izq;%Abducción/aducción hombro
        flex_Brazo_Izq;%flexión/ extensión brazo
        flex_Codo_Izq;%Flexión/extensión codo
        pron_Antebrazo_Izq;%Pronación/supinación ANTEBRAZO
        desv_Cubital_Izq;%Desviación cubital/radial Muñeca
        flex_Muneca_Izq]; % flexión/extensión muñeca
    
    %% Ajusta el ángulo
    % Calcula el ángulo Complementario del Tronco
    aTs = 90 - aT(2);% Calculo del angulo complementario
    aT(2)=aTs;
    % Calcula el ángulo complementario de Cuadricep derecha
    aPid = 90 - aPd(3);
    aPd(3)=aPid;
    % Calcula el ángulo Complementario Pierna Izquierda
    aPii = 90 - aPi(3);
    aPi(3)=aPii;
    %reproducir la sentadilla de la persona
    if p==1%acomodo complexion persona Sofi
        b=3.5;
    end
    if p==2 %acomodo complexion persona Lore
        b=4.2;
    end
    if p==3%acomodo complexion persona Lupita
        b=6.5;
    end
    if p==4 %acomodo complexion persona Fernando
        b=4;
    end
    
    %Calculo de angulo de la rodilla derecha respecto al tiempo de la sentadilla
    ad=90+aPd(4); %complementario del angulo tibio-femoral
    aP=(-ad*b)+aPd(4)+90;%angulo simulado tibio_femoral
    aPd(4)=aP;
    
    %Calculo de angulo de la rodilla izquierda respecto al tiempo de la sentadilla
    ai=90+aPi(4);
    aP=(-ai*b)+aPi(4)+90;%angulo simulado tibio_femoral
    aPi(4)=aP;
    
    
    %% Grados de libertad del cuello(+/-)
    qC = zeros(2,1);
    %Grados de libertad del tronco(+/-)-------------
    qt = zeros(2,1);
    %Grados de libertad de la pierna DERECHA
    qPd = zeros(6,1); %(+/-) piernaa
    %Grados de libertad de la pierna IZQUIERDA----------
    qPi = zeros(6,1);
    % Grados de libertad del brazo derecho
    qBd=zeros(7,1); %(+/-)
    %IZQUIERDO------------------------
    qBi=zeros(7,1); %(+/-)
    
    %% Cambiar a radianes
    for i=1:7
        qBd(i)=aBd(i)*pi/180;
    end
    
    %Pasar a radianes los gdl del brazo izquierdo
    for i=1:7
        qBi(i)=aBi(i)*pi/180;
    end
    
    %Pasar a radianes los gdl de la pierna derecha
    for i=1:6
        qPd(i)=aPd(i)*pi/180;
    end
    
    %Pasar a radianes los gdl de la pierna izquierda
    for i=1:6
        qPi(i)=aPi(i)*pi/180;
    end
    
    %Pasar a radianes los gdl del torso
    for i=1:2
        qt(i)=aT(i)*pi/180;
    end
    for i=1:2
        qC(i)=aC(i)*pi/180;
    end
    %% Cadenas cinemáticas
    K0 = eye(4);%centro de masa
    KS = K0*rotz(qt(1))*rotx(qt(2));%rotaciones del tronco superior
    
    KC = KS*trasl(0,0,lt(2));%cabeza
    
    KT= K0*trasl(0,0,-lt(1));%tronco
    
    KBd = KS*trasl(0,0,lt(2))*trasl(-ancho-5,0,0);% brazo derecho
    KBi = KS*trasl(0,0,lt(2))*trasl(ancho+5,0,0);% brazo izq
    
    KPd = K0*trasl(0,0,-lt(1))*trasl(-ancho,0,0);%Pierna derecha
    KPi = K0*trasl(0,0,-lt(1))*trasl(ancho,0,0);%Pierna izquierda
    
    
    %%  Representación gráfica en los planos corporales
    
    if vista==1
        %Cabeza y tronco
        [po0c, po1c] = cabeza(KC,qC,lc);
        [po0t,po1t,po2t,po3t] = tronco(KT, qt, lt);
        %
        %Brazo
        [po0bd,po1bd,po2bd,po3bd,po4bd]= brazo_derecho(KBd,qBd,lb);
        [po0bi,po1bi,po2bi,po3bi,po4bi]=brazo_izquierdo(KBi,qBi,lb);
        
        %Piernas
        [po0pd, po1pd, po2d, po3pd] = pierna_derecha(KPd, qPd,lp);
        [po0pi,po1pi, po2pi, po3pi] = pierna_izquierda(KPi,qPi, lp);
        
        %conexión entre las partes
        eslabon(po0pd,po0pi,'k',3);
        eslabon(po0bd,po0bi,'k',3);
        
        x1 = xlabel('$x$','interpreter','latex');
        set(x1,'FontName','Times','FontSize',18);
        y1 = ylabel('$y$','interpreter','latex');
        set(y1,'FontName','Times','FontSize',18);
        z1 = zlabel('$z$','interpreter','latex');
        set(z1,'FontName','Times','FontSize',20,'rotation',0);
        axis([-100 100 -100 50 -150 150])
        % Plano sagital
        view([90,0])
        t1=title("Plano Sagital");
        
    end
    %% Vista 3D
    if vista==2
        
        set(f2,'Color','w');
        hold on
        
        %Cabeza y tronco
        [po0c, po1c] = cabeza(KC,qC,lc);
        [po0t,po1t,po2t,po3t] = tronco(KT, qt, lt);
        %
        %Brazo
        [po0bd,po1bd,po2bd,po3bd,po4bd]= brazo_derecho(KBd,qBd,lb);
        [po0bi,po1bi,po2bi,po3bi,po4bi]=brazo_izquierdo(KBi,qBi,lb);
        
        %Piernas
        [po0pd, po1pd, po2d, po3pd] = pierna_derecha(KPd, qPd,lp);
        [po0pi,po1pi, po2pi, po3pi] = pierna_izquierda(KPi,qPi, lp);
       
        
        %conexión entre las partes
        eslabon(po0pd,po0pi,'k',3);
        eslabon(po0bd,po0bi,'k',3);
        
        
        % Propiedades de formato y visualización
        x1 = xlabel('$x$','interpreter','latex');
        set(x1,'FontName','Times','FontSize',18);
        y1 = ylabel('$y$','interpreter','latex');
        set(y1,'FontName','Times','FontSize',18);
        z1 = zlabel('$z$','interpreter','latex');
        set(z1,'FontName','Times','FontSize',20,'rotation',0);
        axis=([-100 100 -100 100 -150 150])
        view([35,25])
        t1=title('Plano 3D');
    end
    %% Evaluacion de técnica
    
    if pc_min<35 % debe ser mayor a 30 en el descenso cadera
        txt = "Inclina menos tu torso";
        text(7, 32, 5, txt,'FontName',"Times","Fontsize",14,"Color","k");
    end
    if pr_min > -90 % 88 o más descenso rodilla
        tx = " Debes bajar más tu cadera"; % baja más la cadera, debe ser menor el ángulo de la rodilla
        text(7, 32, 45, tx,'FontName',"Times","Fontsize",14,"Color","k");
    end
    if pt_min <60 % El ángulo del tobillo y la tibia se tiene que mantener mayor a 60
        txt = "Debes retroceder tus pies"; % así las rodillas pueden avanzar sobre los dedos del pie, más equilibrio
        text(7, 32, 45, txt,'FontName',"Times","Fontsize",14,"Color","k");
    end
    %% propiedades de animacion
    pause(1e-52);% tiempo de espera
    %Quitar las luces del error y agregar una
    delete(findall(gcf,'Type','light'));%% encuentra y elimina las luces de la imagen
    light('Position',[0 1 1],'Style','Infinite');% agrega las luces en u
end

    if pc_min<35 % debe ser mayor a 30 en el descenso cadera
        disp("Inclina menos tu torso");
    end
    if pr_min > -90 % 88 o más descenso rodilla
        disp("Tu descenso no debe ser menor a 90°");
    end
    if pt_min <60 % El ángulo del tobillo y la tibia se tiene que mantener mayor a 60
        disp("Debes retroceder tus pies");
    end
