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

%% Campo electrico partículas simples

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
vCoordenadas = [[2,1;2,2;2,3;2,4;2,5;2,6;2,7;2,8;2,9;2,10;2,11];...
               [4,1;4,2;4,3;4,4;4,5;4,6;4,7;4,8;4,9;4,10;4,11]];
% Agregrar unidades
vCargas = [[1.6022e-9;1.6022e-19;1.6022e-19;1.6022e-9;1.6022e-9;...
            1.6022e-9;1.6022e-9;1.6022e-9;1.6022e-9;1.6022e-9;1.6022e-9],...
           [-1.6022e-9;-1.6022e-9;-1.6022e-9;-1.6022e-9;-1.6022e-9;
            -1.6022e-9;-1.6022e-9;-1.6022e-9;-1.6022e-9;-1.6022e-9;-1.6022e-9]];

% Cantidad de partículas        
n = length(vCoordenadas);
        
        
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
axis([-5 12 -5 12]) % Limita ejes del plot


% Partícula en donde se halla/cualcula el campo eléctrico
% ¿Pordía tal vez cambiarse partícula por coordenadas en donde se busca
% calcular el campo eléctrico?
particulaCampo = input("Particula a calcular campo E: ");

% Función campo Eléctrico
[campoElectricoX,campoElectricoY] = campoElectrico(vCoordenadas, vCargas, particulaCampo, n);

% Plot vectores campo eléctrico en la partícula
xp = repmat(vCoordenadas(particulaCampo,1), 1, n);
yp = repmat(vCoordenadas(particulaCampo,2), 1, n);
quiver(xp, yp, campoElectricoX, campoElectricoY); hold on

% Claculo magnitud de cmapo eléctrico
magnitudCampoE = ((sum(campoElectricoX))^2 + ...
                  (sum(campoElectricoY))^2)^(1/2);
