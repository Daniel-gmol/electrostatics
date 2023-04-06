%% Modelación de sistemas eléctricos

%{
  Equipo:
    n
    n
    n
    n
    n
    n
    
%}

%% Campo electrico partículas simples 2D

clc
clear


%Ingresar cantidad, coordenadas, y carga para cada partícula
%{
n = input("Num. partículas: "); % Número de partículas

% Matriz/Vector Almacenar Coordenadas/Carga eléctrica por Partícula
vCoordenadas = zeros(n,2);   [[x1, y1], [x2, y2], [x3, y3]];
vCargas = 1:n;

for c = 1:1:n
      % Coordenadas de particulas
      x = input("x: ");  %Unidades???
      y = input("y: ");
      vCoordenadas(c,:) = [x, y];

      % Carga eléctrica de partículas
      carga = input("Carga: ");
      vCargas(c) = carga;

      % Gráficar partículas
      plot(x, y, '.r')
      hold on
end
%}


% Directamente crear coordenadas y cargas eléctricas

% Prueba simple

%{ 
vCoordenadas = [1,2; -2,3; 7,10; 4, 8];
vCargas = [-5 * 10^-9, 7 * 10^-9, 12 * 10 ^ -9, -7 * 10^-9];
n = length(vCoordenadas);
%}

% Prueba compleja
% Agregrar unidades
vCoordenadas = [[2,1,0;
                 2,2,0;
                 2,3,0];
               
               [4,1,0;
                4,2,0;
                4,3,0;]];
            
% Agregrar unidades
vCargas = [1.6022e-9;1.6022e-9;1.6022e-9;
           -1.6022e-9;-1.6022e-9;-1.6022e-9;];

% Cantidad de partículas        
n = length(vCoordenadas);


% Partícula en donde se halla/cualcula el campo eléctrico

% Preguntar si se Calcula para Particula de Prueba o Particula Existente
particulaPrueba = input("Particula existente (E) o de prueba (P): ", "s");

if particulaPrueba == "P"
    
    % Coordenada partícula de prueba en donde se calcula Campo Eléctrico
    coordenadaCampoX = input("Coordenada X: ");
    coordenadaCampoY = input("Coordenada Y: ");
    
    % Almacenamiento de coordenadas de particula prueba
    % en arreglo de coordenadas de partpículas existentes
    vCoordenadas(end + 1, 1) = coordenadaCampoX;
    vCoordenadas(end, 2) = coordenadaCampoY;
    
    % Añadir carga de prueba a vector de cargas
    vCargas(end + 1, 1) = 1;
    
    % Aumentar número de partículas/ se agrega la de prueba
    n = n + 1;
    
    % Partícula en que se evalua el campo es la última en el arreglo
    % Posición n
    particulaCampo = n;
else
    % Particula en dodne se calculará el campo eléctrico
    particulaCampo = input("Particula a calcular campo E: ");
end


        
% Plot de las coordenadas de las partículas en 2D según la carga
for i = 1:n
   if vCargas(i) < 0
       % Azul cargas negativas
       plot(vCoordenadas(i), vCoordenadas(i, 2), '.b')
       hold on
   else
       % Rojo cargas positivas
       plot(vCoordenadas(i), vCoordenadas(i, 2), '.r')
       hold on
   end
end
axis equal  % Limita ejes del plot
% PRUEBA DE EJES: axis([-5 12 -5 12])



% Función campo Eléctrico
[campoElectricoX,campoElectricoY, ~] = campoElectrico(vCoordenadas, vCargas, particulaCampo, n);


% Graficación vectores campo eléctrico en la partícula

% Creación de matriz repitiendo coordenada X - Y en donde inicia el vector
xp = repmat(vCoordenadas(particulaCampo,1), 1, n);
yp = repmat(vCoordenadas(particulaCampo,2), 1, n);

graficoVectores(xp, yp, campoElectricoX, campoElectricoY);

% Calculo magnitud de campo eléctrico
magnitudCampoE = ((sum(campoElectricoX))^2 + ...
                  (sum(campoElectricoY))^2)^(1/2);
disp("Magnitud campo eléctrico en (" + ...
    vCoordenadas(particulaCampo,1) + ", " + vCoordenadas(particulaCampo,2) + "): " ...
    + magnitudCampoE) % Agregar unidades?

%% Campo electrico partículas simples 3D

clc

% Prueba compleja
% Agregrar unidades
vCoordenadas = [[2,2,1;
                 2,2,2;
                 2,2,3];
               
               [4,4,1;
                4,4,2;
                4,4,3;]];
            
% Agregrar unidades
vCargas = [1.6022e-9;1.6022e-9;1.6022e-9;
           -1.6022e-9;-1.6022e-9;-1.6022e-9;];

% Cantidad de partículas        
n = length(vCoordenadas);


% Partícula en donde se halla/cualcula el campo eléctrico

% Preguntar si se Calcula para Particula de Prueba o Particula Existente
particulaPrueba = input("Particula existente (E) o de prueba (P): ", "s");

if particulaPrueba == "P"
    
    % Coordenada partícula de prueba en donde se calcula Campo Eléctrico
    coordenadaCampoX = input("Coordenada X: ");
    coordenadaCampoY = input("Coordenada Y: ");
    coordenadaCampoZ = input("Coordenada Z: ");
    
    % Almacenamiento de coordenadas de particula prueba
    % en arreglo de coordenadas de partpículas existentes
    vCoordenadas(end + 1, 1) = coordenadaCampoX;
    vCoordenadas(end, 2) = coordenadaCampoY;
    vCoordenadas(end, 3) = coordenadaCampoZ;
    
    % Añadir carga de prueba a vector de cargas
    vCargas(end + 1, 1) = 1;
    
    % Aumentar número de partículas/ se agrega la de prueba
    n = n + 1;
    
    % Partícula en que se evalua el campo es la última en el arreglo
    % Posición n
    particulaCampo = n;
else
    % Particula en dodne se calculará el campo eléctrico
    particulaCampo = input("Particula a calcular campo E: ");
end


        
% Plot de las coordenadas de las partículas en 3D según la carga
for i = 1:n
   if vCargas(i) < 0
       % Azul cargas negativas
       plot3(vCoordenadas(i), vCoordenadas(i, 2), vCoordenadas(i, 3), '.b')
       hold on
   else
       % Rojo cargas positivas
       plot3(vCoordenadas(i), vCoordenadas(i, 2), vCoordenadas(i, 3), '.r')
       hold on
   end
end
% axis equal   Limita ejes del plot
% PRUEBA DE EJES: axis([-5 12 -5 12])



% Función campo Eléctrico
[campoElectricoX,campoElectricoY, campoElectricoZ] = campoElectrico(vCoordenadas, vCargas, particulaCampo, n);


% Graficación vectores campo eléctrico en la partícula

% Creación de matriz repitiendo coordenada X - Y en donde inicia el vector
xp = repmat(vCoordenadas(particulaCampo,1), 1, n);
yp = repmat(vCoordenadas(particulaCampo,2), 1, n);
zp = repmat(vCoordenadas(particulaCampo,3), 1, n);

graficoVectores3(xp, yp, zp, campoElectricoX, campoElectricoY, campoElectricoZ);


% Calculo magnitud de campo eléctrico
magnitudCampoE = ((sum(campoElectricoX))^2  + ...
                  (sum(campoElectricoY))^2  + ...
                  (sum(campoElectricoZ))^2) ^ (1/2);
