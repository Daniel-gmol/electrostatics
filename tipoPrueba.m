function [n, vCoordenadas, vCargas, xq, yq, zq] = tipoPrueba(prueba)
%TIPOPRUEBA Prueba de cargas para calcular el campo eléctrico en 2D
%   Según el valor ingresado de tipo de prueba (Un número entero)
%   se realizara algún tipo de test, es decir, se colocaran cargas
%   en ciertas coordenadas y se preguntará donde se quiere calcular
%   el campo eléctrico. (Se irán agregando pruebas)

if prueba == 1
    % 1.1 Ingresar cantidad, coordenadas, y carga para cada partícula

    n = input("Num. partículas: "); % Número de partículas

    % Matriz/Vector Almacenar Coordenadas/Carga eléctrica por Partícula
    vCoordenadas = zeros(n,3);   % [[x1, y1], [x2, y2], [x3, y3]];
    vCargas = 1:n;

    for c = 1:1:n
          % Coordenadas de particulas
          x = input("x: ");  %Unidades???
          y = input("y: ");
          vCoordenadas(c,:) = [x, y, 0];

          % Carga eléctrica de partículas
          carga = input("Carga: ");
          vCargas(c) = carga;

          % Gráficar partículas
          plot(x, y, '.r')
          hold on
          
          xq = 0;
          yq = 0;
          zq = 0;
    end


elseif prueba == 2
    % 1.2 Directamente crear coordenadas y cargas eléctricas
    % 1.21 Prueba simple

    vCoordenadas = [1,2,0; -2,3,0; 7,10,0; 4, 8,0];
    vCargas = [-5 * 10^-9, 7 * 10^-9, 12 * 10 ^ -9, -7 * 10^-9];
    % Cantidad de partículas
    n = length(vCoordenadas);
    
    xq = 0;
    yq = 0;
    zq = 0;

elseif prueba == 3
    % 1.22 Prueba barra 2D

    % Matriz Coordenadas (2D --> ∀ z, z = 0)
    vCoordenadas = [[2,1,0;
                     2,2,0;
                     2,3,0];

                   [4,1,0;
                    4,2,0;
                    4,3,0;]]; % Agregrar unidades

    % Vector Columna de cargas eléctricas
    vCargas = [1.6022e-9;1.6022e-9;1.6022e-9;
               -1.6022e-9;-1.6022e-9;-1.6022e-9;]; % Agregrar unidades

    % Cantidad de partículas        
    n = length(vCoordenadas);
    
    % área acotada por partículas
    [xq, yq, zq] = area(vCoordenadas);
    
elseif prueba == 4

    % 1.4 Prueba dos barras 2D
  
    x1 = input("Coordenada X barra 1: ");
    x2 = input("Coordenada X barra 2: ");
    y1 = input("Y inferior: ");
    y2 = input("Y superior: ");
    n = input("Numero de cargas para cada barra: ");
    yb = linspace(y1, y2, n);
    z = 0;
    
    % Prealocando vector coordenadas
    vCoordenadas = zeros(n*2, 3);
    
    for i = 1:n
        A = [x1, yb(i), z];
        vCoordenadas(i,:) = A;
    end
    
    for i = 1:n
        B = [x2, yb(i), z];
        vCoordenadas(n+i,:) = B;
    end
    
    % Vector Columna de cargas eléctricas
    vCargas = repmat(1.6022e-9, n*2, 1); % Agregar unidades
    vCargas(n+1:end) = -1.6022e-9; % Agregar unidades

    % Numero de coordenadas ajustado
    n = length(vCoordenadas);

    % área acotada por partículas
    [xq, yq, zq] = area(vCoordenadas);

elseif prueba == 5
    % 1.5 Prueba dos barras 2D

x1 = input("Coordenada X barra 1: ");
y1 = input("Y inferior: ");
y2 = input("Y superior: ");

x2 = input("Coordenada X barra 2: ");
y3 = input("Y inferior: ");
y4 = input("Y superior: ");


n1 =  input("Numero de cargas para barra 1: ");
n2 =  round((n1 / (y2 - y1)) * ((y4 - y3)));
yb1 = linspace(y1, y2, n1);
yb2 = linspace(y3, y4, n2);
z = 0;

% Prealocando vector coordenadas
vCoordenadas = zeros(n1 + n2, 3);

for i = 1:n1
    A = [x1, yb1(i), z];
    vCoordenadas(i,:) = A;
end

for i = 1:n2
    B = [x2, yb2(i), z];
    vCoordenadas(n1 + i,:) = B;
end

% Vector Columna de cargas eléctricas
vCargas = [repmat(1.6022e-9, n1, 1); repmat(-1.6022e-9, n2, 1)]; % Agregar unidades

% Numero de coordenadas ajustado
n = length(vCoordenadas);

% área acotada por partículas
[xq, yq, zq] = area(vCoordenadas);
    
else
    disp("Actualmente solo hay 4 pruebas escriba '1', '2', '3', '4'")
    prueba = input("Tipo de prueba: ");
    [n, vCoordenadas, vCargas] = tipoPrueba(prueba);
    
end
end

