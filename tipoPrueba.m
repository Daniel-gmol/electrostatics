function [n, vCoordenadas, vCargas] = tipoPrueba(prueba)
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
    end


elseif prueba == 2
    % 1.2 Directamente crear coordenadas y cargas eléctricas
    % 1.21 Prueba simple

    vCoordenadas = [1,2,0; -2,3,0; 7,10,0; 4, 8,0];
    vCargas = [-5 * 10^-9, 7 * 10^-9, 12 * 10 ^ -9, -7 * 10^-9];
    % Cantidad de partículas
    n = length(vCoordenadas);


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
    
    
else
    disp("Actualmente solo hay 3 pruebas escriba '1', '2', '3'")
    prueba = input("Tipo de prueba: ");
    [n, vCoordenadas, vCargas] = tipoPrueba(prueba);
    

end
end

