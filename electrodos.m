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
vcor = zeros(n,2);  % [[x1, y1], [x2, y2], [x3, y3]];
vc = 1:n;

% Opcional/Pruebas
for c = 1:1:n
    % Coordenadas de particulas
    cx = input("x: ");  %Unidades???
    cy = input("y: ");
    vcor(c,:) = [cx, cy];
    
    % Carga eléctrica de partículas
    carga = input("Carga: ");
    vc(c) = carga;
    
    % Gráficar partículas
    plot(cx, cy, '.r')
    hold on
end
axis([0 15 0 12])


% Partícula en donde se cualcula el campo 
particulaCampo = input("Particula a calcular: ");

% Constante
k = 8.99 * 10^9; % Nm^2/C^2

e = 0; % Total campo eléctrico
for i = 1:n
    distancia = ((vcor(particulaCampo, 1) - vcor(i, 1))^2 + ...
    (vcor(particulaCampo, 2) - vcor(i, 2))^2)^(1/2); 

    %{ 
        Agregar Vecotor Unitario para el cálculo correcto;
        theta = arctan(); 
    %} 
    
    if distancia ~= 0
        e = e + k * vc(particulaCampo) * vc(i) / distancia^2;  
        disp(e)
    end
end

