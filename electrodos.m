%% Modelación de sistemas eléctricos

%{
  Equipo:
    n
    n
    n
    n
    
%}

%% Campo electrico partículas simples

clc
clear


n = input("Num. partículas: "); % Número de partículas


% Matriz/Vector Almacenar Coordenadas/Carga eléctrica por Partícula
vCoordenadas = zeros(n,2);  % [[x1, y1], [x2, y2], [x3, y3]];
vCargas = 1:n;

% Opcional/Pruebas
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
axis([0 15 0 12])


% Partícula en donde se cualcula el campo 
particulaCampo = input("Particula a calcular: ");

% Constante
k = 8.99 * 10^9; % Nm^2/C^2

e = 0; % Total campo eléctrico
for i = 1:n
    distancia = ((vCoordenadas(particulaCampo,1) - vCoordenadas(i,1))^2 ...
    + (vCoordenadas(particulaCampo, 2) - vCoordenadas(i, 2))^2)^(1/2); 

    %{ 
        Agregar Vecotor Unitario para el cálculo correcto;
        x = 
    %} 
    
    if distancia ~= 0
        e = e + k * vCargas(particulaCampo) * vCargas(i) / distancia^2;  
        disp(e)
    end
end

