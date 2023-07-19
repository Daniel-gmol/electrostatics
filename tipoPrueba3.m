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
    
elseif prueba == 4
    % 1.4 Prueba dos barras 3D

x1 = input("Coordenada X barra 1: ");
y1 = input("Coordenada Y barra 1: ");
z1 = input("Z inferior: "); 
z2 = input("Z superior: ");

x2 = input("Coordenada X barra 2: ");
y2 = input("Coordenada Y barra 1: ");
z3 = input("Z inferior: ");
z4 = input("Z superior: ");


n1 =  input("Numero de cargas para barra 1: ");
n2 =  round((n1 / (z2 - z1)) * ((z4 - z3)));
zb1 = linspace(z1, z2, n1);
zb2 = linspace(z3, z4, n2);


% Prealocando vector coordenadas
vCoordenadas = zeros(n1 + n2, 3);

for i = 1:n1
    A = [x1, y1, zb1(i)];
    vCoordenadas(i,:) = A;
end

for i = 1:n2
    B = [x2, y2, zb2(i)];
    vCoordenadas(n1 + i,:) = B;
end

% Vector Columna de cargas eléctricas
vCargas = [repmat(1.6022e-9, n1, 1); repmat(-1.6022e-9, n2, 1)]; % Agregar unidades

% Numero de coordenadas ajustado
n = length(vCoordenadas);

% área acotada por partículas
[xq, yq, zq] = area(vCoordenadas);

elseif prueba == 5
    % 1.15 Prueba anillo/circunferencia compleja

    % Parámetros de circunferencia 1
    radio1 = 3;
    centro1 = [0, 0];
    cant_puntos = 50;

    % Coordenadas de la circunferencia 1
    theta1 = linspace(0, pi, cant_puntos/2)';
    x1 = radio1 * cos(theta1);
    z1 = radio1 * sin(theta1);
    coordenadas1 = [x1, zeros(size(x1)), z1] + [centro1, 0];

    theta2 = linspace(pi, 2*pi, cant_puntos/2)';
    x2 = radio1 * cos(theta2);
    z2 = radio1 * sin(theta2);
    coordenadas2 = [x2, zeros(size(x2)), z2] + [centro1, 0];

    % Parámetros de circunferencia 2
    radio2 = 4;
    centro2 = [0, -6, 0]; % separated 5 units in the z-direction from the first circle

    % Coordenadas de la circunferencia 2
    theta3 = linspace(0, pi, cant_puntos/2)';
    x3 = radio2 * cos(theta3);
    z3 = radio2 * sin(theta3);
    coordenadas3 = [x3, zeros(size(x3,1),1), z3] + [repmat(centro2, size(x3,1), 1)];


    theta4 = linspace(0, 2*pi, cant_puntos/2)';
    x4 = radio2 * cos(theta4);
    z4 = radio2 * sin(theta4);
    coordenadas4 = [x4, zeros(size(x4,1),1), z4] + [repmat(centro2, size(x4,1), 1)];


    % Combine coordinates of both circles
    vCoordenadas = [coordenadas1; coordenadas2; coordenadas3; coordenadas4];

    % Number of particles
    n = length(vCoordenadas);

    % Charges according to the number of particles
    vCargas = [repmat(1.6022e-9, 1, n/2), repmat(-1.6022e-9, 1, n/2)];

    % Calculate area of the field
    [xq, yq, zq] = area(vCoordenadas);

elseif prueba == 6
    % 1.13 Prueba anillo/circunferencia compleja

    % Parameters for first circle
    radio1 = 3;
    centro1 = [0, 0, 0];
    cant_puntos = 50;

    % Coordinates of first circle
    theta1 = linspace(0, 2*pi, cant_puntos)';
    x1 = radio1 * cos(theta1);
    y1 = zeros(size(x1));
    z1 = radio1 * sin(theta1);
    coordenadas1 = [x1, y1, z1] + [centro1, 0];

    % Parameters for second circle
    radio2 = 2;
    centro2 = [0, 0, 0];

    % Coordinates of second circle
    theta2 = linspace(0, 2*pi, cant_puntos)';
    x2 = radio2 * cos(theta2);
    y2 = zeros(size(x2));
    z2 = radio2 * sin(theta2);
    coordenadas2 = [x2, y2, z2] + [centro2, 0];

    % Parameters for third circle
    radio3 = 1;
    centro3 = [0, 0, 0];

    % Coordinates of third circle
    theta3 = linspace(0, 2*pi, cant_puntos)';
    x3 = radio3 * cos(theta3);
    y3 = zeros(size(x3));
    z3 = radio3 * sin(theta3);
    coordenadas3 = [x3, y3, z3] + [centro3, 0];

    % Parameters for fourth circle
    radio4 = 4;
    centro4 = [0, -6, 0]; % shift along y-axis
    cant_puntos2 = 50;

    % Coordinates of fourth circle
    theta4 = linspace(0, 2*pi, cant_puntos2)';
    x4 = radio4 * cos(theta4);
    y4 = zeros(size(x4));
    z4 = radio4 * sin(theta4);
    coordenadas4 = [x4, y4, z4] + [centro4, 0];

    % Combine all coordinates into one array
    vCoordenadas = [coordenadas1; coordenadas2; coordenadas3; coordenadas4];

    % Number of particles
    n = length(vCoordenadas);

    % Charges
    vCargas = repmat(1.6022e-9, 1, n);

    % Compute area of field
    [xq, yq, zq] = area(vCoordenadas);

    % Plot filled circles
    fill3(coordenadas1(:,1), coordenadas1(:,2), coordenadas1(:,3), 'r');
    fill3(coordenadas2(:,1), coordenadas2(:,2), coordenadas2(:,3), 'g');
    fill3(coordenadas3(:,1), coordenadas3(:,2), coordenadas3(:,3), 'b');
    fill3(coordenadas4(:,1), coordenadas4(:,2), coordenadas4(:,3), 'y');

    % Set plot properties
    axis equal;
    grid on;
    xlabel('X-axis');
    ylabel('Y-axis');
    zlabel('Z-axis');
    title('Electric field visualization');

    
    
else
    disp("Actualmente solo hay 3 pruebas escriba '1', '2', '3'")
    prueba = input("Tipo de prueba: ");
    [n, vCoordenadas, vCargas] = tipoPrueba3(prueba);
    
end
end

