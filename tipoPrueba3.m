function [n, vCoordenadas, vCargas, xq, yq, zq] = tipoPrueba3(prueba)
%TIPOPRUEBA3 Prueba de cargas para calcular el campo eléctrico en 3D
%   Según el valor ingresado de tipo de prueba (Un número entero)
%   se realizara algún tipo de test, es decir, se colocaran cargas
%   en ciertas coordenadas y se preguntará donde se quiere calcular
%   el campo eléctrico. (Se irán agregando pruebas)

if prueba == 1
    % 1.1 Prueba barra


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
    
    % área campo
    [xq, yq, zq] = area(vCoordenadas);
    
    
    
    
    
    
    
elseif prueba == 2
    % 1.12 Prueba anillo simple

    vCoordenadas = [0 0 2.5; 1.5 0 1.5; 2.5 0 0; 1.5 0 -1.5; 0 0 -2.5; -1.5 0 -1.5; -2.5 0 0; -1.5 0 1.5];

    % Cantidad de partículas        
    n = length(vCoordenadas);

    % Cargas según cantidad
    vCargas = repmat(1.6022e-9, 1, n);    
    
    % área campo
    [xq, yq, zq] = area(vCoordenadas);
    
    
    
    
    
    
elseif prueba == 3
    % 1.13 Prueba anillo/circunferencia compleja

    % Parámetros de circunferencia
    radio = 3;
    centro = [0, 0];
    cant_puntos = 50;

    % Coordenadas de la circunferencia
    theta1 = linspace(0, pi, cant_puntos/2)';
    x1 = radio * cos(theta1);
    z1 = radio * sin(theta1);
    coordenadas1 = [x1, zeros(size(x1)), z1] + [centro, 0];

    theta2 = linspace(pi, 2*pi, cant_puntos/2)';
    x2 = radio * cos(theta2);
    z2 = radio * sin(theta2);
    coordenadas2 = [x2, zeros(size(x2)), z2] + [centro, 0];

    vCoordenadas = [coordenadas1; coordenadas2];

    % coords(round(num_points/2),:) = [];

    % Graficar círculo
    % plot3(coords(:,1), coords(:,2), coords(:,3), 'p', 'LineWidth', 2);

    % Cantidad de partículas        
    n = length(vCoordenadas);

    % Cargas según cantidad
    vCargas = repmat(1.6022e-9, 1, n);

    
    % área campo
    [xq, yq, zq] = area(vCoordenadas);
    
else
    disp("Actualmente solo hay 3 pruebas escriba '1', '2', '3'")
    prueba = input("Tipo de prueba: ");
    [n, vCoordenadas, vCargas] = tipoPrueba3(prueba);
    
end
end

