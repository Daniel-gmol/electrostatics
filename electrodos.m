% Modelación de sistemas eléctricos

%{
  Equipo:
    n
    n
    n
    n
    n
    n
    
%}

%% 2D

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


% Prueba

vCoordenadas = [[2,1,0;
                 2,2,0;
                 2,3,0];
               
               [4,1,0;
                4,2,0;
                4,3,0;]]; % Agregrar unidades

vCargas = [1.6022e-9;1.6022e-9;1.6022e-9;
           -1.6022e-9;-1.6022e-9;-1.6022e-9;]; % Agregrar unidades

% Cantidad de partículas        
n = length(vCoordenadas);

% Dimension
dimension = 2;

% Preguntar si se Calcula para Particula de Prueba o Particula Existente
particulaPrueba = input("Particula existente (E) o de prueba (P): ", "s");

% Coordenadas en donde se halla/cualcula el campo eléctrico de partícual de prueba
if particulaPrueba == "P"
    % Coordenada partícula de prueba en donde se calcula Campo Eléctrico
    coordenadaCampoX = input("Coordenada X: ");
    coordenadaCampoY = input("Coordenada Y: ");
    
    % Almacenamiento de coordenadas de particula prueba en arreglo de coordenadas de partículas existentes
    vCoordenadas(end + 1, 1) = coordenadaCampoX;
    vCoordenadas(end, 2) = coordenadaCampoY;
    
    % Añadir carga de prueba a vector de cargas q = 1
    vCargas(end + 1, 1) = 1;
    
    % Aumentar número de partículas/ se agrega la de prueba
    n = n + 1;
    
    % Partícula en que se evalua el campo es la última en el arreglo (Posición: n)
    particulaCampo = n;
else
    % Particula en donde se calculará el campo eléctrico si NO es partícula de prueba
    particulaCampo = input("Particula a calcular campo E: ");
end


% Graficación de partículas
graficoCoordenadas(vCoordenadas, vCargas, n, dimension)


% Calculo vectorial campo Eléctrico (X, Y)
[campoElectricoX,campoElectricoY, ~] = campoElectrico(vCoordenadas, vCargas, particulaCampo, n);


% Graficación vectores campo eléctrico en la partícula

% Creación de matriz repitiendo coordenada X - Y en donde inicia el vector
xp = repmat(vCoordenadas(particulaCampo,1), 1, n);
yp = repmat(vCoordenadas(particulaCampo,2), 1, n);

% Función graficadora de vectores de campo eléctrico
graficoVectores(xp, yp, campoElectricoX, campoElectricoY);


% Calculo magnitud de campo eléctrico
magnitudCampoE = ((sum(campoElectricoX))^2 + ...
                  (sum(campoElectricoY))^2)^(1/2);
              
disp("Magnitud campo eléctrico en (" + ...
    vCoordenadas(particulaCampo,1) + ", " + vCoordenadas(particulaCampo,2) ...
    + "): " + magnitudCampoE) % Agregar unidades?





%% 3D

clc

% Prueba

vCoordenadas = [[2,2,1;
                 2,2,2;
                 2,2,3];
               
               [4,4,1;
                4,4,2;
                4,4,3;]]; % Agregrar unidades
            
vCargas = [1.6022e-9;1.6022e-9;1.6022e-9;
           -1.6022e-9;-1.6022e-9;-1.6022e-9;]; % Agregrar unidades

% Cantidad de partículas        
n = length(vCoordenadas);

% Dimension
dimension = 3;

% Preguntar si se Calcula para Particula de Prueba o Particula Existente
particulaPrueba = input("Particula existente (E) o de prueba (P): ", "s");

% Coordenadas en donde se halla/cualcula el campo eléctrico de partícual de prueba
if particulaPrueba == "P"
    % Coordenada partícula de prueba en donde se calcula Campo Eléctrico
    coordenadaCampoX = input("Coordenada X: ");
    coordenadaCampoY = input("Coordenada Y: ");
    coordenadaCampoZ = input("Coordenada Z: ");
    
    % Almacenamiento de coordenadas de particula prueba en arreglo de coordenadas de partículas existentes
    vCoordenadas(end + 1, 1) = coordenadaCampoX;
    vCoordenadas(end, 2) = coordenadaCampoY;
    vCoordenadas(end, 3) = coordenadaCampoZ;
    
    % Añadir carga de prueba a vector de cargas q = 1
    vCargas(end + 1, 1) = 1;
    
    % Aumentar número de partículas / se agrega la partícula de prueba
    n = n + 1;
    
    % Partícula en que se evalua el campo es la última en el arreglo (Posición: n)
    particulaCampo = n;
else
    % Partícula en donde se calculará el campo eléctrico si NO es partícula de prueba
    particulaCampo = input("Particula a calcular campo E: ");
end


% Graficación de partículas
graficoCoordenadas(vCoordenadas, vCargas, n, dimension)


% Calculo vectorial campo Eléctrico (X, Y, Z)
[campoElectricoX,campoElectricoY, campoElectricoZ] = campoElectrico(vCoordenadas, vCargas, particulaCampo, n);


% Graficación vectores campo eléctrico en la partícula

% Creación de matriz repitiendo coordenada X - Y en donde inicia el vector
xp = repmat(vCoordenadas(particulaCampo,1), 1, n);
yp = repmat(vCoordenadas(particulaCampo,2), 1, n);
zp = repmat(vCoordenadas(particulaCampo,3), 1, n);

% Función graficadora de vectores de campo eléctrico
graficoVectores3(xp, yp, zp, campoElectricoX, campoElectricoY, campoElectricoZ);


% Calculo magnitud de campo eléctrico
magnitudCampoE = ((sum(campoElectricoX))^2  + ...
                  (sum(campoElectricoY))^2  + ...
                  (sum(campoElectricoZ))^2) ^ (1/2);

disp("Magnitud campo eléctrico en (" + ...
    vCoordenadas(particulaCampo,1) + ", " + vCoordenadas(particulaCampo,2) + ", " + vCoordenadas(particulaCampo, 3) ...
    + "): " + magnitudCampoE) % Agregar unidades?




