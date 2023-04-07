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

% 1. Ingresar/Cargar Coordenadas y Carga eléctrica de cada partícula

prueba = input("Tipo de prueba: ");
[n, vCoordenadas, vCargas] = tipoPrueba(prueba);


% 2. Calculos y gráficos de campo Eléctrico

% Preguntar si se Calcula para Particula de Prueba o Particula Existente
particulaPrueba = input("Particula existente (E) o de prueba (P): ", "s");

% Coordenadas en donde se halla/cualcula el campo eléctrico de partícual de prueba
if particulaPrueba == "P" || particulaPrueba == "p"
    % Coordenada partícula de prueba en donde se calcula Campo Eléctrico
    coordenadaCampoX = input("Coordenada X: ");
    coordenadaCampoY = input("Coordenada Y: ");
    
    % Almacenamiento de coordenadas de particula prueba en arreglo de coordenadas de partículas existentes
    vCoordenadas(end + 1, 1) = coordenadaCampoX;
    vCoordenadas(end, 2) = coordenadaCampoY;
    
    % Añadir carga de prueba a vector de cargas q = 1
    vCargas(end + 1) = 1;
    
    % Aumentar número de partículas/ se agrega la de prueba
    n = n + 1;
    
    % Partícula en que se evalua el campo es la última en el arreglo (Posición: n)
    particulaCampo = n;
else
    % Particula en donde se calculará el campo eléctrico si NO es partícula de prueba
    particulaCampo = input("Particula a calcular campo E: ");
end


% Graficación de partículas
graficoCoordenadas(vCoordenadas, vCargas, n, 2)


% Calculo vectorial campo Eléctrico (X, Y)
[campoElectricoX,campoElectricoY, campoElectricoZ] = campoElectrico(vCoordenadas, vCargas, particulaCampo, n);


% Graficación vectores campo eléctrico en la partícula

% Creación de matriz repitiendo coordenada X - Y en donde inicia el vector
xp = repmat(vCoordenadas(particulaCampo,1), 1, n);
yp = repmat(vCoordenadas(particulaCampo,2), 1, n);

% Función graficadora de vectores de campo eléctrico
graficoVectores(xp, yp, campoElectricoX, campoElectricoY);


% Calculo magnitud de campo eléctrico
[magnitudCampoE, Ex_num, Ey_num, ~] = magnitudCampo(campoElectricoX, campoElectricoY, campoElectricoZ);
              
disp("Magnitud campo eléctrico en (" + ...
    vCoordenadas(particulaCampo,1) + ", " + vCoordenadas(particulaCampo,2) ...
    + "): " + magnitudCampoE) % Agregar unidades?

% Vector resultante graficado
quiver(xp(1), yp(1), Ex_num, Ey_num, 'color', 'k')





%% 3D

clc
clear

% 1. Cargar Coordenadas y Carga eléctrica de cada partícula

prueba = input("Tipo de prueba: ");
[n, vCoordenadas, vCargas] = tipoPrueba3(prueba);


% 2. Calcular y gráficar campo eléctrico

% Preguntar si se Calcula para Particula de Prueba o Particula Existente
particulaPrueba = input("Particula existente (E) o de prueba (P): ", "s");

% Coordenadas en donde se halla/cualcula el campo eléctrico de partícual de prueba
if particulaPrueba == "P" || particulaPrueba == "p"
    % Coordenada partícula de prueba en donde se calcula Campo Eléctrico
    coordenadaCampoX = input("Coordenada X: ");
    coordenadaCampoY = input("Coordenada Y: ");
    coordenadaCampoZ = input("Coordenada Z: ");
    
    % Almacenamiento de coordenadas de particula prueba en arreglo de coordenadas de partículas existentes
    vCoordenadas(end + 1, 1) = coordenadaCampoX;
    vCoordenadas(end, 2) = coordenadaCampoY;
    vCoordenadas(end, 3) = coordenadaCampoZ;
    
    % Añadir carga de prueba a vector de cargas q = 1
    vCargas(end + 1) = 1;
    
    % Aumentar número de partículas / se agrega la partícula de prueba
    n = n + 1;
    
    % Partícula en que se evalua el campo es la última en el arreglo (Posición: n)
    particulaCampo = n;
else
    % Partícula en donde se calculará el campo eléctrico si NO es partícula de prueba
    particulaCampo = input("Particula a calcular campo E: ");
end


% Graficación de partículas
graficoCoordenadas(vCoordenadas, vCargas, n, 3)


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
[magnitudCampoE, Ex_num, Ey_num, Ez_num] = magnitudCampo(campoElectricoX, campoElectricoY, campoElectricoZ);

disp("Magnitud campo eléctrico en (" + ...
    vCoordenadas(particulaCampo,1) + ", " + vCoordenadas(particulaCampo,2) + ", " + vCoordenadas(particulaCampo, 3) ...
    + "): " + magnitudCampoE) % Agregar unidades?

% Vector resultante graficado
quiver3(xp(1), yp(1), zp(1), Ex_num, Ey_num, Ez_num, 'color', 'k')




